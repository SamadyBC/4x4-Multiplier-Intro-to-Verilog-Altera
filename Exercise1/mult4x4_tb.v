`timescale 1ns/1ns

module mult4x4_tb;

reg [3:0] a, b;
wire [7:0] product;

    mult4x4 dut01(
        a,
        b,
        product
    );

    initial begin
        $dumpfile("mult4x4.vcd");
        $dumpvars(0, mult4x4_tb);

        $display("========================================");
        $display("        Multiplier 4x4 TESTBENCH");
        $display("========================================");
        $monitor("Time (ns): %0t | a=%0h b=%0h product=%0h",
        $time, a, b, product);

        a = 4'h0;
        b = 4'h2;
        #10;
        a = 4'h2;
        b = 4'h2;
        #10;
        a = 4'h4;
        b = 4'h2;
        #10;
        a = 4'h6;
        b = 4'h2;
        #10;
        a = 4'h7;
        b = 4'h2;
        #10;
        a = 4'h8;
        b = 4'h2;
        #10;
        a = 4'h9;
        b = 4'h2;
        #10;
        a = 4'hA;
        b = 4'h2;
        #10;
    end

endmodule