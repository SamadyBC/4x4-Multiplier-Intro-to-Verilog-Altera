`timescale 1ns/1ns

module mult4x4(
    input wire [3:0] a, b,
    output wire [7:0] product
);

assign product = a * b;

endmodule