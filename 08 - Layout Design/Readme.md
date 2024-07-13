# CMOS Inverter Layout Design using Magic and SkyWater 130nm PDK
## Introduction
Creating the physical layout of the CMOS inverter is essential for fabrication and further analysis process. In this section, we are going to do layout designing and DRC handling, spice generation of layout and LVS checking using NETGEN.

## Prerequisites
- Magic VLSI
- SkyWater 130nm PDK
- WSL (Windows Subsystem for Linux) if running on Windows or linux based system

## Structure of the CMOS ##
Before moving into layout design we have to get some idea about the physical structure of a CMOS transistor in Silicon level. It includes key structures like diffusion areas, gate oxides, polysilicon gates, metal layers and vias etc.
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhGPVb_MP2fvI8NsBw0b5WNgxk3rrRtiU3rvlORG1_1U6kj9h50og2SrDorm7pZctvnt9-VDNuhscTNAmnxYTnIECYrfZ9DPpmPoAi6W6dPgTvy-No0xIrMXJSVEPrFLJJMnEebaSGFDB8/s1600/cmos.png)  

**Active Area (Diffusion):** Regions where transistors are formed. These areas are doped to create n-type or p-type regions. 
 
 **Gate Oxide:** A thin layer of SiO₂ between the gate and the channel region of the transistor.  
 
**Polysilicon Gate:** The gate electrode controlling the transistor's operation, formed above the gate oxide.

**Contacts and Vias:** Metal connections that link the transistors to interconnect layers and power supply. 

**Metal Layers:** Conductive layers (e.g., metal1, metal2) used for interconnections between different components.

## Layout Design

### Integrating Magic with Sky130
1. **Open Magic with SkyWater PDK:**
    ```bash
    magic -rcfile /usr/local/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc
    ```
   This command opens two windows: one for layout and another terminal. Both windows are very important in this process.

2. **Enable Grid:**
    ```tcl
    grid 50nm 50nm
    ```
   Use `50nm` because the channel length of NMOS and PMOS is `150nm`, which is a multiple of `50nm`. YOU can change the grid size as you want by this command in magic terminal or simply you can select grid options in window tab in magic.

3. **Zoom Commands:**
   - Zoom Out: `Shift + Z`
   - Zoom In: `Ctrl + Z`

4. **Creating a Box:**
   - Select the left bottom corner of the box with the left mouse button.
   - Select the right top corner of the box with the right mouse button.
   - Use the command to snap the box to the grid points:
     ```tcl
     snap user 50nm
     ```
     or simply use window tab Grid ON option. 

5. **Check DRC Errors:**
    ```tcl
    drc find
    ```
    Design rule check(DRC)- this process ensures that the design we did in magic is practically manufacturable according to standards. You can further study about them [visit skywater](https://skywater-pdk.readthedocs.io/en/main/) 

### Design Process 

When we design  a PMOS we have to first add n-well in the default p-type wafer given in magic. Then for source and drain parts we add p-diffusion on n-well and then polysilicon layer for gate. Then we add li metal layer and other metal layers and vias according to requirements. This is the process very simply. 
[for more details](https://skywater-pdk.readthedocs.io/en/main/rules/assumptions.html#process-stack-diagram)
![](https://skywater-pdk.readthedocs.io/en/main/_images/metal_stack.svg)


1. **P-Type Wafer:**
   - The wafer is p-type by default. For pMOS, use an n-well.

2. **Diffusion Layer:**
   - N-diffusion is created in the p-well.
   - P-diffusion is created in the n-well.
   - Diffusion regions form the sources and drains of the transistors.

3. **Oxide Layer (Polysilicon):**
   - Add the polysilicon layer above the diffusion layer.

4. **Metal Layers and Interconnects:**
   - Use LI (local interconnect) metal for diffusion layers.
   - To connect diffusion layers and LI metal, use vias:
     - Connect p-diff to LI: `pdc`
     - Connect n-diff to LI: `ndc`

### Layout Creation
select the wanted area using above method and then use terminal for below seteps.
1. **Draw the NMOS Transistor:**
   - Paint the n-well:
     ```tcl
     paint nwell
     ```
   - Draw the n-diffusion:
     ```tcl
     paint ndiff
     ```

2. **Draw the PMOS Transistor:**
   - Paint the p-well:
     ```tcl
     paint pwell
     ```
   - Draw the p-diffusion:
     ```tcl
     paint pdiff
     ```

3. **Add Polysilicon Gate:**
    ```tcl
    paint poly
    ```
After drawing the transistors connect them according to schematic using li and metal layers.

4. **Connect Using li Layers:**
   - Use LI for local interconnections:
     ```tcl
     paint li
     ```

5. **Add licon, mcon and Vias for Connections use relevant code:**
    ```tcl
    paint licon
    paint mocn
    paint via
    ```

7. **Design Rule Check (DRC):**
    ```tcl
    drc check
    ```
    It's a good practice to check DRC when you do a change. You can view the DRC manger window by options menu then toggle the drc manager.IF all DRC are clear then extract the spice file from the layout.
   

9. **Extract the Layout:**
    ```tcl
    extract all
    ```
10. **Extract the spice file**
    ```tcl
    ext2spice file_name.ext
    ```
    
