`timescale 1ns/1ns

module full_adder(
    input wire [15:0] A, B,
    input c_in,
    output wire [15:0] Sum,
    output c_out
);

   assign {c_out, Sum} = A + B + c_in;

   //Why using assign?
   //This is used to assign values onto scalar and vector nets (not variables) 
   //and happens whenever there is a change in the RHS. 
   //It provides a way to model combinational logic without 
   //specifying an interconnection of gates 
   //and makes it easier to drive the net 
   //with logical expressions.

   //Continuous Assignment Use Case: Use continuous assignments to model combinational logic, data path connections, and simple logic gates. 
   //The assignment is active throughout simulation--any change to the RHS immediately propagates to the LHS

   // In RTL design for ASICs and FPGAs, continuous assignments model combinational logic (AND, OR, XOR gates, multiplexers)
   // where the output responds immediately to input changes. Procedural assignments in always @(posedge clk) blocks model sequential logic (flip-flops, registers) 
   //where outputs change only on clock edges. 

endmodule;