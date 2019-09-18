# Nandgame-cpu
A VHDL implementation of the CPU built in www.nandgame.com

Roughly speaking, each module corresponds to one level in the game, although several levels are skipped because they are either trivial and would result in too many modules (like the half-adder) or are built into the language, like the basic logic gates and flip-flops.

For further development, I will be adding a seperate write-only jump register (rather than sharing the address register) as well as read access to the Program Counter.
