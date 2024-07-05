v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {inv_vtc.sym} -110 110 0 0 {name=x1}
C {devices/vsource.sym} -440 -10 0 0 {name=vin value=0 savecurrent=false}
C {devices/vsource.sym} -530 -10 0 0 {name=vdd value=1.8 savecurrent=false}
C {devices/gnd.sym} -440 20 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -530 20 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -150 -10 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -240 -80 0 0 {name=p1 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} -440 -40 0 0 {name=p2 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} -530 -40 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {devices/code_shown.sym} -560 110 0 0 {name=s1 only_toplevel=false value=" .lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc vin 0 2 1m
.save all 
.end "}
C {devices/lab_pin.sym} -150 -140 1 0 {name=p4 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -60 -80 2 0 {name=p5 sig_type=std_logic lab=vout}
