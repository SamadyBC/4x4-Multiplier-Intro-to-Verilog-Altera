`timescale 1ns/1ns

module mux2_1(
    input wire [3:0] a, b,
    output reg [3:0] y, //Por que tem que ser um reg? Entender
    input sel
);

    always @ (*) begin
        case(sel)
            1'b0: y = a;
            1'b1: y = b;
            default: y = a;
        endcase
    end;

endmodule