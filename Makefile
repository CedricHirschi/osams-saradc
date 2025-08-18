

all:
	@echo Available targets:
	@for mkfile in $(MAKEFILE_LIST); do \
		awk '/^[a-zA-Z\-0-9]+:/ { \
			helpMessage = match(lastLine, /^## (.*)/); \
			if (helpMessage) { \
				helpCommand = substr($$1, 0, index($$1, ":")-1); \
				helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
				printf "%-20s %s\n", helpCommand, helpMessage; \
			} \
		} \
		{ lastLine = $$0 }' $$mkfile; \
	done

# Schematic capture & Simulation
include xschem/xschem.mk

# Synthesis & PNR
include yosys/yosys.mk
include openroad/openroad.mk
include klayout/klayout.mk

clean:
	$(MAKE) clean_klayout
	$(MAKE) clean_openroad
	$(MAKE) clean_xschem
	$(MAKE) clean_yosys

.PHONY: all clean
.PHONY: iverilog klayout openroad xschem yosys