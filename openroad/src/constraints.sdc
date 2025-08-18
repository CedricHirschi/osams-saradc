# Copyright 2024 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51

# Authors:
# - Philippe Sauter <phsauter@iis.ee.ethz.ch>

# Backend constraints

############
## Global ##
############

set TCK_SYS 12.5
set TDENSITY 0.45

set_thread_count 8

#############################
## Driving Cells and Loads ##
#############################

# Default light digital load for most outputs
set_load 1.0 [all_outputs]

# Heavier loads for analog interface signals that might drive off-chip
set_load 5.0 [get_ports compare_o]
set_load 5.0 [get_ports sample_o]

# DAC outputs drive analog circuits, moderate load
set_load 3.0 [get_ports dac_p_o_*]
set_load 3.0 [get_ports dac_n_o_*]

# Digital result outputs - light load (on-chip digital processing)
set_load 1.0 [get_ports result_o_*]
set_load 1.0 [get_ports rdy_o]

# # Input driving cells - keep as GPIO pads
# set_driving_cell [all_inputs] -lib_cell sg13g2_IOPadOut16mA -pin pad


##################
## Input Clocks ##
##################
puts "Clocks..."

# We target 80 MHz for this complex ADC design
create_clock -name clk_sys -period $TCK_SYS [get_ports clk_i]


##################################
## Clock Groups & Uncertainties ##
##################################

# Define which clocks are asynchronous to each other
# -allow_paths re-activates timing checks between asyncs -> we must constrain CDCs!
set_clock_groups -asynchronous -name clk_groups_async -group {clk_sys}

# We set reasonable uncertainties in their transistion timing
# and transition (rise/fall) times for all clocks (ns)
set_clock_uncertainty 0.1 [all_clocks]
set_clock_transition  0.2 [all_clocks]


#############
## SoC Ins ##
#############
puts "Input/Outputs..."

# Reset should propagate to system domain within a clock cycle.
set_input_delay -max [ expr $TCK_SYS * 0.10 ] [get_ports rst_ni]  
set_false_path -hold   -from [get_ports rst_ni]
set_max_delay $TCK_SYS -from [get_ports rst_ni]

# ADC input constraints
set_input_delay  -max [ expr $TCK_SYS * 0.30 ] -clock clk_sys [get_ports start_i]
set_input_delay  -min [ expr $TCK_SYS * 0.05 ] -clock clk_sys [get_ports start_i]

# Comparator inputs - these are analog signals, can be asynchronous to clock
set_false_path -from [get_ports comp_p_i]
set_false_path -from [get_ports comp_n_i]

# ADC output constraints - more relaxed for control signals
set_output_delay -max [ expr $TCK_SYS * 0.30 ] -clock clk_sys [get_ports compare_o]
set_output_delay -min [ expr $TCK_SYS * 0.05 ] -clock clk_sys [get_ports compare_o]

# Sample signal can be multi-cycle since it's a control signal
set_output_delay -max [ expr $TCK_SYS * 0.20 ] -clock clk_sys [get_ports sample_o]
set_output_delay -min [ expr $TCK_SYS * 0.05 ] -clock clk_sys [get_ports sample_o]
set_multicycle_path -setup 2 -to [get_ports sample_o]
set_multicycle_path -hold  1 -to [get_ports sample_o]

set_output_delay -max [ expr $TCK_SYS * 0.30 ] -clock clk_sys [get_ports rdy_o]
set_output_delay -min [ expr $TCK_SYS * 0.05 ] -clock clk_sys [get_ports rdy_o]

# DAC output buses - these are analog control signals, can be multi-cycle
set_output_delay -max [ expr $TCK_SYS * 0.20 ] -clock clk_sys [get_ports dac_p_o_*]
set_output_delay -min [ expr $TCK_SYS * 0.05 ] -clock clk_sys [get_ports dac_p_o_*]
set_multicycle_path -setup 2 -to [get_ports dac_p_o_*]
set_multicycle_path -hold  1 -to [get_ports dac_p_o_*]

set_output_delay -max [ expr $TCK_SYS * 0.20 ] -clock clk_sys [get_ports dac_n_o_*]
set_output_delay -min [ expr $TCK_SYS * 0.05 ] -clock clk_sys [get_ports dac_n_o_*]
set_multicycle_path -setup 2 -to [get_ports dac_n_o_*]
set_multicycle_path -hold  1 -to [get_ports dac_n_o_*]

# Result output bus - main ADC output, keep tighter timing
set_output_delay -max [ expr $TCK_SYS * 0.30 ] -clock clk_sys [get_ports result_o_*]
set_output_delay -min [ expr $TCK_SYS * 0.05 ] -clock clk_sys [get_ports result_o_*]
