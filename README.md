Platform Designer example demonstrating sequential and burst Avalon communication from Avalon BFM to on-chip RAM.

To run the simulation on Linux navigate to the ./simulation directory and execute the "runme" script.

%> runme

You may have to change the mode of the file first.

%> chmod 755 runme

The simulation writes 16 locations of a local RAM block and then read the data back.
Next, the simulation will write a burst of 16 words to local RAM and then read the data back.
