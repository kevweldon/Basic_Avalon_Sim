# Kevin Weldon - 09/2023
# Fixed windows seperator - 04/12/24

set GENERATE_PD_SYSTEM 1
set GENERATE_SIM_SCRIPTS 1
set RUN_MODELSIM 1
set OPEN_MODELSIM 1

set PROJECT my_sys
set REVISION my_sys
set SIMULATION_DIRECTORY simulation
set SIM_SCRIPTS ./sim_scripts

set OS [lindex $tcl_platform(os) 0]
if { $OS == "Windows" } {
    set sep "&"
    set rm "del"
    set cp "copy"
} else {
    set sep ";"
    set rm "rm"
    set cp "cp"
}

# Generate Platform Designer system from Tcl script
if {$GENERATE_PD_SYSTEM} {
    # Check to see if the Platform Designer system has already been created
    if {![file exists [file join .. ${PROJECT}.qsys]]} {
	qexec "cd .. $sep qsys-script --script=${PROJECT}.tcl"
    }
    # Generate Platform Designer system
    qexec "cd .. $sep qsys-generate ${PROJECT}.qsys --quartus-project=${PROJECT} -rev=${PROJECT} --clear-output-directory --parallel=off -simulator=MODELSIM -synthesis=Verilog -simulation=Verilog"
}

# Generate simulation setup script for IP
if {$GENERATE_SIM_SCRIPTS} {
    qexec "cd .. $sep ip-setup-simulation --quartus-project=$PROJECT --revision=$REVISION --output-directory=$SIM_SCRIPTS --compile-to-work --use-relative-paths"
}

if {$RUN_MODELSIM} {
    # Remove current wlf file
    qexec "$rm -f vsim.wlf"
    # Run simulation in ModelSim
    qexec "vsim -c -do 'source run_sim.tcl'"
    # Open QuestaSim and view waves
    qexec "$cp transcript sim_transcript"
}

if {$OPEN_MODELSIM} {
    # Open QuestaSim and run DO file
    qexec "vsim -gui -view vsim.wlf -do 'wave.do' &"
}
