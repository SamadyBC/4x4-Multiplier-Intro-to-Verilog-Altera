`timescale 1ns/1ns

    //In this case the output must be a reg var since it stores the value from a net input. And also because it is inside a procudural block.
module mux2_1(
    input wire [3:0] a, b,
    output reg [3:0] y,
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