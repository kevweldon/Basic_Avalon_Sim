# Kevin Weldon - 09/2023

set GENERATE_SIM_SCRIPTS 1
set RUN_MODELSIM 1
set OPEN_MODELSIM 1

set PROJECT top
set REVISION top
set SIMULATION_DIRECTORY simulation
set SIM_SCRIPTS ./sim_scripts

# Generate simulation setup script for IP
if {$GENERATE_SIM_SCRIPTS} {
    qexec "cd ..; ip-setup-simulation --quartus-project=$PROJECT --revision=$REVISION --output-directory=$SIM_SCRIPTS --compile-to-work --use-relative-paths; cd $SIMULATION_DIRECTORY"
}

if {$RUN_MODELSIM} {
    # Remove current wlf file
    qexec "rm -f vsim.wlf"
    # Run simulation in ModelSim
    qexec "vsim -c -do 'source run_sim.tcl'"
    # Open QuestaSim and view waves
    qexec "cp transcript sim_transcript"
}

if {$OPEN_MODELSIM} {
    qexec "vsim -gui -view vsim.wlf -do 'wave.do' &"
}
