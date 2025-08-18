v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -440 0 -440 50 {lab=VDD}
N 260 0 440 0 {lab=VDD}
N 440 0 440 50 {lab=VDD}
N 260 0 260 50 {lab=VDD}
N 80 0 260 0 {lab=VDD}
N 80 0 80 50 {lab=VDD}
N 0 -0 80 0 {lab=VDD}
N -80 0 -80 50 {lab=VDD}
N -260 0 -80 0 {lab=VDD}
N -260 0 -260 50 {lab=VDD}
N -440 0 -260 0 {lab=VDD}
N -260 80 -260 100 {lab=OUT1}
N -260 100 -80 100 {lab=OUT1}
N -80 80 -80 100 {lab=OUT1}
N 80 80 80 100 {lab=OUT2}
N 80 100 260 100 {lab=OUT2}
N 260 80 260 100 {lab=OUT2}
N -80 100 -30 100 {lab=OUT1}
N -30 100 20 50 {lab=OUT1}
N 20 50 40 50 {lab=OUT1}
N -40 50 -20 50 {lab=OUT2}
N -20 50 30 100 {lab=OUT2}
N 30 100 80 100 {lab=OUT2}
N 300 50 380 50 {lab=CLK}
N 380 50 380 60 {lab=CLK}
N 380 60 480 60 {lab=CLK}
N 480 50 480 60 {lab=CLK}
N -480 50 -480 60 {lab=CLK}
N -480 60 -380 60 {lab=CLK}
N -380 50 -380 60 {lab=CLK}
N -380 50 -300 50 {lab=CLK}
N -80 180 -80 200 {lab=OUT1}
N 80 180 80 200 {lab=OUT2}
N -40 230 -20 230 {lab=OUT2}
N -20 230 30 180 {lab=OUT2}
N 30 180 80 180 {lab=OUT2}
N 80 140 80 180 {lab=OUT2}
N 20 230 40 230 {lab=OUT1}
N -30 180 20 230 {lab=OUT1}
N -80 180 -30 180 {lab=OUT1}
N -80 140 -80 180 {lab=OUT1}
N -0 380 80 380 {lab=S}
N -0 380 -0 400 {lab=S}
N -80 380 -0 380 {lab=S}
N -0 430 0 540 {lab=VSS}
N 80 280 80 300 {lab=N}
N -80 100 -80 140 {lab=OUT1}
N 280 140 320 140 {lab=OUT2}
N 80 100 80 140 {lab=OUT2}
N -560 50 -480 50 {lab=CLK}
N 480 50 560 50 {lab=CLK}
N 440 80 440 280 {lab=N}
N 80 280 440 280 {lab=N}
N -120 430 -40 430 {lab=CLK}
N 0 -80 0 -0 {lab=VDD}
N -80 0 0 -0 {lab=VDD}
N -80 280 -80 300 {lab=P}
N 80 260 80 280 {lab=N}
N -80 360 -80 380 {lab=S}
N 80 360 80 380 {lab=S}
N 20 330 80 330 {lab=VSS}
N -80 330 -20 330 {lab=VSS}
N 80 230 150 230 {lab=VSS}
N -150 230 -80 230 {lab=VSS}
N 120 330 200 330 {lab=IN2}
N -200 330 -120 330 {lab=IN1}
N -280 140 -80 140 {lab=OUT1}
N -280 140 -280 160 {lab=OUT1}
N -320 140 -280 140 {lab=OUT1}
N -280 220 -280 240 {lab=VSS}
N 280 140 280 160 {lab=OUT2}
N 280 220 280 240 {lab=VSS}
N 80 140 280 140 {lab=OUT2}
N -440 280 -80 280 {lab=P}
N -80 260 -80 280 {lab=P}
N -440 80 -440 280 {lab=P}
N -440 360 -440 380 {lab=VSS}
N 440 360 440 380 {lab=VSS}
N -440 280 -440 300 {lab=P}
N 440 280 440 300 {lab=N}
N 140 380 140 420 {lab=S}
N 80 380 140 380 {lab=S}
N 140 480 140 520 {lab=VSS}
C {sg13g2_pr/sg13_lv_pmos.sym} -460 50 0 0 {name=M1
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -60 50 0 1 {name=M3
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 60 50 0 0 {name=M4
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -60 230 0 1 {name=M8
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -100 330 0 0 {name=M9
l=0.13u
w=12u
ng=6
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 430 0 0 {name=M11
l=2u
w=4u
ng=2
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {ipin.sym} -120 430 0 0 {name=p3 lab=CLK}
C {ipin.sym} -200 330 0 0 {name=p4 lab=IN1}
C {ipin.sym} 200 330 2 0 {name=p5 lab=IN2}
C {opin.sym} 320 140 0 0 {name=p6 lab=OUT2}
C {opin.sym} -320 140 2 0 {name=p7 lab=OUT1}
C {ipin.sym} 0 540 3 0 {name=p8 lab=VSS}
C {ipin.sym} 0 -80 1 0 {name=p9 lab=VDD}
C {lab_wire.sym} 20 330 0 0 {name=p10 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -20 330 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -150 230 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 150 230 2 0 {name=p13 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -560 50 0 0 {name=p1 sig_type=std_logic lab=CLK}
C {lab_wire.sym} 560 50 0 0 {name=p2 sig_type=std_logic lab=CLK}
C {sg13g2_pr/sg13_lv_nmos.sym} 100 330 0 1 {name=M10
l=0.13u
w=12u
ng=6
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -280 50 0 0 {name=M2
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 460 50 0 1 {name=M5
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 280 50 0 1 {name=M6
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 60 230 0 0 {name=M7
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/cap_cmim.sym} -280 190 0 0 {name=C2
model=cap_cmim
w=1.8e-6
l=1.8e-6
m=1
spiceprefix=X}
C {lab_wire.sym} -280 240 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {sg13g2_pr/cap_cmim.sym} 280 190 0 0 {name=C4
model=cap_cmim
w=1.8e-6
l=1.8e-6
m=1
spiceprefix=X}
C {lab_wire.sym} 280 240 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -200 280 0 0 {name=p18 sig_type=std_logic lab=P}
C {lab_wire.sym} 200 280 0 0 {name=p19 sig_type=std_logic lab=N}
C {lab_wire.sym} 30 380 0 0 {name=p20 sig_type=std_logic lab=S}
C {sg13g2_pr/cap_cmim.sym} -440 330 0 0 {name=C1
model=cap_cmim
w=3e-6
l=3e-6
m=1
spiceprefix=X}
C {lab_wire.sym} -440 380 0 0 {name=p15 sig_type=std_logic lab=VSS}
C {sg13g2_pr/cap_cmim.sym} 440 330 0 0 {name=C3
model=cap_cmim
w=3e-6
l=3e-6
m=1
spiceprefix=X}
C {lab_wire.sym} 440 380 0 0 {name=p16 sig_type=std_logic lab=VSS}
C {capa.sym} 140 450 0 0 {name=C5
m=1
value=25f
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 140 520 0 0 {name=p21 sig_type=std_logic lab=VSS}
