Platform Designer example demonstrating Avalon communication from Avalon BFM to on-chip RAM.

To run the simulation on Linux navigate to the ./simulation directory and execute the "runme" script.

%> runme

You may have to change the mode of the file first.

%> chmod 755 runme

The simulation writes to the first two locations of a local RAM block and then reads back both locations.
Next, the simulation will write a burst of eight words to local RAM and then read them back.
