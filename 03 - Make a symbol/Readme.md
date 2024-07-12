# Make a Symbol for CMOS Inverter

## Table of Contents
1. [Introduction](#introduction)
2. [Types of Pins](#types-of-pins)
3. [Drawing the Symbol](#drawing-the-symbol)
4. [Running a Test Bench](#running-a-test-bench)
5. [Changing the Internal Structure](#changing-the-internal-structure)


## Introduction
A symbol is a block/behavioral model that represents a low-level schematic. It hides the internal schematic and gives an abstract view so we can use it anywhere as needed. First of all, we need a low-level schematic diagram in order to make a symbol. Here we are making a gate-level symbol, so the low-level schematic will be the transistor schematic.

Here is the transistor-level schematic.

<img title="Schematic Level" width = 500 alt="Schematic" src="images\schematicCMOS.png">


## Types of Pins

To make a symbol, the pins need to be defined according to the behavior. There are some types of pins:
- **Input Pins:** Provide inputs to the block (e.g., Voltage inputs, signal inputs, clock, set/reset pins, enable, etc.)
- **Output Pins:** Get the output of the block (e.g., Signal Out, complement of the output, etc.)
- **Input/Output Pins/Bidirectional Pins:** Pins that have both input and output functionality or are in a high impedance state (e.g., Digital/Analog I/O pins, MISO, MOSI, etc.)
- **Net Labels:** Represent a Net. These can be used to connect two or more points without drawing wires to avoid messy wiring networks.

Here are the pins in Xschem. Go to **Tools > Insert Symbol**, or press **Shift + I** then go to **Standard Xschem Libraries > Devices** then search for "Pins".

<img title="Pintypes" width = 1000 alt="Schematic" src="images\pins.jpg">

Place the pins according to the structure. Here we have:
- **vdd:** Voltage input for the block
- **gnd:** Ground pin, 0 reference
- **vin:** Signal input
- **vout:** Signal output

Place the correct pins at the correct places and route them. Then the schematic will look like this.

<img title="schmaticwithpins" width = 500 alt="Schematic" src="images\Schemwithpin.png">

After completing the low-level structure, save it using **Ctrl + S** or **File > Save**.

Navigate to **Symbol > Make a Symbol from Schematic** or simply press **A**.

<img title="make a symbol" width = 500 alt="Schematic" src="images\MakeASymbol.png">

## Drawing the Symbol

Go to **File > Open** and select the working directory. A `_name_.sym` file can be found there.

<img title="importsymbol" width = 500 alt="Schematic" src="images\selectsymbol.png">

Open it, and the default box-type symbol appears with the pins defined earlier. Leave it be and go and select any tool from the toolbar.

There are some tools:
- Insert line
- Insert rectangle
- Insert polygon
- Insert arc
- Insert circle

<img title="poly" width = 1000 alt="Schematic" src="images\polygon.png">

Select as needed and draw the required symbol. Here we draw an inverter symbol. Then select any pin in the default symbol and press **C** to copy it. Then place it as needed in the new symbol. Use **Shift + R** to rotate the pins as needed. Then select and delete the default symbol.

The final new symbol will look like this.

<img title="symbol" width = 500 alt="Schematic" src="images\symbol.png">

Save it, and now you can use the block anywhere with the internal CMOS-level functionality.

## Running a Test Bench

Make a new schematic for testing the block.

Go to **Tools > Insert Symbol** or simply press **Shift + I**. Select the `_name_.sym` from the working directory and place it in the worksheet. Place voltage sources.

Make the `vin` source produce a pulse train. For the pulse train, place the following in the value parameter:

```sh
"pulse(0 1.8 0 0.1n 0.1n 5n 10n 10)"
```
This will give a 0 to 1.8V pulse train with a period of 10ns and a duty cycle of approximately 50%, with a rise time and fall time of 0.1ns.

Then place the `code_shown.sym` in the worksheet. Paste the following SPICE command for the value:

```sh
".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran .02n 50n
.save all
.end"
```
This simulates the circuit for 50ns. Clearly get the output as it is at the schematic level.

<img title="results" width = 500 alt="Schematic" src="images\results.png">

You can now simply use the inverter anywhere.
## Changing the Internal Structure

To change the parameters and internal architecture, simply select the inverter and press **```E```**. Change as needed and save. Then again press **```Shift + E```** to return to the higher level.




