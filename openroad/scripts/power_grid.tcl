# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51

# Authors:
# - Tobias Senti <tsenti@ethz.ch>
# - Jannis Schönleber <janniss@iis.ee.ethz.ch>
# - Philippe Sauter   <phsauter@iis.ee.ethz.ch>

# Power planning

utl::report "Power Grid"
# ToDo: Check connectivity on left and right power pad cells
source scripts/floorplan_util.tcl

##########################################################################
# Reset
##########################################################################

if {[info exists power_grid_defined]} {
    pdngen -ripup
    pdngen -reset
} else {
    set power_grid_defined 1
}


##########################################################################
##  Power settings
##########################################################################
# Core Power Ring
## Space between pads and core -> used for power ring
set PowRingSpace  1
## Spacing must meet TM2 rules
set pgcrSpacing 2
## Width must meet TM2 rules
set pgcrWidth 2
## Offset from core to power ring
set pgcrOffset [expr ($PowRingSpace - $pgcrSpacing - 2 * $pgcrWidth) / 2]

# Metal4 Core Power Grid - Using Metal4 instead of TopMetal2 for simple designs
# Metal4 has 0.42um pitch, much finer than TopMetal2's 4um pitch
set tpg2Width     2; # conservative width for single stripe
set tpg2Pitch   50; # not used with single stripe but kept for reference
set tpg2Spacing   5; # not used with single stripe
set tpg2Offset    5; # small offset from core edge


##########################################################################
##  Core Power
##########################################################################
# Top 1 - Top 2
add_pdn_ring -grid {core_grid} \
    -layer        {TopMetal1 TopMetal2} \
    -widths       "$pgcrWidth $pgcrWidth" \
    -spacings     "$pgcrSpacing $pgcrSpacing" \
    -add_connect \
    -core_offsets "$pgcrOffset $pgcrOffset"

# M1 Standardcell Rows (tracks)
add_pdn_stripe -grid {core_grid} -layer {Metal1} -width {0.44} -offset {0} \
    -followpins -extend_to_core_ring

# # Top power grid
# # Top 2 Stripe
# add_pdn_stripe -grid {core_grid} -layer {TopMetal2} -width $tpg2Width \
#     -pitch $tpg2Pitch -spacing $tpg2Spacing -offset $tpg2Offset \
#     -extend_to_core_ring -snap_to_grid -number_of_straps 7 \
#     -starts_with POWER

# # Add vertical Metal2 straps to connect standard-cell rails (Metal1) up to the ring
# add_pdn_stripe -grid {core_grid} -layer {Metal2} -width {0.6} \
#     -pitch {30} -offset {15} \
#     -extend_to_core_ring -snap_to_grid \
#     -starts_with POWER

# "The add_pdn_connect command is used to define which layers in the power grid are to be connected together.
#  During power grid generation, vias will be added for overlapping power nets and overlapping ground nets."
# M1 is declared vertical but tracks still horizontal
# vertical TopMetal2 to below horizonals (M1 has horizontal power tracks)
add_pdn_connect -grid {core_grid} -layers {TopMetal2 Metal1}
add_pdn_connect -grid {core_grid} -layers {TopMetal2 Metal2}
add_pdn_connect -grid {core_grid} -layers {Metal2 Metal1}
# add_pdn_connect -grid {core_grid} -layers {TopMetal2 Metal4}
# add_pdn_connect -grid {core_grid} -layers {TopMetal2 TopMetal1}
# power ring to standard cell rails (no M3 in this grid)


##########################################################################
##  Generate
##########################################################################
pdngen -failed_via_report ${report_dir}/${log_id_str}_${proj_name}_pdngen.rpt
