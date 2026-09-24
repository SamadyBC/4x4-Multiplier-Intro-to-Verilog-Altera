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

    //Simula comportamento sincrono de um registrador contador
    always @ (posedge clk) begin
        if (start) count <= 2'b00;
        else count <= count + 1'b1;
    end 

    initial begin
        $dumpfile("SIMULATION/control.vcd");
        $dumpvars(0, control_tb);
        $display("TIME: %0t - INPUTS - clk: %b | rst: %b | start: %b | count: %b \n OUTPUTS - regclr: %b | clken: %b | done: %b | state_out: %b | in_sel: %b | shift: %b", $time, clk, rst, start, count, regclr, clken, done, state_out, in_sel, shift);
        $monitor("TIME: %0t - INPUTS - clk: %b | rst: %b | start: %b | count: %b \n OUTPUTS - regclr: %b | clken: %b | done: %b | state_out: %b | in_sel: %b | shift: %b", $time, clk, rst, start, count, regclr, clken, done, state_out, in_sel, shift);

        
        rst = 1'b0;
        start = 1'b0;
        //count = 2'b00;

        //Test bench inicial com ciclo interrompido e ciclo finalizado.
        //#10;
        //start = 1'b1;
        //#10;
        //start = 1'b0;
        //#40;
        //start = 1'b1;
        //#10;
        //start = 1'b0;
        //#15;
        //rst = 1'b1;
        //#5;
        //rst = 1'b0;
        //#40;
        //start = 1'b1;
        //#10;
        //start = 1'b0;
        //#40;
        
        //Test bench com erro no meio da etapa e recuperacao.
        #10;
        start = 1'b1;
        #10;
        start = 1'b0;
        #15;
        start = 1'b1;
        #15
        start = 1'b0;
        #60

        $finish;
    end



endmodule