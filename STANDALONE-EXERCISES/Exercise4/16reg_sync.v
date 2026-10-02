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
        if ( ~clken_n & ~clr_n ) begin //clken e clr em 0 entao clear
            load_clear <= 1'b0;
        end else if ( ~clken_n & clr_n) begin //clken  em e clr em 1 entao load
            load_clear <= 1'b1;
        end else begin
            load_clear <= 1'b0;
        end
    end

    always @ (posedge clk) begin //Load and Clear sincrono
        case(load_clear)
            clear: out_reg <= 16'h0000;
            load:  out_reg <= in_reg;
            default: out_reg <= 16'h0001;
        endcase
    end


endmodule;