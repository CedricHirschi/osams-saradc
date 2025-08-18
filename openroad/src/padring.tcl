# Copyright (c) 2024 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Authors:
# - Philippe Sauter <phsauter@iis.ee.ethz.ch>

# Pin placement for ADC design (part of analog system, no actual I/O pads needed)
# This creates pin assignments around the die perimeter for routing access

utl::report "Placing I/O pins"

# Set pin length for better routing
set_pin_length -hor_length 2.0 -ver_length 2.0

# Set pin constraints based on pin function
set_io_pin_constraint -pin_names {clk_i rst_ni} -region bottom:*
set_io_pin_constraint -pin_names {start_i rdy_o} -region bottom:*
set_io_pin_constraint -pin_names {comp_p_i comp_n_i compare_o} -region top:*
set_io_pin_constraint -pin_names {sample_o} -region right:*
set_io_pin_constraint -pin_names {dac_p_o_0_ dac_p_o_1_ dac_p_o_2_ dac_p_o_3_ dac_p_o_4_ dac_p_o_5_ dac_p_o_6_} -region right:* -group -order
set_io_pin_constraint -pin_names {dac_n_o_0_ dac_n_o_1_ dac_n_o_2_ dac_n_o_3_ dac_n_o_4_ dac_n_o_5_ dac_n_o_6_} -region right:* -group -order
set_io_pin_constraint -pin_names {result_o_0_ result_o_1_ result_o_2_ result_o_3_ result_o_4_ result_o_5_ result_o_6_ result_o_7_} -region bottom:* -group -order

# Place all pins with appropriate metal layers
# Use Metal1 for pin placement to ensure proper access points for standard cells
place_pins -hor_layers Metal1 -ver_layers Metal2 -corner_avoidance 5.0 -min_distance 2.0
