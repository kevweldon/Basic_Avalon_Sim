Platform Designer example demonstrating sequential and burst Avalon communication from Avalon BFM to on-chip RAM.

To run the simulation, navigate to the ./simulation directory and type the following command:

%> quartus_sh -t runme.tcl

The runme.tcl script will first build the Platform Designer system from the my_sys.tcl script.
It will then generate the system.

Next, the runme.tcl script will generate an msim_setup.tcl script which can be used to compile all of the
associated IP in the design. The msim_setup.tcl script is sourced from within the run_sim.tcl script.

The simulation writes 16 locations of a local RAM block and then read the data back.
Next, the simulation will write a burst of 16 words to local RAM and then read the data back.
