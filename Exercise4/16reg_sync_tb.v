`timescale 1ns/1ns

module reg_sync16_tb;

    reg [15:0] in_reg;
    reg clk, clken_n, clr_n;
    wire [15:0] out_reg;

    reg_sync16 DUT01(
        in_reg, clk, clken_n, clr_n, out_reg
    );


    
    always #5 clk = ~clk; 

    initial begin
        $dumpfile("reg_sync16.vcd");
        $dumpvars(0, reg_sync16_tb);
        $display("Time (ns): in_reg | clken_n | clr_n | out_reg");
        $monitor("%9t: %b | %b  | %b  | %b", $time, in_reg, clken_n, clr_n, out_reg);
        clk <= 1'b0;
        clken_n <= 1'b1;
        clr_n <= 1'b0;
        in_reg <= 16'haaaa;
        #10;
        clken_n <= 1'b0;
        clr_n <= 1'b0;
        #10;
        clken_n <= 1'b0;
        clr_n <= 1'b1;
        #10;

        $finish;

    end

endmodule