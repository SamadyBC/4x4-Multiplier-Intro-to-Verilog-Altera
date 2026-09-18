`timescale 1ns/1ns

module control(
    input clk, rst, start,
    input wire [1:0] count,
    output reg regclr, clken, done,
    output reg [2:0] state_out,
    output reg [1:0] in_sel, shift
);

    parameter [2:0] IDL = 3'b000,
                    LSB = 3'b001,
                    MID = 3'b010,
                    MSB = 3'b011,
                    ERR = 3'b100;

    reg [2:0] current_state, next_state;

    //Logica do Reset
    always @ (posedge clk) begin
        if (rst) current_state <= IDL;
        else current_state <= next_state;
    end

    //Logica do proximo estado
    always @ (*) begin 
        //Boa pratica para nao gerar latches é inicializar as saidas
        case(current_state)
            IDL: begin
                if (start == 1'b1) begin 
                    next_state = LSB;
                    done = 1'b0;
                    clken = 1'b1;
                    regclr = 1'b0;
                end
                else begin 
                    next_state = IDL;
                    done = 1'b0;
                    clken = 1'b1;
                    regclr = 1'b1;
                end
            end
            LSB: begin
                if (start == 1'b0 && count == 2'b00) begin
                    next_state = MID;
                    in_sel = 2'b00;
                    shift = 2'b00;
                    done = 1'b0;
                    clken = 1'b0;
                    regclr = 1'b1;
                end
                else begin
                    next_state = ERR;
                    done = 1'b0;
                    clken = 1'b1;
                    regclr = 1'b1;
                end
            end
            MID: begin
                if (start == 1'b0 && count == 2'b01) begin
                    next_state = MID;
                    in_sel = 2'b01;
                    shift = 2'b01;
                    done = 1'b0;
                    clken = 1'b0;
                    regclr = 1'b1;
                end
                else if (start == 1'b0 && count == 2'b10) begin
                    next_state = MSB;
                    in_sel = 2'b10;
                    shift = 2'b01;
                    done = 1'b0;
                    clken = 1'b0;
                    regclr = 1'b1;
                end
                else begin
                    next_state = ERR;
                    done = 1'b0;
                    clken = 1'b1;
                    regclr = 1'b1;
                end
            end
            MSB: begin
                if (start == 1'b0 && count == 2'b11) next_state = IDL;
                else next_state = ERR;
            end
            ERR: begin
                if (start == 1'b1) next_state = LSB;
                else next_state = ERR;
            end
            default: next_state = IDL;
        endcase
    end

    assign state_out = current_state;

endmodule