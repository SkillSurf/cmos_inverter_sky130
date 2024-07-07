# Voltage transfer characteristic Analysis

The Voltage Transfer Characteristic (VTC) of a CMOS inverter is a critical graph that shows the relationship between the input voltage (vin) and the output voltage (vout). This curve is essential for understanding the behavior of the inverter.

## Regions of operations in VTC (Three primary regions)##
**-low input voltage region:** 
    When vin is low (close to 0V), the PMOS transistor is in the saturation region, and the NMOS transistor is in the cutoff region. The PMOS transistor pulls the output voltage high.  
**-transition region:** 
    As vin increases, the NMOS transistor starts to turn on, and the PMOS transistor starts to turn off and the output voltage drops sharply from high to low. This region is where the inverter switches states and is critical for determining the switching threshold vth.  
**-high input voltage region:**
    The NMOS transistor pulls the output voltage low, close to 0V.





## VTC Analysis of CMOS inverter 

#### Load the test bench



<img title="Test bench for CMOS inverter" width = 500 alt="installed files" src="images\inv_testb.png">

#### Simulate the testbench
Click on **Net List** then **Simulate** in the right side of the menu bar.

<img title="xschem screen" width = 900 alt="installed files" src="images\vtc_xschem.png">

After the simulation is completed, run the following command to plot $V_{o}$ vs $V_{in}$.

```sh
    plot vin vout
```

<img title="vin vs vout graph" width = 500 alt="installed files" src="images\VTC(vin_vs_vout).png">


#### Determine $V_{TH}$.
To get the threshold voltage, where $vin = vout$ run the following command on the terminal.

```sh
    meas dc vin when vin=vout
```

You can simulate the effect of the transistor characteristics on the threshold level of the inverter. You can change the W and L values of the nmos and pmos transistors inside the symbol. Try to find more balanced middle value for vth by changing those variables.




