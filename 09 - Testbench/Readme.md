# Create a spice testbench and simulate
To generate a SPICE testbench for verifying the behavior of the SPICE netlist generated from your layout, you'll need to follow these steps. This process involves creating a SPICE file that sets up the simulation environment, applies input signals, and defines the measurements to be taken. Below is a guide and example of how to create a SPICE testbench.

## 📋 Table of Contents
- [Steps to Create a SPICE Testbench](#stepstocreateaspicetestbench)
   - [Create the Testbench File](#createthetestbenchfile)
   - [Include the Netlist](#includethenetlist)
- [Example Testbench](#exampletestbench)

## Create the Testbench File
Create a new file named tb_yourfilename.sp (you can use any text editor for this, such as nano, vim, or gedit). This file should contain your .spice file, .mag file, and .ext files that were created in Magic VLSI.

## Include the Netlist
This is the sample testbench.

```c
* Testbench for magic_inv
* Add libraries
.include 'magic_inv.spice'

* Define power supply voltages
VDD VP 0 1.8V
VSS VN 0 0V

* Define input signal
Vin A 0 PULSE(0 1.8 0 1n 1n 10n 20n) 

* Instantiate the magic_inv subcircuit
X1 A Y VP VN magic_inv

* Define output load (optional)
RL Y 0 1k

* Simulation commands
.tran 1n 200n
.control
  run
  plot v(Y)
.endc

.end

```

## Explanation of the Testbench Content
- *.include 'magic_inv.spice': Includes the SPICE netlist of the inverter.
- VDD VP 0 1.8V: Defines a DC voltage source for the power supply (1.8V).
- VSS VN 0 0V: Defines a ground reference.
- Vin A 0 PULSE(0 1.8 0 1n 1n 10n 20n): Defines a pulse signal for the input, with a rise time and fall time of 1ns, on-time of 10ns, and period of 20ns.
- X1 A Y VP VN magic_inv: Instantiates the inverter subcircuit.
- RL Y 0 1k: Adds a resistive load to the output (optional, depending on your circuit).
- .tran 1n 200n: Specifies a transient analysis with a step of 1ns over 200ns.

## Running the Simulation
- Save the testbench file as tb_magic_inv.sp.
- Run the simulation using a SPICE simulator such as Ngspice:
- Type below in xterm.

```c
  ngspice tb_yourfilename.sp
```


