`timescale 1ns/1ns

module sevenseg_display_tb;

    reg [2:0] inp;
    wire a, b, c, d, e, f, g;

    sevenseg_display DUT01(
        .inp(inp),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
    );

    initial begin
        $dumpfile("sevenseg_display.vcd");
        $dumpvars(0, sevenseg_display_tb);
        $monitor("Tempo=%0td ns | Entradas (inp)=%b | (abcdefg)=%b%b%b%b%b%b%b", 
                 $time, inp, a, b, c, d, e, f, g);
        inp = 3'b000; // Representa o caractere: '0'
        #40;
        inp = 3'b001; // Representa o caractere: '1'
        #40;
        inp = 3'b010; // Representa o caractere: '2'
        #40;
        inp = 3'b011; // Representa o caractere: '3'
        #40;
        inp = 3'b100; // Representa o caractere: 'E'
        #40;
        inp = 3'b101; // Representa o caractere: 'E'
        #40;
        inp = 3'b110; // Representa o caractere: 'E'
        #40;
        inp = 3'b111; // Representa o caractere: 'E'
    end


endmodule