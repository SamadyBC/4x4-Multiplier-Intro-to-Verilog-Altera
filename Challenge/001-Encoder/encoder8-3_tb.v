`timescale 1ns/1ns

module encoder8_3_tb;

    reg a, b, c, d, e, f, g, h;
    wire [2:0] s;

    encoder8_3 dut01 (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .h(h),
        .g(g),
        .s(s)
    );

    initial begin
        $dumpfile("encoder8_3.vcd");
        $dumpvars(0, encoder8_3_tb);
        $monitor("Tempo=%0td ns | Entradas (abcdefgh)=%b%b%b%b%b%b%b%b | Saída (s)=%b", 
                 $time, a, b, c, d, e, f, g, h, s);

        // Inicializa todas as entradas zeradas
        {a, b, c, d, e, f, g, h} = 8'b00000000;
        #10;

        // Teste 1: Apenas 'a' ativo
        {a, b, c, d, e, f, g, h} = 8'b10000000; #10;

        // Teste 2: Apenas 'b' ativo
        {a, b, c, d, e, f, g, h} = 8'b01000000; #10;

        // Teste 3: Apenas 'c' ativo
        {a, b, c, d, e, f, g, h} = 8'b00100000; #10;

        // Teste 4: Apenas 'd' ativo
        {a, b, c, d, e, f, g, h} = 8'b00010000; #10;

        // Teste 5: Apenas 'e' ativo
        {a, b, c, d, e, f, g, h} = 8'b00001000; #10;

        // Teste 6: Apenas 'f' ativo
        {a, b, c, d, e, f, g, h} = 8'b00000100; #10;

        // Teste 7: Apenas 'g' ativo
        {a, b, c, d, e, f, g, h} = 8'b00000010; #10;

        // Teste 8: Apenas 'h' ativo
        {a, b, c, d, e, f, g, h} = 8'b00000001; #10;
    end;


endmodule;