COMP_TOOLS := /opt/riscv32/riscv32i/bin/riscv32-unknown-elf
comp:
	${COMP_TOOLS}-as riscv-test.s -o riscv-test.o
	${COMP_TOOLS}-objcopy -O verilog --only-section ".text*" --set-start=0x0 riscv-test.o riscv-test.hex
	dos2unix riscv-test.hex
	perl convert32bit.pl

clean:
	rm -rf riscv-test.hex riscv-test.o
