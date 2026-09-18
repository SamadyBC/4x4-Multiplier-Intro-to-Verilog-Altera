`timescale 1ns/1ns

module control(
    input clk, rst, start,
    input wire [1:0] count,
    output regclr, clken, done,
    output wire [2:0] state_out,
    output wire [1:0] in_sel, shift
);

    parameter [2:0] IDL = 3'b000,
                    LSB = 3'b001,
                    MID = 3'b010,
                    MSB = 3'b011,
                    ERR = 3'b100;

    reg [2:0] current_state, next_state;

    //Logica do Reset
    always @ (rst) begin
        if (rst) current_state <= IDL;
        else current_state <= next_state;
    end

    //Logica do proximo estado
    always @ (*) begin 
        case(current_state)
            IDL: begin
                if (start == 1'b1) next_state <= LSB;
                else next_state <= IDL;
            end
            LSB: begin
                if (start == 1'b0 && count == 2'b00) next_state <= MID;
                else next_state <= ERR;
            end
            MID: begin
                if (start == 1'b0 && count == 2'b01) next_state <= MID;
                else if (start == 1'b0 && count == 2'b10) next_state <= MSB;
                else  next_state <= ERR;
            end
            MSB: begin
                if (start == 1'b0 && count == 2'b11) next_state <= IDL;
                else next_state <= ERR;
            end
            ERR: begin
                if (start == 1'b1) next_state <= LSB;
                else next_state <= ERR;
            end
            default: next_state <= IDL;
        endcase
    end

    //Logica de Execucao do Estado 
    always @ (*) begin 
        case(current_state)
            IDL: begin
                if (next_state == IDL) begin
                end
                else if (next_state == LSB) begin
                end
            end
            LSB: begin
                if (next_state == MID) begin
                end
                else if (next_state == ERR) begin
                end
            end
            MID: begin
                if (next_state == MID) begin 
                end
                else if (next_state == MSB) begin
                end
                else if( next_state == ERR) begin
                end
            end
            MSB: begin
                if (next_state == IDL) begin
                end
                else if (next_state == ERR) begin
                end
            end
            ERR: begin
                if (next_state == LSB) begin
                end
                else if (next_state == ERR) begin
                end
            end
            default: next_state <= IDL;
        endcase
    end

    assign state_out = current_state;


endmodule