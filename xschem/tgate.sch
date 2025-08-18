v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -280 260 -260 260 {lab=CTRL}
N -280 200 -280 260 {lab=CTRL}
N -320 260 -280 260 {lab=CTRL}
N -280 200 -260 200 {lab=CTRL}
N -180 200 -140 200 {lab=ctrl_i}
N -180 260 -140 260 {lab=ctrl_ni}
N -50 100 -30 100 {lab=A}
N 50 0 100 0 {lab=B}
N 50 -100 50 0 {lab=B}
N 50 0 50 100 {lab=B}
N -50 0 -50 100 {lab=A}
N 0 -100 0 -30 {lab=VSS}
N 0 30 0 100 {lab=VDD}
N -50 -100 -30 -100 {lab=A}
N 0 140 0 170 {lab=ctrl_ni}
N 0 -170 0 -140 {lab=ctrl_i}
N 30 -100 50 -100 {lab=B}
N 30 100 50 100 {lab=B}
N -90 0 -50 0 {lab=A}
N -50 -100 -50 0 {lab=A}
C {sg13g2_stdcells/sg13g2_inv_1.sym} -220 260 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {ipin.sym} -320 260 0 0 {name=p1 lab=CTRL}
C {ipin.sym} -160 -260 0 0 {name=p5 lab=VDD}
C {ipin.sym} -160 -240 0 0 {name=p6 lab=VSS}
C {sg13g2_stdcells/sg13g2_buf_1.sym} -220 200 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {lab_pin.sym} -140 200 2 0 {name=p10 sig_type=std_logic lab=ctrl_i}
C {lab_pin.sym} -140 260 2 0 {name=p11 sig_type=std_logic lab=ctrl_ni}
C {iopin.sym} 100 0 0 0 {name=p2 lab=B}
C {iopin.sym} -90 0 2 0 {name=p3 lab=A}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 -120 1 0 {name=M3
l=0.13u
w=3.41u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 120 1 1 {name=M1
l=0.13u
w=8.82u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_wire.sym} 0 -30 2 0 {name=p7 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 0 30 0 1 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 0 -170 1 0 {name=p12 sig_type=std_logic lab=ctrl_i}
C {lab_pin.sym} 0 170 3 0 {name=p14 sig_type=std_logic lab=ctrl_ni}
