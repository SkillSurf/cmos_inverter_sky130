# Simulating a CMOS inverter in Xschem under sky130
## step 01: creating a schematic in xschem
![xschem workspace](images/xschemSchematic.png)
&emsp; library path:" .lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt "
## step 02: making a symbol for the inverter and VTC analysis ##
Here we save our inverter as a separate component. In this process after the schematic press 'a' to save it as a symbol. By pressing 'e' and ctrl+e you can edit and exit the internals of the symbol. After that, we can move into  the Voltage Transfer Characteristic (VTC) analysis of the inverter.


