COMP_OPT += -P /edatools/Synopsys/verdi_vL-2016.06-1/share/PLI/VCS/linux64/novas.tab \
		/edatools/Synopsys/verdi_vL-2016.06-1/share/PLI/VCS/linux64/pli.a

FLIST += -f ../testbench/flist.vcs

COMP_OPT += +vcs+initreg+random
COMP_OPT += ${FLIST}

sim:
	make -C ../hex
	vcs -full64 -debug_all ${COMP_OPT}
run: sim
	./simv +vcs+initreg+0
verdi:
	verdi -full64 ${FLIST} &
clean:
	make -C ../hex clean
	@rm -rf csrc
	@rm -rf DVEfiles
	@rm -rf inter.vpd
	@rm -rf simv
	@rm -rf simv.daidir
	@rm -rf ucli.key
	@rm -rf novas.*
	@rm -rf *.fsdb *.log
	@rm -rf verdiLog

