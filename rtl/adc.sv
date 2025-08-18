`ifdef __ICARUS__
`timescale 1ns/1ps
`endif


module adc #(
    parameter integer RESOLUTION     = 8 //! ADC resolution in bits
  ) (
    input  logic                    clk_i,    //! Clock input
    input  logic                    start_i,  //! Start signal for ADC conversion
    input  logic                    rst_ni,   //! Active low reset signal

    input  logic                    comp_p_i, //! Positive side comparator input
    input  logic                    comp_n_i, //! Negative side comparator input

    output logic                    compare_o, //! Enable signal for comparator

    output logic                    sample_o, //! Sample signal indicating ADC is sampling
    output logic [RESOLUTION-2:0]   dac_p_o,  //! Positive Digital-to-Analog Converter output
    output logic [RESOLUTION-2:0]   dac_n_o,  //! Negative Digital-to-Analog Converter output

    output logic                    rdy_o,    //! Ready signal indicating conversion is done
    output logic [RESOLUTION-1:0]   result_o  //! Result of the ADC conversion
  );

  initial
  begin
    $dumpfile("adc.fst");
    $dumpvars(1, adc);
  end

  typedef enum logic [1:0] { //! State machine states
            IDLE,
            SAMPLE,
            CONVERT
          } state_t;
  state_t state_q, state_d;

  typedef logic [RESOLUTION-1:0] data_t; //! Data type for DAC outputs and results
  data_t dac_p_q, dac_p_d;
  data_t dac_n_q, dac_n_d;
  data_t mask_q, mask_d;
  data_t result_q, result_d;
  data_t result_o_q, result_o_d;


  // Comparator input signals:
  // - vip > vin: comp_p_i = 1, comp_n_i = 0
  // - vip < vin: comp_p_i = 0, comp_n_i = 1
  logic comp_q;        // last valid value
  logic comp_now;      // value used this cycle

  always_comb begin
    case ({comp_p_i, comp_n_i})
      2'b10:  comp_now = 1'b1;          // vip > vin
      2'b01:  comp_now = 1'b0;          // vip < vin
      default: comp_now = comp_q;       // 11 or 00 -> hold last
    endcase
  end


  logic rdy_q, rdy_d; //! Ready signal indicating conversion is complete

  always_ff @(posedge clk_i or negedge rst_ni) //! Registers for state and data
  begin: regs
    if (!rst_ni)
    begin
      state_q <= IDLE;
      dac_p_q <= {RESOLUTION{1'b0}};
      dac_n_q <= {RESOLUTION{1'b0}};
      mask_q <= {RESOLUTION{1'b0}};
      result_q <= {RESOLUTION{1'b0}};
      result_o_q <= {RESOLUTION{1'b0}};
      comp_q <= 1'b0;
      rdy_q <= 1'b0;
    end
    else
    begin
      state_q <= state_d;
      dac_p_q <= dac_p_d;
      dac_n_q <= dac_n_d;
      mask_q <= mask_d;
      result_q <= result_d;
      result_o_q <= result_o_d;
      comp_q <= comp_now;
      rdy_q <= rdy_d;
    end
  end

  always_comb //! Combinational logic for the state machine
  begin: fsm_logic
    state_d = state_q;

    case (state_q)
      IDLE:
        if (start_i)
        begin
          // Transition to SAMPLE state on start signal
          state_d = SAMPLE;
        end

      SAMPLE:
        state_d = CONVERT;

      CONVERT:
        if (mask_q == 1)
        begin
          if (start_i)
          begin
            // If start signal is asserted again, reset and go back to SAMPLE state
            // (restart mode)
            state_d = SAMPLE;
          end
          else
            // Otherwise, go back to IDLE state
            // (normal mode)
            state_d = IDLE;
        end

      default:
        state_d = IDLE;
    endcase
  end

  always_comb //! Combinational logic for the SAR logic
  begin: sar_logic
    dac_p_d = dac_p_q;
    dac_n_d = dac_n_q;
    mask_d = mask_q;
    result_d = result_q;
    result_o_d = result_o_q;
    rdy_d = rdy_q;

    case (state_q)
      IDLE:
      begin
        // Keep outputs low in IDLE state
        dac_p_d = {RESOLUTION{1'b0}}; // Reset DAC outputs
        dac_n_d = {RESOLUTION{1'b0}};
      end

      SAMPLE:
      begin
        // Check comparator output and flip DAC outputs accordingly
        result_d = 0;
        mask_d = (1 << (RESOLUTION - 1));

        // Reset ready signal
        rdy_d = 0;
      end

      CONVERT:
      begin
        // Check comparator output and flip DAC outputs accordingly
        if (comp_now)
        begin
          dac_p_d = dac_p_q ^ (mask_q >> 1);
        end
        else
        begin
          dac_n_d = dac_n_q ^ (mask_q >> 1);
        end

        // Update result based on comparator output
        result_d = result_q | (comp_now ? mask_q : 0);

        // Shift mask for next bit
        mask_d >>= 1;

        // Check for last bit
        if (mask_q == 1)
        begin
          // If mask is at last bit, transition to next state
          result_o_d = result_d;
          rdy_d = 1;
          dac_p_d = {RESOLUTION{1'b0}}; // Reset DAC outputs
          dac_n_d = {RESOLUTION{1'b0}};
        end
      end
    endcase
  end

  // Output assignments
  assign sample_o = (state_q == SAMPLE) || (mask_q == (1 << (RESOLUTION - 1)));
  assign compare_o = (state_q == CONVERT);
  assign rdy_o = rdy_q;
  assign dac_p_o = dac_p_q;
  assign dac_n_o = dac_n_q;
  assign result_o = result_o_q;

endmodule
