v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 40 -370 40 -330 {
lab=vout}
N -20 -400 0 -400 {
lab=vin}
N -20 -400 -20 -300 {
lab=vin}
N -20 -300 0 -300 {
lab=vin}
N -60 -350 -20 -350 {
lab=vin}
N 40 -350 70 -350 {
lab=vout}
N 40 -450 40 -430 {
lab=vdd}
N 40 -300 60 -300 {
lab=gnd}
N 60 -300 60 -270 {
lab=gnd}
N 40 -270 60 -270 {
lab=gnd}
N 40 -400 60 -400 {
lab=vdd}
N 60 -440 60 -400 {
lab=vdd}
N 40 -440 60 -440 {
lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} 20 -300 0 0 {name=M1
W=2
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
C {sky130_fd_pr/pfet_01v8.sym} 20 -400 0 0 {name=M2
W=2
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
C {devices/ipin.sym} -60 -350 0 0 {name=p6 lab=vin}
C {devices/ipin.sym} 40 -270 3 0 {name=p3 lab=gnd}
C {devices/ipin.sym} 40 -450 1 0 {name=p4 lab=vdd}
C {devices/opin.sym} 70 -350 0 0 {name=p1 lab=vout}
