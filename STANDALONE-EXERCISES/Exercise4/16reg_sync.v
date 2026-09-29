`timescale 1ns/1ns

module reg_sync16(
    input wire [15:0] in_reg,
    input wire clk, clken_n, clr_n,
    output reg [15:0] out_reg
);

    parameter load = 1'b1,
        clear = 1'b0;

    reg load_clear;

    always @ (*) begin
        if ( ~clken_n & ~clr_n ) begin
            load_clear <= 1'b0;
        end else if ( ~clken_n & clr_n) begin
            load_clear <= 1'b1;
        end else begin
            load_clear <= 1'b0;
        end
    end

    always @ (posedge clk) begin
        case(load_clear)
            clear: out_reg <= 16'b0000000000000000;
            load:  out_reg <= in_reg;
            default: out_reg <= 16'b0000000000000001;
        endcase
    end


endmodule;