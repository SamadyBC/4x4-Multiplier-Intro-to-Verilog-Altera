`timescale 1ns/1ns

module shift_register(
    input wire [7:0] inp,
    input wire [1:0] cnt,
    output reg [15:0] result
);

    always @(*) begin
        if(cnt == 2'b00) begin
            result = inp << 0;
        end 
        else if( cnt == 2'b01) begin
            result = inp << 4;
        end 
        else if (cnt == 2'b10) begin
            result = inp << 8;
        end 
        else if (cnt == 2'b11) begin
            result = inp << 0;
        end
        else result = 2'h00;
    end

endmodule