# Noise Margin analysis.

The noise margin of a electronic design is a critical parameter that quantifies its robustness against electrical noise, ensuring reliable operation in digital systems. It defines how the design respond for unwanted signal components.

Noise margine is defined in two types.
- Lower Noise Margin ($NM_{L}$)
$$
    NM_L=V_{IL}-V_{OL}
$$
- Higher Noise Margin ($NM_{H}$)
$$
    NM_H=V_{OH}-V_{IH}
$$
Where
$$
    V_{IL} = Maximum Low Input Voltage \\
    V_{OL} = Maximum Low Output Voltage\\

    V_{IH} = Minimum High Input Voltage\\
    V_{OH} = Minimum High Output Voltage \\
$$

<img title="Noise Margins" width = 700 alt="installed files" src="images\NoisMargins.jpg">

## Noise Margin in Digital Electronics

The noise margin of a digital design refer to the ability of the design to handle input noise without faulty logic output. 
Here $V_{IH}$ and  $V_{IL}$ defines at the the point where the Magnitude of the slope of $\frac{V_O}{V_{in}}$ become 1.
$$
    \left|\frac{dV_O}{dV_{in}}\right| = 1
$$
<img title="Noise Margins" width = 500 alt="installed files" src="images\derive.gif">

## Noise Margin Analysis of CMOS inverter under sky130

#### Load the test bench

Firt load the test bench for the CMOS inverter. [See here](../04%20-%20VTC%20Analysis)


<img title="Test bench for CMOS inverter" width = 500 alt="installed files" src="images\testbench.png">

#### Simulate the testbench
Click on **Net List** then **Simulate** in the right side of the menue bar.
<img title="Menu bar" width = 900 alt="installed files" src="images\menu_bar.png">

After the simulation completed, run the following command to plot $V_{o}$ vs $V_{in}$.

```sh
    plot vin vout
```

<img title="Voltage Transfer Charasteristics" width = 500 alt="outputvsinput" src="images\opvsip.png">

#### Get the derivative of the gain which is $\frac{dV_O}{dV_{in}}$
Get the derivative of the $V_{o}$ With respect to the $V_{in}$.

```sh
    plot deriv(vout)
```

<img title="Plot $\left|\frac{dV_O}{dV_{in}}\right|$" width = 500 alt="derivative" src="images\derivgain.png">

#### Determine $V_{IL}$ and $V_{IH}$.
To get the noise level, where $\left|\frac{dV_O}{dV_{in}}\right| = 1$ run the followin command on the terminal.

```sh
    let gain=abs(deriv(vout)) >= 1
    plot gain
```
here get the values of the absolute value of the derivative to a variable "gain" and select the part where it is greater than 1.

<img title="Plot $\left|\frac{dV_O}{dV_{in}}\right|$" width = 500 alt="derivative" src="images\gaingreater1.png">

 