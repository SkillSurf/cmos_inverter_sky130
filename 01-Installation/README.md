# Open Source Analog/Digital ASIC Design

# Table of Contents

1. [Upcoming Skill Surf Course for 2025 Q2](#upcoming-skill-surf-course-for-2025-q2)
2. [Installation on Windows](#installation-on-windows)
   - [Installation of ngspice, Magic VLSI, and Xschem](#installation-of-ngspice-magic-vlsi-and-xschem)
   - [Downloading SKY130 PDK](#downloading-sky130-pdk)

4. [Installation on macOS](#installation-on-macos)
   - [macports Installation](#macports-installation)
   - [Homebrew Installation](#homebrew-installation)
   - [xschem Installation Steps](#xschem-installation-steps)
   - [ngspice Installation Steps (Homebrew)](#ngspice-installation-steps-homebrew)
   - [ngspice Installation Steps (macports)](#ngspice-installation-steps-macports)
   - [magic Installation Steps (macports)](#magic-installation-steps-macports)
   - [klayout Installation Steps (Homebrew)](#klayout-installation-steps-homebrew)
   - [OpenLane Installation on macOS](#openlane-installation-on-macos)

## Upcoming skill surf course for 2025 Q2.

### Analog IC design
Analog IC design begins with creating a schematic in a schematic editor, which visually represents the circuit design. From this schematic, a netlist is generated, detailing all components and their connections. This netlist is then used in a SPICE-level simulator to analyze the circuit's behavior under various conditions. The simulated output is reviewed to ensure the design meets required specifications. Once the design is validated, the IC layout is manually drawn using a graphical layout editor, representing the physical placement and routing of components. Finally, the layout is thoroughly checked for correctness to ensure it matches the schematic and complies with all design rules and specifications. chekout more [Analog IC Design](https://sscs-ose.github.io/analog/)

### Digital IC Design
Digital IC design begins with a high-level textual description of the desired functionality. This initial description serves as the blueprint for the digital circuit. The design process involves several key steps, including synthesis, which translates the high-level description into a gate-level representation, and place and route, which determines the physical placement of components and the routing of interconnections. The resulting layout is then verified to ensure it meets performance and design rules. The final step is generating a layout representation in GDS (Graphic Data System) format, which is used for fabrication. checkout more [Digital IC Design](https://sscs-ose.github.io/digital/)

### Process Design Kit (PDK)

A Process Design Kit (PDK) is an essential resource in IC design, provided by semiconductor foundries to facilitate the creation of integrated circuits for specific manufacturing processes. It includes design rules, device models, standard cell libraries, parameterized cells, and SPICE models, enabling designers to accurately simulate, verify, and layout their circuits. Additionally, the PDK contains verification tools for design rule checking (DRC), layout versus schematic (LVS) checks, and electrical rule checking (ERC), along with detailed documentation. By adhering to the PDK, designers ensure their designs meet the foundry's specifications, for a successful fabrication.

Here are some of the open-source PDKs available.
- [SKY130 PDK](https://skywater-pdk.readthedocs.io/en/main/index.html)
- [GF180 PDK](https://gf180mcu-pdk.readthedocs.io/en/latest/)
- [IHP130 PDK](https://www.ihp-microelectronics.com/services/research-and-prototyping-service/fast-design-enablement/open-source-pdk)

For these purposes, there are various software tools available in the domain. Here are some of the open-source tools:

1. **ngspice** for SPICE level simulation
2. **Xschem** for schematic capturing
3. **Magic VLSI** and **KLayout** for layout capturing tools
4. **OpenLane** a Python-based infrastructure designed for implementing Application-Specific Integrated Circuits (ASICs).
These tools provide essential functionalities for designing and simulating integrated circuits, from schematic entry to layout design and ASIC implementation.

## Installation on Windows

Some of these tools require a Linux/Ubuntu environment to run. If dual-booting the PC with Ubuntu seems difficult, please go for other options:

- **Dual Boot Option**
  Dual booting allows you to install and run two operating systems on your computer. Here's how to [Dual boot your computer with Windows and Ubuntu](https://youtu.be/mXyN1aJYefc?si=OeE_aCqSnpSmTspe&t=43).
- **Windows Subsystem for Linux (WSL)**
  WSL allows to run an Ubuntu terminal directly within Windows. However, additional dependencies like display servers are needed. Learn more about [Windows Subsystem for Linux](https://ubuntu.com/desktop/wsl).

**Note:** Before using WSL, please read [How to run graphical Linux applications on Bash on Ubuntu on Windows 10](https://seanthegeek.net/234/graphical-linux-applications-bash-ubuntu-windows/). Follow the instructions, including installing and launching the VcXsrv X11 server application for Windows.

### Installation of ngspice, Magic VLSI, and Xschem

#### Step 01 - Install a Shell Script
To begin, install a source code editor by running the following command in the terminal. Here ```nedit``` has been used:
```sh
sudo apt-get install nedit
```

#### Step 02 - Create and open a New Shel Script
```sh 
nedit name.sh
```
Replace ```name.sh``` with your desired filename. Click on ```New file```, then copy all the text from [```installENV.txt```](installENV.txt), paste it into the script editor, and save it using Ctrl+S.

#### Step 03 - Run The script.
Finally, execute the script using:
```sh 
source name.sh
```
You may be prompted for your password or asked to confirm actions with [Y/N]. Follow the prompts accordingly.
After following the steps ngSPICE, xschem, and Magic VLSI will be installed in your system.

### Downloading sky130 PDK

## Installations on macOS

### macports
- [Steps](https://guide.macports.org/chunked/installing.html#installing.xcode)
- [Steps](https://guide.macports.org/chunked/installing.macports.html)

### homebrew
[Steps](https://mac.install.guide/homebrew/3)

### xschem
[Steps](https://web02.gonzaga.edu/faculty/talarico/vlsi/CADToolsOnMac.html)
### ngspice
[Steps](https://formulae.brew.sh/formula/ngspice)
[Steps](https://ports.macports.org/port/ngspice/)
### magic
[Steps](https://ports.macports.org/port/magic/)
### klayout
[Steps](https://formulae.brew.sh/formula/ngspice)

### OpenLane
[Steps](https://openlane.readthedocs.io/en/latest/getting_started/installation/installation_macos.html#)

## Projects

[Bandgap](https://skywater-pdk.readthedocs.io/en/main/contents/libraries/sky130_fd_io/docs/user_guide.html)
[2x2_MVM]()
