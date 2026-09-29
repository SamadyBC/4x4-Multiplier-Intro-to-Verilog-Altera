`timescale 1ns/1ns

module control_tb;
    reg clk, rst, start;
    reg [1:0] count;
    wire regclr, clken, done;
    wire [2:0] state_out;
    wire [1:0] in_sel, shift;

    control DUT01(
        .clk(clk), .rst(rst), .start(start),
        .count(count),
        .regclr(regclr), .clken(clken), .done(done),
        .state_out(state_out),
        .in_sel(in_sel), .shift(shift)
    );

    initial clk = 1'b0;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("control.vcd");
        $dumpvars(0, control_tb);
        $display("TIME: %0t - INPUTS - clk: %b | rst: %b | start: %b | count: %b \n OUTPUTS - regclr: %b | clken: %b | done: %b | state_out: %b | in_sel: %b | shift: %b", $time, clk, rst, start, count, regclr, clken, done, state_out, in_sel, shift);
        $monitor("TIME: %0t - INPUTS - clk: %b | rst: %b | start: %b | count: %b \n OUTPUTS - regclr: %b | clken: %b | done: %b | state_out: %b | in_sel: %b | shift: %b", $time, clk, rst, start, count, regclr, clken, done, state_out, in_sel, shift);


    end


endmodule