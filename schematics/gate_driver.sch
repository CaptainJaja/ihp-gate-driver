v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 -60 40 -30 {lab=OUT}
N -0 -60 0 0 {lab=IN}
N 40 -180 210 -180 {lab=#net1}
N 40 -180 40 -120 {lab=#net1}
N -110 -60 -0 -60 {lab=IN}
N -0 -120 -0 -60 {lab=IN}
N 40 -60 200 -60 {lab=OUT}
N 40 -90 40 -60 {lab=OUT}
N 40 0 40 50 {lab=0}
C {sg13g2_pr/sg13_lv_nmos.sym} 20 0 0 0 {name=M1
l=0.13u
w=5u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {vsource.sym} -110 -30 0 1 {name=Vin value="PULSE(0 1.2 0 100p 100p 10n 20n)" savecurrent=false}
C {vsource.sym} 210 -150 0 0 {name=VDD value=1.2 savecurrent=false}
C {gnd.sym} 210 -120 0 0 {name=l1 lab=0}
C {gnd.sym} -110 0 0 0 {name=l2 lab=0}
C {gnd.sym} 40 50 0 0 {name=l3 lab=0}
C {sg13g2_pr/sg13_lv_pmos.sym} 20 -120 0 0 {name=M2
l=0.13u
w=10u
ng=1
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {capa.sym} 200 -30 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 200 0 0 0 {name=l5 lab=0}
C {lab_pin.sym} 200 -60 2 0 {name=p1 sig_type=std_logic lab=OUT}
C {lab_pin.sym} -110 -60 0 0 {name=p2 sig_type=std_logic lab=IN}
C {code_shown.sym} 170 90 0 0 {name=s1 value="
.lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
.tran 10p 60n
.control
run
plot v(IN) v(OUT)
.endc
"}
