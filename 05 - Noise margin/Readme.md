# Noise Margin Analysis

The noise margin of an electronic design is a critical parameter that quantifies its robustness against electrical noise, ensuring reliable operation in digital systems. It defines how the design responds to unwanted signal components.

Noise margine is defined in two types.
- Lower Noise Margin ($NM_{L}$)\
$$NM_L=V_{IL}-V_{OL}$$
- Higher Noise Margin ($NM_{H}$)\
$$NM_H=V_{OH}-V_{IH}$$

Where 
   - $$V_{IL} = Maximum Low Input Voltage$$ 
   - $$V_{OL} = Maximum Low Output Voltage$$
     
   - $$V_{IH} = Minimum High Input Voltage$$ 
   - $$V_{OH} = Minimum High Output Voltage$$ 

<img title="Noise Margins" width = 500 alt="installed files" src="images\NoisMargins.jpg">

## Noise Margin in Digital Electronics

The noise margin of a digital design refers to the ability of the design to handle input noise without faulty logic output. 
Here, $V_{IH}$ and $V_{IL}$ are defined at the point where the magnitude of the slope of $\frac{V_O}{V_{in}}$ becomes 1.

$$
    \left|\frac{dV_O}{dV_{in}}\right| = 1
$$

<img title="Noise Margins" width = 500 alt="installed files" src="images\derive.gif">

## Noise Margin Analysis of CMOS Inverter under Sky130

### Load the Test Bench

First, load the test bench for the CMOS inverter. [See here](../04%20-%20VTC%20Analysis)


<img title="Test bench for CMOS inverter" width = 500 alt="installed files" src="images\testbench.png">

### Simulate the Test Bench

Click on **Netlist** then **Simulate** in the right side of the menu bar.

<img title="Menu bar" width = 900 alt="installed files" src="images\menu_bar.png">

After the simulation is completed, run the following command to plot $V_{O}$ vs $V_{in}$.

```sh
    plot vin vout
```

<img title="Voltage Transfer Charasteristics" width = 500 alt="outputvsinput" src="images\opvsip.png">

### Get the Derivative of the Gain ($\frac{dV_O}{dV_{in}}$)

Get the derivative of the $V_{O}$ with respect to the $V_{in}$.

```sh
    plot deriv(vout)
```

<img title="Plot $\left|\frac{dV_O}{dV_{in}}\right|$" width = 500 alt="derivative" src="images\derivgain.png">

### Determine $V_{IL}$ and $V_{IH}$

To get the noise level where $\left|\frac{dV_O}{dV_{in}}\right| = 1$, run the following command on the terminal.


```sh
    let gain=abs(deriv(vout)) >= 1
    plot gain
```
Here, get the values of the absolute value of the derivative to a variable "gain" and select the part where it is greater than 1.

<img title="Plot $\left|\frac{dV_O}{dV_{in}}\right|$" width = 500 alt="derivative" src="images\gaingreater1.png">


Run the following command for better visualization of the noise levels.

```sh
    let gain=(abs(deriv(vout)) >= 1)*1.8
    plot gain vout
```
 <img title="Plot $\left|\frac{dV_O}{dV_{in}}\right|$" width = 500 alt="derivative" src="images\noiselevels.png">
 

Run the following SPICE commands one by one to determine $V_{IL}$ and $V_{IH}$.



```sh
    meas vil dc find vin when gain=1 cross=1
    meas vlh dc find vin when gain=1 cross=2
```
Syntax: vil, vih are parameter names. dc for DC analysis. cross=1, first point of intersection, 2 for second.

 <img title="$V_{IL}$ and $V_{IL}$ values" width = 500 alt="$V_{IL}$ and $V_{IL}$" src="images\vilvih.png">

### Noise Margin Calculation of CMOS Inverter under Sky130

$$
\begin{aligned}
    NM_L &= V_{IL} - V_{OL} \\
    NM_L &= 743.5556\,\text{mV} - 0\,\text{mV} \\
    NM_L &= 743.5556\,\text{mV} \\
    \\
    NM_H &= V_{OH} - V_{IH} \\
    NM_H &= 1.8\,\text{V} - 0.9804444\,\text{V} \\
    NM_H &= 819.5556\,\text{mV}
\end{aligned}
$$
