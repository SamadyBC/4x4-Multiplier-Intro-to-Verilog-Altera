`timescale 1ns/1ns

module full_adder_tb;

reg [15:0] a, b;
reg c_in;

wire [15:0] sum;
wire c_out;

    full_adder dut(
        a, b, c_in, sum, c_out
    );

    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);

        $display("========================================");
        $display("        FULL ADDER TESTBENCH");
        $display("========================================");

        $monitor("Time (ns): %0t | a=%0h b=%0h c_in=%0h | sum=%0h c_out=%0h",
        $time, a, b, c_in, sum, c_out);
        a = 16'h0;
        b = 16'h0;
        c_in = 1'b0;
        #10;
        a = 16'h0001;
        b = 16'h0001;  
        c_in = 1'b0;
        #10;
        a = 16'h0008;
        b = 16'h0001;
        c_in = 1'b0;
        #10;
        a = 16'h0008;
        b = 16'h0001;
        c_in = 1'b1;
        #10;
        a = 16'h0008;
        b = 16'h0005;
        c_in = 'b0;
        #10;
        a = 16'h0000;
        b = 16'h0001;
        c_in = 16'h0000;
        #10;
        a = 16'h000A;
        b = 16'h0005;
        c_in = 16'h0000;
        #10;
        a = 16'h000E;
        b = 16'h0001;
        c_in = 16'h0001;
        #10;
        a = 16'hF00E;
        b = 16'h0FF1;
        c_in = 16'h0001;
    end



endmodule

// Inputs are declared of type reg so that it can be driven from a procedural block such as initial. 
// Outputs are declared as type wire so that it is visible in the testbench module and can be monitored to check design behavior