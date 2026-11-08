v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {
}
F {}
E {}
N 0 -420 0 -370 {lab=VDD}
N -470 -340 -470 -320 {lab=VDD}
N -470 -260 -470 -220 {lab=0}
N -190 -210 -190 -190 {lab=0}
N -190 -290 -190 -270 {lab=IN}
N -190 -290 -100 -290 {lab=IN}
N 80 -285 95 -285 {lab=OUT}
N 95 -290 95 -285 {lab=OUT}
N 95 -290 120 -290 {lab=OUT}
N 0 -190 0 -160 {lab=0}
N 120 -230 120 -210 {lab=0}
C {vsource.sym} -470 -290 0 0 {name=Vdd value=1.2 savecurrent=false}
C {vsource.sym} -190 -240 0 1 {name=Vin value="pulse(0 1.2 100p 40p 40p 1n 2n)" savecurrent=false}
C {gnd.sym} -470 -220 0 0 {name=l1 lab=0}
C {gnd.sym} 0 -160 0 0 {name=l3 lab=0}
C {capa.sym} 120 -260 0 0 {name=Cload
m=1
value=5f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 120 -210 0 0 {name=l4 lab=0}
C {code_shown.sym} -350 -80 0 0 {name=s1
only_toplevel=true
value="
.param temp=27
.lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
.lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerRES.lib res_typ

.include /foss/designs/ihp-gate-driver/layout/gate_driver_postlayout.spice

.control
  tran 1ps 4ns
  meas tran tphl trig v(IN) val=0.6 rise=1 targ v(OUT) val=0.6 fall=1
  meas tran tplh trig v(IN) val=0.6 fall=1 targ v(OUT) val=0.6 rise=1
  plot v(IN) v(OUT)
.endc
"}
C {title.sym} -400 190 0 0 {name=l5 author="Capodagli Janus"}
C {vdd.sym} -470 -340 0 0 {name=l6 lab=VDD}
C {vdd.sym} 0 -420 0 0 {name=l7 lab=VDD}
C {gnd.sym} -190 -190 0 0 {name=l8 lab=0}
C {lab_wire.sym} -160 -290 0 0 {name=p1 sig_type=std_logic lab=IN}
C {lab_wire.sym} 120 -290 0 0 {name=p2 sig_type=std_logic lab=OUT}
C {/foss/designs/ihp-gate-driver/xinv.sym} -100 -370 0 0 {name=xinv2
format="@name @pinlist xinv_pex"}
