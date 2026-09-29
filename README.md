# 4x4-Multiplier-Intro-to-Verilog-Altera
Repo dedicated to document the exercises and final challenge proposed by Altera's Introduction to Verilog course.

Now, the next step is to organize each of the modules and retest it using the testbenches allready implemented. 

After that, move all of the benches into the testbench folders. And afterwards, I have to start the implementation of the top file and its testbench.

Usefull comands for this project:

iverilog -g2005 -Wall -o HW/control.vvp HW/control.v SIMULATION/control_tb.v

vvp HW/control.vvp

gtkwave SIMULATION/control.vcd
