KLAYOUT ?= klayout

KLAYOUT_DIR := $(realpath $(dir $(realpath $(filter %klayout.mk,$(MAKEFILE_LIST)))))
# KLAYOUT_SIM_DIR = ../xschem/simulation

# $(TOP).gds: $(KLAYOUT_SIM_DIR)/$(TOP).spice
# 	$(KLAYOUT) -n sg13g2 -zz -r generator.py -rd netlist=$(KLAYOUT_SIM_DIR)/$(TOP).spice -rd output=$(TOP).gds

# ## Open the layout in KLayout
# klayout: $(TOP).gds $(KLAYOUT_SIM_DIR)/$(TOP).cdl
# 	$(KLAYOUT) -n sg13g2 $(TOP).gds -e

## IMP3; Convert design to GDS
klayout:
	$(KLAYOUT_DIR)/def2gds.sh

clean_klayout:
	rm -f *.gds