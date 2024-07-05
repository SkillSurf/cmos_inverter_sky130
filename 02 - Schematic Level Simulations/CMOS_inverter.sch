v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -20 -130 -20 -100 {
lab=vout}
N -20 -10 -20 10 {
lab=GND}
N -20 -210 -20 -190 {
lab=vcc}
N -20 -160 0 -160 {
lab=vcc}
N 0 -200 0 -160 {
lab=vcc}
N -20 -200 0 -200 {
lab=vcc}
N -60 -160 -60 -70 {
lab=vin}
N -80 -90 -60 -90 {
lab=vin}
N -20 -90 50 -90 {
lab=vout}
N -20 -70 -20 -60 {
lab=vout}
N -60 -40 -60 -30 {
lab=vin}
N -20 10 -20 20 {
lab=GND}
N -20 -220 -20 -210 {
lab=vcc}
N -20 -30 0 -30 {
lab=GND}
N 0 -30 0 0 {
lab=GND}
N -20 0 0 0 {
lab=GND}
N -20 -100 -20 -70 {
lab=vout}
N -60 -70 -60 -40 {
lab=vin}
C {devices/vsource.sym} -310 -50 0 0 {name=vcc value=1.8v}
C {devices/vsource.sym} -310 -170 0 0 {name=vin value="pulse(0 1.8 1ns 1ns 1ns 5ns 10ns)"}
C {sky130_fd_pr/nfet_01v8.sym} -40 -30 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -40 -160 0 0 {name=M3
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} -310 -80 0 0 {name=p1 sig_type=std_logic lab=vcc}
C {devices/lab_pin.sym} -310 -200 0 0 {name=p2 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} -20 -220 0 0 {name=p3 sig_type=std_logic lab=vcc}
C {devices/lab_pin.sym} 50 -90 2 0 {name=p4 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} -80 -90 0 0 {name=p5 sig_type=std_logic lab=vin
}
C {devices/gnd.sym} -20 20 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -420 70 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1n 100ns
.save all"}
C {devices/gnd.sym} -310 -20 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -310 -140 0 0 {name=l3 lab=GND}
