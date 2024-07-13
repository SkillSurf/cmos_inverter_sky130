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
* Testbench for CMOS Inverter
* Include the netlist
* Add the libraries
.include your_circuit.sp

* Instantiate the pdkfile subcircuit
X1 IN OUT VDD VSS YOURFILE

* Define simulation parameters
.param VDD = 1.8V
.param VSS = 0V

* Define power supplies
VDD VDD 0 DC VDD
VSS VSS 0 DC VSS

* Define input signal
VINPUT IN 0 PULSE(0 VDD 0n 1n 1n 5n 10n)

* Run the transient analysis
.tran 1n 100n

* Output controls
.print tran V(IN) V(OUT)

* Probes
.probe V(N1)

* End of file
.end
```
