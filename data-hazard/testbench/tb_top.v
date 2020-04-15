`timescale 1ns/1ps
module tb_top;
    reg clk = 0;
    reg rst_n = 0;

    always #5 clk = ~clk;

    initial begin
        #500;
        $finish();
    end

    initial begin
        $fsdbDumpfile("vg_dump.fsdb");
        $fsdbDumpon;
        $fsdbDumpvars();
        $fsdbDumpMDA;
    end

    initial begin
        $readmemh("../hex/data.hex", cpu.DMemory);
        $readmemh("../hex/riscv-test.hex", cpu.IMemory);
    end

RISCVCPU cpu(.clock(clk));

endmodule
