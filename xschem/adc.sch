v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -160 -50 -120 -50 {lab=#net1}
N -160 -30 -120 -30 {lab=rst_ni}
N -160 -10 -120 -10 {lab=start_i}
N 120 80 160 80 {lab=result_o[0..7]}
N 120 60 160 60 {lab=ready_o}
N 120 -60 160 -60 {lab=sample_en}
N -390 -950 -320 -950 {lab=pos_ai}
N -260 -890 -260 -870 {lab=sample}
N -280 -1030 -280 -1010 {lab=VDD}
N -240 -1030 -240 -1010 {lab=VSS}
N -390 -650 -320 -650 {lab=neg_ai}
N -260 -590 -260 -570 {lab=sample}
N -280 -730 -280 -710 {lab=VDD}
N -240 -730 -240 -710 {lab=VSS}
N 40 -740 40 -720 {lab=VSS}
N 40 -880 40 -860 {lab=VDD}
N -100 -480 -60 -480 {lab=pos}
N -100 -820 -100 -480 {lab=pos}
N -100 -820 -40 -820 {lab=pos}
N -100 -950 -100 -820 {lab=pos}
N -200 -950 -100 -950 {lab=pos}
N -200 -650 -140 -650 {lab=neg}
N -140 -650 -140 -400 {lab=neg}
N -140 -400 -60 -400 {lab=neg}
N -140 -780 -140 -650 {lab=neg}
N -140 -780 -40 -780 {lab=neg}
N 40 -560 40 -540 {lab=VDD}
N 40 -340 40 -320 {lab=VSS}
N 120 0 160 0 {lab=dac_p[0..6]}
N 120 20 160 20 {lab=dac_n[0..6]}
N 120 -820 160 -820 {lab=dac_p[0..6]}
N 120 -780 160 -780 {lab=dac_n[0..6]}
N -160 30 -120 30 {lab=comp_p}
N -160 50 -120 50 {lab=comp_n}
N 120 -460 160 -460 {lab=comp_1}
N 120 -420 160 -420 {lab=comp_2}
N 440 -550 460 -550 {lab=comp_1}
N 440 -600 440 -550 {lab=comp_1}
N 440 -650 460 -650 {lab=comp_1}
N 500 -700 500 -650 {lab=VDD}
N 500 -600 500 -580 {lab=comp_p}
N 500 -550 500 -500 {lab=VSS}
N 440 -230 460 -230 {lab=comp_2}
N 440 -280 440 -230 {lab=comp_2}
N 440 -330 460 -330 {lab=comp_2}
N 500 -380 500 -330 {lab=VDD}
N 500 -280 500 -260 {lab=comp_n}
N 500 -230 500 -180 {lab=VSS}
N 400 -600 440 -600 {lab=comp_1}
N 440 -650 440 -600 {lab=comp_1}
N 400 -280 440 -280 {lab=comp_2}
N 440 -330 440 -280 {lab=comp_2}
N 500 -280 540 -280 {lab=comp_n}
N 500 -300 500 -280 {lab=comp_n}
N 500 -600 540 -600 {lab=comp_p}
N 500 -620 500 -600 {lab=comp_p}
N -840 -340 -800 -340 {lab=clk_sample_i}
N -840 -300 -800 -300 {lab=sample_en}
N -420 -300 -400 -300 {lab=#net2}
N -400 -300 -400 -240 {lab=#net2}
N -620 -240 -400 -240 {lab=#net2}
N -620 -300 -620 -240 {lab=#net2}
N -620 -300 -600 -300 {lab=#net2}
N -660 -280 -600 -280 {lab=rst_ni}
N -420 -320 -360 -320 {lab=sample}
N -680 -320 -600 -320 {lab=#net3}
N -260 -50 -220 -50 {lab=clk_digital_i}
N -440 -420 -400 -420 {lab=compare_en}
N -440 -460 -400 -460 {lab=clk_comp_i}
N 120 -40 160 -40 {lab=compare_en}
N -280 -440 -60 -440 {lab=compare}
C {./tgate.sym} -260 -950 0 0 {name=x1}
C {ipin.sym} -390 -950 0 0 {name=p1 lab=pos_ai}
C {ipin.sym} -260 -50 0 0 {name=p2 lab=clk_digital_i}
C {ipin.sym} -400 160 0 0 {name=p5 lab=VSS}
C {ipin.sym} -400 140 0 0 {name=p6 lab=VDD}
C {ipin.sym} -160 -10 0 0 {name=p21 lab=start_i}
C {opin.sym} 160 60 0 0 {name=p26 lab=ready_o}
C {opin.sym} 160 80 0 0 {name=p27 lab=result_o[0..7]}
C {adc_vlog.sym} 0 0 0 0 {name=a1 model=adc
device_model=".model adc d_cosim simulation=\\"ivlng\\" sim_args=[\\"adc\\"]"}
C {lab_pin.sym} -260 -870 3 0 {name=p18 sig_type=std_logic lab=sample}
C {lab_pin.sym} 160 -60 2 0 {name=p34 sig_type=std_logic lab=sample_en}
C {ipin.sym} -440 -460 0 0 {name=p3 lab=clk_comp_i}
C {./comparator.sym} 40 -440 0 0 {name=x2}
C {lab_pin.sym} -280 -1030 1 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -240 -1030 1 0 {name=p8 sig_type=std_logic lab=VSS}
C {./tgate.sym} -260 -650 0 0 {name=x3}
C {ipin.sym} -390 -650 0 0 {name=p13 lab=neg_ai}
C {lab_pin.sym} -260 -570 3 0 {name=p14 sig_type=std_logic lab=sample}
C {lab_pin.sym} -280 -730 1 0 {name=p17 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -240 -730 1 0 {name=p28 sig_type=std_logic lab=VSS}
C {./cdac.sym} 40 -800 0 0 {name=x4}
C {lab_pin.sym} 40 -720 3 0 {name=p37 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 40 -880 1 0 {name=p38 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -60 -820 0 0 {name=p12 sig_type=std_logic lab=pos}
C {lab_wire.sym} -60 -780 0 0 {name=p29 sig_type=std_logic lab=neg}
C {lab_pin.sym} 40 -320 3 0 {name=p30 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 40 -560 1 0 {name=p31 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 160 0 2 0 {name=p10 sig_type=std_logic lab=dac_p[0..6]}
C {lab_pin.sym} 160 20 2 0 {name=p11 sig_type=std_logic lab=dac_n[0..6]}
C {lab_pin.sym} 160 -820 2 0 {name=p19 sig_type=std_logic lab=dac_p[0..6]}
C {lab_pin.sym} 160 -780 2 0 {name=p20 sig_type=std_logic lab=dac_n[0..6]}
C {lab_pin.sym} -160 30 0 0 {name=p22 sig_type=std_logic lab=comp_p}
C {lab_pin.sym} -160 50 0 0 {name=p23 sig_type=std_logic lab=comp_n}
C {lab_pin.sym} 160 -460 2 0 {name=p24 sig_type=std_logic lab=comp_1}
C {lab_pin.sym} 160 -420 2 0 {name=p25 sig_type=std_logic lab=comp_2}
C {sg13g2_pr/sg13_lv_nmos.sym} 480 -550 0 0 {name=M5
l=0.13u
w=1.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 480 -650 0 0 {name=M6
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 480 -230 0 0 {name=M7
l=0.13u
w=1.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 480 -330 0 0 {name=M8
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 500 -700 1 0 {name=p32 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 500 -380 1 0 {name=p33 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 500 -180 3 0 {name=p36 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 500 -500 3 0 {name=p39 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 400 -600 0 0 {name=p40 sig_type=std_logic lab=comp_1}
C {lab_pin.sym} 400 -280 0 0 {name=p41 sig_type=std_logic lab=comp_2}
C {lab_pin.sym} 540 -600 2 0 {name=p42 sig_type=std_logic lab=comp_p}
C {lab_pin.sym} 540 -280 2 0 {name=p43 sig_type=std_logic lab=comp_n}
C {ipin.sym} -840 -340 0 0 {name=p4 lab=clk_sample_i}
C {lab_pin.sym} -360 -320 2 0 {name=p16 sig_type=std_logic lab=sample}
C {lab_pin.sym} -840 -300 0 0 {name=p35 sig_type=std_logic lab=sample_en}
C {ipin.sym} -400 120 0 0 {name=p9 lab=rst_ni}
C {lab_pin.sym} -160 -30 0 0 {name=p15 sig_type=std_logic lab=rst_ni}
C {sg13g2_stdcells/sg13g2_dfrbp_1.sym} -510 -300 0 0 {name=x6 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {lab_pin.sym} -660 -280 0 0 {name=p44 sig_type=std_logic lab=rst_ni}
C {sg13g2_stdcells/sg13g2_and2_1.sym} -740 -320 0 0 {name=x5 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {adc_bridge.sym} -190 -50 0 0 {name=A2 adc_bridge_model=adc_buff_clk}
C {sg13g2_stdcells/sg13g2_and2_1.sym} -340 -440 0 0 {name=x7 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {lab_pin.sym} 160 -40 2 0 {name=p45 sig_type=std_logic lab=compare_en}
C {lab_pin.sym} -440 -420 0 0 {name=p46 sig_type=std_logic lab=compare_en}
C {lab_wire.sym} -160 -440 0 0 {name=p47 sig_type=std_logic lab=compare}
