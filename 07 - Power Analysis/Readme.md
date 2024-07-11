# Power Analysis
In digital circuits, power consumption can be broken down into three main components:
#### 1.Dynamic Power
Dynamic power is consumed during the switching of transistors. It is primarily due to the charging and discharging of capacitive loads.

#### 2.Static Power
Static power, also known as leakage power, is consumed even when the circuit is not switching. It is due to leakage currents that flow through transistors when they are in a non-switching state.

#### 3.Short Circuit Power
Short circuit power is consumed during the brief period when both NMOS and PMOS transistors are simultaneously conducting during a transition from one logic level to another.

In the following simulation, we will analyze all three power components together. We will be integrating the current drawn over the full period, which includes all three types to compute average power consumption.
## Power Analysis of CMOS inverter under sky130
#### Load the test bench

First load the test bench for the CMOS inverter. [See here](../04%20-%20VTC%20Analysis)


<img src="https://github.com/SkillSurf/cmos_inverter_sky130/blob/main/07%20-%20Power%20Analysis/images/test_schematic.png?raw=true" alt="Test bench for CMOS inverter" width="1000" height="350">

Make sure we do the transient simulation 
```sh
name=VTC only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 0.02n 60n 
.save all 
.end"
```

Save the file and generate netlist
<img src="https://github.com/SkillSurf/cmos_inverter_sky130/blob/main/07%20-%20Power%20Analysis/images/netlist1.png?raw=true" alt="Test bench Netlist" width="1000" height="500">

#### Analysing Simulations
To analyse the power consumption of the inverter, the current drawn from power supply (vdd) need to be observed. Use the following command to plot the variation of supply current. The current drawn from Vin can be neglected in this power analysis as it is a comparatively small value.
```sh
plot vdd#branch
```
<img src="https://github.com/SkillSurf/cmos_inverter_sky130/blob/main/07%20-%20Power%20Analysis/images/Current%20plot.png?raw=true" alt="Current of CMOS inverter" width="1000" height="500">

Plotting scaled current and output voltage
```sh
plot (vdd#branch*1000) vout
```

<img src="https://github.com/SkillSurf/cmos_inverter_sky130/blob/main/07%20-%20Power%20Analysis/images/Current%20and%20Vout.png?raw=true" alt="current and vout of for CMOS inverter" width="1000" height="500">

#### Calculating the power consumption
Use the following command to calculate the power consumption.
```sh
meas tran current_intg integ vdd#branch from=20e-09 to=40e-09
print (current_intg*1.8)/20e-09
```
Here the supply current is integrated from 20nS to 40nS and power is calculated by multiplying integrated value by source voltage(VDD = 1.8V) and deviding it by period(20nS)
This will give the average power consumption of the inverter
<img src="https://github.com/SkillSurf/cmos_inverter_sky130/blob/main/07%20-%20Power%20Analysis/images/power_consumption1.png?raw=true" alt="Power of CMOS inverter" width="1000" height="200">

#### Methods to reduce the power consumption
##### 1. Reducing the load capacitance
   Reduce the load capacitor value to 0.2pF. In an actual design we can reduce load capacitance by efficiently arranging the layout.
   After reducing the load capacitance, save the file and generate the netlist. Then run the previous command to calculate the new power consumption.
  <img src="https://github.com/SkillSurf/cmos_inverter_sky130/blob/main/07%20-%20Power%20Analysis/images/power_consumption2.png?raw=true" alt="Load capacitance CMOS     inverter" width="800" height="150">
##### 2. Reducing the Transistor size
Size of the transistors directly affect the power consumption. In the simulation we have increased the thansistor size of NMOS to W=4 and PMOS to W=8.
Size of transistors can be changed by selecting the transistor and pressing "q". Then adjust the "W" parameter as specified. After the adjustments run the command to calculate power. The following results will be obtained.
<img src="https://github.com/SkillSurf/cmos_inverter_sky130/blob/main/07%20-%20Power%20Analysis/images/power_consumption3.PNG?raw=true" alt="Size of CMOS     inverter" width="800" height="150">

This shows the increase in power consumption when transistor size increases.

##### 3. Decreasing VDD
Select the vdd source and manually reduce the voltage to 1V. Then run the following command to observe the reduction of power consumption.
```sh
meas tran current_intg integ vdd#branch from=20e-09 to=40e-09
print (current_intg*1)/20e-09
```
<img src="https://github.com/SkillSurf/cmos_inverter_sky130/blob/main/07%20-%20Power%20Analysis/images/power_consumption4.PNG?raw=true" alt="VDD of CMOS     inverter" width="800" height="150"> 
