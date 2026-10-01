`timescale 1ns/1ns

module shift_register_tb;

    reg [7:0] inp; //Revisar por que aqui deve ser reg
    reg [1:0] cnt;
    wire  [15:0] result; // revisar por que aqui deve ser wire

    shift_register DUT01(
        .inp(inp),
        .cnt(cnt),
        .result(result)
    );

    initial begin
        $dumpfile("shift_register.vcd");
        $dumpvars(0, shift_register_tb);
        $monitor("Tempo=%0td ns | Entradas (inp)=%b | (cnt)=%b | Saída (result)=%b", 
                 $time, inp, cnt, result);
        inp = 8'b11110000;
        cnt = 2'b00;
        #50;
        cnt = 2'b01;
        #50;
        cnt = 2'b10;
        #50;
        cnt = 2'b11;
        #50;
        cnt = 2'bxx;
        #50;
    end


endmodule;