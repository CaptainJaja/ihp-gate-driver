v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Simple CMOS inverter} -30 -320 0 0 0.4 0.4 {}
N 40 -60 40 -30 {lab=OUT}
N 40 -60 200 -60 {lab=OUT}
N 40 -90 40 -60 {lab=OUT}
N 40 -240 100 -240 {lab=VDD}
N 100 -180 100 -120 {lab=#net1}
N 40 -120 100 -120 {lab=#net1}
N 40 -240 40 -150 {lab=VDD}
N -0 -120 -0 -0 {lab=IN}
N 40 30 40 50 {lab=VSS}
N 40 -0 150 0 {lab=#net2}
N 40 120 150 120 {lab=#net2}
N 150 -0 150 120 {lab=#net2}
N 40 110 40 120 {lab=#net2}
C {sg13g2_pr/sg13_lv_nmos.sym} 20 0 0 0 {name=M1
l=0.13u
w=5u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 20 -120 0 0 {name=M2
l=0.13u
w=10u
ng=1
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 40 50 0 1 {name=p3 lab=VSS order=4}
C {iopin.sym} 40 -240 0 1 {name=p4 lab=VDD order=1}
C {opin.sym} 200 -60 0 0 {name=p1 lab=OUT order=2}
C {ipin.sym} 0 -60 0 0 {name=p2 lab=IN order=3}
C {sg13g2_pr/ptap1.sym} 40 80 0 0 {name=R1
model=ptap1
spiceprefix=X
w=0.78e-6
l=0.78e-6
}
C {sg13g2_pr/ntap1.sym} 100 -210 0 0 {name=R2
model=ntap1
spiceprefix=X
w=0.78e-6
l=0.78e-6
}
C {title.sym} -150 260 0 0 {name=l1 author="Capodagli Janus"}
