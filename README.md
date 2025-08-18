# Open Source Analog and Mixed-Signal (AMS) SAR-ADC in the SG13G2 Open PDK from IHP

This repository contains the source code for an open-source SAR-ADC designed using the SG13G2 Open PDK from IHP. For documentation on open source AMS, please refer to the [docs](https://CedricHirschi.github.io/osams-docs/).


## Repository Structure

This repository is structured as follows:
```
.
├── .devcontainer/
├── klayout/
├── openroad/
├── rtl/
├── scripts/
├── xschem/
├── yosys/
├── Makefile
└── proot.sh
```

`klayout/`, `openroad/`, `yosys/` and `rtl` contain the source code and scripts for the digital design, while `xschem/` contains the source code for the analog design. The `scripts/` directory contains various Python scripts for analyzing and visualizing the design. The `.devcontainer/` directory contains configuration files for a [dev container](https://CedricHirschi.github.io/osams-docs/setup/container/#starting-a-dev-container), and `Makefile` is used to build the project.


## Setup

Make sure to use this repository in the IIC-OSIC-TOOLS container, see more [here](https://CedricHirschi.github.io/osams-docs/setup/container/). I suggest using the dev container setup, as described in the docs.

First, you need to initialize the submodules, which pulls the [IHP Open-PDK](https://github.com/IHP-GmbH/IHP-Open-PDK):
```bash
git submodule update --init --recursive
```

Next, you should source the `proot.sh` script to set up the environment (see [here](https://CedricHirschi.github.io/osams-docs/setup/xschem/) for more details):
```bash
source proot.sh
```
This needs to be done every time you start a new terminal session and you want to work with mixed signal simulations in XSCHEM.


## Makefile Commands

The workflow is managed using a `Makefile`. Here are some common commands you can use (see all using `make`):

```bash
make xschem
```
Run XSCHEM to view the testbench of the full design.

```bash
make yosys
```
Synthesize the RTL design using Yosys

```bash
make openroad
```
Run OpenROAD to place and route the synthesized design

```bash
make klayout
```
Run KLayout to convert the design to GDS format

