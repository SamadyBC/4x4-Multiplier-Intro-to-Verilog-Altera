`timescale 1ns/1ns

module mux2_1_tb;

    reg [3:0] a, b;
    reg sel;
    wire [3:0] y;

    mux2_1 dut01(
        .a(a),
        .b(b),
        .y(y),
        .sel(sel)
    );

    initial begin
        $dumpfile("mux2_1.vcd");
        $dumpvars(0, mux2_1_tb);

        $display("========================================");
        $display("        Multiplexer 2x1 TESTBENCH");
        $display("========================================");
        $monitor("Time (ns): %0t | a=%0h - b=%0h - sel= %0h y=%0h",
        $time, a, b, sel, y);

        sel = 1'b0;
        a = 4'h0;
        b = 4'hA;
        #20;
        sel = 1'b1;
        #30;
        a = 4'h1;
        b = 4'hB;
        sel = 1'b0;
        #20;
        sel = 1'b1;
        #30;
        a = 4'h2;
        b = 4'hC;
        sel = 1'b0;
        #20;
        sel = 1'b1;
        #30;
    end;


endmodule