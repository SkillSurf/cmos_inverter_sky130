## Delay Analysis

Delay analysis is a critical aspect of VLSI design, impacting the performance and reliability of the circuit. In this project, we focus on the following types of delays:

### Propagation Delay

Propagation delay (t<sub>pd</sub>) is the time taken for a signal to travel from the input to the output of the inverter. Specifically, it is measured from the point where the input signal reaches 50% of its final value to the point where the output signal reaches 50% of its final value.

### Rise Time and Fall Time

- **Rise Time (t<sub>r</sub>)**: The time taken for the output signal to rise from 10% to 90% of its final value.
- **Fall Time (t<sub>f</sub>)**: The time taken for the output signal to fall from 90% to 10% of its final value.

<img title="Delay Analysis" width = 500 alt="installed files" src="Images\delay.png">

## Delay Analysis of CMOS inverter under sky130

#### Load the test bench

First load the test bench for the CMOS inverter. [See here](../04%20-%20VTC%20Analysis)

<img title="Test bench for CMOS inverter" width = 500 alt="installed files" src="Images/Screenshot from 2024-07-13 09-57-12.png">

#### Simulate the testbench
Click on **Net List** then **Simulate** in the right side of the menue bar.

Use Following spice commands (Need to do transient analysis)
```sh
    pname=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
    .tran .02n 40n
    .save all
    .end" 
```
For V<sub>in</sub> use following script
```sh
    "PULSE(0 1.8 0 .1n .3n 10n 20.6n 10)"
```  
#### **Propagation Delay Calculation**
After the simulation completed, run the following command on Ngspice to plot $V_{o}$ vs $V_{in}$.

```sh
    plot vin vout
```
<img title="input and output voltage" width = 500 alt="installed files" src="Images/Screenshot from 2024-07-13 10-25-29.png">

To get lower side Propagation Delay run following commands line by line on Ngspice window
```sh
     meas tran vin50 when vin=.9 RISE=2
     meas tran vout50 when vout=.9 FALL=2
     let TpHL=vout50-vin50
     print TpHL
```
Similarly run commands to get higher side of the propagation delay using following commands 
```sh
     meas tran vin50 when vin=.9 FALL=1
     meas tran vout50 when vout=.9 RISE=1
     let TpHL=vout50-vin50
     print TpLH
```
To get average **propagation delay** run 
```sh
    print (TpLH+TpHL)/2
```
<img title="Ngspice script for propagation delay" width = 500 alt="installed files" src="Images/Ngspice Script for propagation delay.png">

#### **Risetime Falltime calculation

To calculate Risetime (t<sub>r</sub>) use following commands on Ngspice 
```sh
     meas trans t10 when vout=0.18 RISE=1
     meas trans t90 when vout=1.62  RISE=1
     let tr=t90-t10
     print tr
```
Similarly to Calculate Falltime (t<sub>f</sub>) use following commands on Ngspice
```sh
     meas trans t90 when vout=1.62 FALL=2
     meas trans t10 when vout=0.18 FALL=2
     let tf=t10-t90
     print tf
```
<img title="Ngspice script for Risetime and Falltime" width = 500 alt="installed files" src="Images/Ngspice script fot Risetime Falltime calculation.png">

## Parameters effect delay time

#### Power 
When increasing power delay will be low but there will be high power consumption. 
#### Width of The Mosfet 
When increasing width of mosfet loaded inverter delay will reduce but in unloaded inverter there won't be any effect because when increasing width it will also increase the internal capacitence.

To simulate changes of the width,
    First add a load capacitence to the inverter (Give a suitable value)
    Then change the width of the mosfet by selecting the Mosfet.

As summery delay depend on power and width of mosfet. If we increase the width of the mosfet it will also increase the area of the circuit also if we increase the power their will be high power consumption.  

