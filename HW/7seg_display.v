`timescale 1ns/1ns

module sevenseg_display(
    input wire [2:0] inp,
    output reg a, b, c, d, e, f, g
);

    always @ (*) begin
        case(inp)
            3'b000: begin // Representa o caractere: '0'
                a <= 1'b1; 
                b <= 1'b1;
                c <= 1'b1;
                d <= 1'b1;
                e <= 1'b1;
                f <= 1'b1;
                g <= 1'b0;  
            end
            3'b001: begin // Representa o caractere: '1'
                a <= 1'b0;
                b <= 1'b1;
                c <= 1'b1;
                d <= 1'b0;
                e <= 1'b0;
                f <= 1'b0;
                g <= 1'b0;
            end
            3'b010: begin // Representa o caractere: '2'
                a <= 1'b1;
                b <= 1'b1;
                c <= 1'b0;
                d <= 1'b1;
                e <= 1'b1;
                f <= 1'b0;
                g <= 1'b1;
            end
            3'b011: begin // Representa o caractere: '3'
                a <= 1'b1;
                b <= 1'b1;
                c <= 1'b1;
                d <= 1'b1;
                e <= 1'b0;
                f <= 1'b0;
                g <= 1'b1;
            end
            3'b100: begin // Representa o caractere: 'E'
                a <= 1'b1;
                b <= 1'b0;
                c <= 1'b0;
                d <= 1'b1;
                e <= 1'b1;
                f <= 1'b1;
                g <= 1'b1;
            end
            3'b101: begin // Representa o caractere: 'E'
                a <= 1'b1;
                b <= 1'b0;
                c <= 1'b0;
                d <= 1'b1;
                e <= 1'b1;
                f <= 1'b1;
                g <= 1'b1;
            end
            3'b110: begin // Representa o caractere: 'E'
                a <= 1'b1;
                b <= 1'b0;
                c <= 1'b0;
                d <= 1'b1;
                e <= 1'b1;
                f <= 1'b1;
                g <= 1'b1;
            end
            3'b111: begin // Representa o caractere: 'E'
                a <= 1'b1;
                b <= 1'b0;
                c <= 1'b0;
                d <= 1'b1;
                e <= 1'b1;
                f <= 1'b1;
                g <= 1'b1;
            end
        endcase
    end

endmodule
