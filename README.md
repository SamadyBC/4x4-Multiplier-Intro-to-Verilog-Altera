# 4x4-Multiplier-Intro-to-Verilog-Altera
Repo dedicated to document the exercises and final challenge proposed by Altera's Introduction to Verilog course.


## TODO 
Now, the next step is to organize each of the modules and retest it using the testbenches allready implemented. 

And afterwards, I have to start the implementation of the top file and its testbench.

## Commands for Project

Usefull comands for this project:

iverilog -g2005 -Wall -o HW/control.vvp HW/control.v SIMULATION/control_tb.v

vvp HW/control.vvp

gtkwave SIMULATION/control.vcd

# Local environment Commands:
wsl -d Ubuntu
sudo chown -R administrator:administrator /home/administrator/Labs

# Testbench Main Native Compiller Directives
$dumpfile("meu_inversor.vcd");
$dumpvars(0, meu_inversor_tb);
$display("Time (ns): A | G ");
$monitor("%9t: %b | %b ",$time, A, G);
