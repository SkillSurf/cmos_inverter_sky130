# Simulating a CMOS inverter in Xschem under sky130
## step 01: creating a schematic in xschem
![xschem workspace](images/xschemSchematic.png)
&emsp; library path:" .lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt "  
after finishing the schematic save the netlist file and then begin the simulation using ngspice.

For more details:[VLSI Project help/whyRD](https://www.youtube.com/watch?v=VCuyO7Chvc8&list=PL0E9jhuDlj9r-XIIgx5PPJpogx7ThS5CB)


## step 02: making a symbol for the inverter and VTC analysis ##
Here we save our inverter as a separate component. In this process after the schematic press 'a' to save it as a symbol. By pressing 'e' and ctrl+e you can edit and exit the internals of the symbol. After that, we can move into  the Voltage Transfer Characteristic (VTC) analysis of the inverter.


The VTC provides crucial information about the behavior and performance of the circuit like logic levels, noise margin,etc. 


![vin vs vout characteristics of inverter](images/VTC(vin_vs_vout).png)

Here we can see that the logic margin of the inverter lies between 0.5v and 1.0v. By adjusting the internal parameters of the CMOS transistors, we can get more optimized output.

For more details:[CMOS inverter VTC/whyRD](https://www.youtube.com/watch?v=HtepnuRit7A&list=PL0E9jhuDlj9r-XIIgx5PPJpogx7ThS5CB&index=3)






