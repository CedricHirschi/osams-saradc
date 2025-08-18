XSCHEM ?= xschem-proot

XSCHEM_DIR = $(realpath $(dir $(realpath $(filter %xschem.mk,$(MAKEFILE_LIST)))))
XSCHEM_SIM_DIR = $(XSCHEM_DIR)/simulation

define run_xschem
	cd $(XSCHEM_DIR) && $(XSCHEM) $(1)
endef

$(XSCHEM_SIM_DIR):
	mkdir -p $@

$(XSCHEM_SIM_DIR)/$(TOP).spice: $(XSCHEM_SIM_DIR) $(VERILOG_SRCS)
	$(call run_xschem,-x -q -n $(TOP).sch -o $(XSCHEM_SIM_DIR))

$(XSCHEM_SIM_DIR)/$(TOP).cdl: $(XSCHEM_SIM_DIR) $(VERILOG_SRCS)
	$(call run_xschem,-x -q --tcl "set spiceprefix 0; set lvs_netlist 1" -n $(TOP).sch -o $(XSCHEM_SIM_DIR) --netlist_filename $(TOP).cdl)

## SIM-; Open the schematic in xschem
xschem: $(XSCHEM_SIM_DIR)
	$(call run_xschem,-o $(XSCHEM_SIM_DIR) $(TOP)_tb.sch)

clean_xschem:
	rm -rf $(XSCHEM_SIM_DIR)

.PHONY: xschem clean_xschem