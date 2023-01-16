set TOP_LEVEL_NAME top_tb
set SYSTEM_INSTANCE_NAME top_tb
#set USER_DEFINED_ELAB_OPTIONS -autoprofile=profile.pdb
set QSYS_SIMDIR "../my_sys/sim"
set WAVE_FILE wave.do

# Quit the simulation environment if you are running one
quit -sim

# Create and open a project
if {[file exists ${TOP_LEVEL_NAME}_sim.mpf]} {
    project  open ${TOP_LEVEL_NAME}_sim
} else {
    project  new . ${TOP_LEVEL_NAME}_sim
}

# Compile design IP and primitives
source ${QSYS_SIMDIR}/mentor/msim_setup.tcl
if {[file exists [file join libraries twentynm_ver _lib.qdb]] ||
    [file exists [file join libraries fourteennm_ver _lib.qdb]] ||
    [file exists [file join libraries tennm_ver _lib.qdb]]
} {
    puts "Skipping compilation of device files"
} else {
    puts "Compiling device files"
    dev_com
}
puts "Compiling design files"
# Compile design files
com

###############################
# Compile project source code #
###############################
vlog -incr -sv ./${TOP_LEVEL_NAME}.sv -L altera_common_sv_packages

# Quit without asking
set PrefMain(forceQuit) 1

# Turn on cool colors in transcript window
set PrefMain(colorizeTranscript) 1

# Turn off warnings from the std_logic_arith, std_logic_unsigned and std_logic_signed packages
#set StdArithNoWarnings = 1

# Turn off warnings from the IEEE numeric_std and numeric_bit packages
#set NumericStdNoWarnings = 1

# Suppress specific message types
#suppress 8241,2842

# Compile the simulation
# Elaborate top level design
elab_debug

# View assertions tab listing all assertions found in the simulation
view assertions

# Cause assertion failures to break/stop simulation
#assertion fail -enable -action break -r *

# Log all signals in simulation
log -r /*

# Open the waveform viewer and set the title of the window
#view wave -title "${TOP_LEVEL_NAME} simulation vectors"

# Open the signals viewer
#view signals

# Run the .do file to load the signals to be viewed
#do $WAVE_FILE

# Run the simulation
run -all

# Display the simulation statistics
#simstats
