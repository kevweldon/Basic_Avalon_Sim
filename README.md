Platform Designer example demonstrating sequential and burst Avalon communication from Avalon BFM to on-chip RAM.

To run the simulation navigate to the ./simulation directory and type the following command:

%> quartus_sh -t runme.tcl

The simulation writes 16 locations of a local RAM block and then read the data back.
Next, the simulation will write a burst of 16 words to local RAM and then read the data back.
