# 4x4-Multiplier-Intro-to-Verilog-Altera
Repo dedicated to document the exercises and final challenge proposed by Altera's Introduction to Verilog course.


## TODO 
Now, the next step is retesting each module and its testbench. Verify if it is working as it should.
- full_adder.v and full_adder_tb.v verified;
- mult4x4.v and mult4x4_tb.v verified;
- mux2x1.v and mux2x1_tb.v verified;
- shift_register.v and shift_register_tb.v verified;
- 7seg_display.v and 7seg_display_tb.v verified;
- 16reg_sync.v and 16reg_sync_tb.v verified;


And afterwards, I have to start the implementation of the top level entity file and its testbench.

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

# Conventional Commits
The Conventional Commits specification formally defines feat and fix, but permits additional types. The standard
  @commitlint/config-conventional set is: Conventional Commits (https://www.conventionalcommits.org/) and commitlint
  configuration
  (https://github.com/conventional-changelog/commitlint/blob/master/%40commitlint/config-conventional/README.md).

  - feat: — introduces a feature
  - fix: — corrects a bug
  - refactor: — restructures code without adding a feature or fixing a bug
  - chore: — miscellaneous maintenance that does not modify application or test behavior
  - build: — changes the build system or dependencies
  - ci: — changes CI configuration or scripts
  - docs: — documentation-only changes
  - style: — formatting, whitespace, or similar changes that do not affect behavior
  - perf: — improves performance
  - test: — adds or corrects tests
  - revert: — reverts an earlier commit

  Some examples for your situation:

  refactor: reorganize source directory structure
  chore: reorganize repository configuration files
  build: reorganize build scripts
  docs: reorganize documentation
  test: reorganize test directory structure

  You can also add an optional scope:

  refactor(core): reorganize module structure
  chore(repo): move configuration files
