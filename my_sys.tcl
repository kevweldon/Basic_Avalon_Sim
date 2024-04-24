package require -exact qsys 24.1

# create the system "my_sys"
proc do_create_my_sys {} {
	# create the system
	create_system my_sys
	set_project_property BOARD {default}
	set_project_property DEVICE {AGFB014R24A3E3V}
	set_project_property DEVICE_FAMILY {Agilex 7}
	set_project_property HIDE_FROM_IP_CATALOG {false}
	set_use_testbench_naming_pattern 0 {}

	# add HDL parameters

	# add the components
	add_component clock_in ip/my_sys/my_sys_clock_in.ip altera_clock_bridge clock_in 19.2.0
	load_component clock_in
	set_component_parameter_value EXPLICIT_CLOCK_RATE {50000000.0}
	set_component_parameter_value NUM_CLOCK_OUTPUTS {1}
	set_component_project_property HIDE_FROM_IP_CATALOG {false}
	save_component
	load_instantiation clock_in
	remove_instantiation_interfaces_and_ports
	add_instantiation_interface in_clk clock INPUT
	set_instantiation_interface_parameter_value in_clk clockRate {0}
	set_instantiation_interface_parameter_value in_clk externallyDriven {false}
	set_instantiation_interface_parameter_value in_clk ptfSchematicName {}
	add_instantiation_interface_port in_clk in_clk clk 1 STD_LOGIC Input
	add_instantiation_interface out_clk clock OUTPUT
	set_instantiation_interface_parameter_value out_clk associatedDirectClock {in_clk}
	set_instantiation_interface_parameter_value out_clk clockRate {50000000}
	set_instantiation_interface_parameter_value out_clk clockRateKnown {true}
	set_instantiation_interface_parameter_value out_clk externallyDriven {false}
	set_instantiation_interface_parameter_value out_clk ptfSchematicName {}
	set_instantiation_interface_sysinfo_parameter_value out_clk clock_rate {50000000}
	add_instantiation_interface_port out_clk out_clk clk 1 STD_LOGIC Output
	save_instantiation
	add_component mm_master_bfm_0 ip/my_sys/my_sys_mm_master_bfm_0.ip altera_avalon_mm_master_bfm mm_master_bfm_0 19.1
	load_component mm_master_bfm_0
	set_component_parameter_value ADDRESS_UNITS {SYMBOLS}
	set_component_parameter_value ASSERT_HIGH_ARBITERLOCK {1}
	set_component_parameter_value ASSERT_HIGH_BYTEENABLE {1}
	set_component_parameter_value ASSERT_HIGH_LOCK {1}
	set_component_parameter_value ASSERT_HIGH_READ {1}
	set_component_parameter_value ASSERT_HIGH_READDATAVALID {1}
	set_component_parameter_value ASSERT_HIGH_RESET {1}
	set_component_parameter_value ASSERT_HIGH_WAITREQUEST {1}
	set_component_parameter_value ASSERT_HIGH_WRITE {1}
	set_component_parameter_value AV_ADDRESS_W {32}
	set_component_parameter_value AV_ALWAYS_BURST_MAX_BURST {0}
	set_component_parameter_value AV_BURSTCOUNT_W {8}
	set_component_parameter_value AV_BURST_BNDR_ONLY {1}
	set_component_parameter_value AV_BURST_LINEWRAP {1}
	set_component_parameter_value AV_CONSTANT_BURST_BEHAVIOR {1}
	set_component_parameter_value AV_FIX_READ_LATENCY {2}
	set_component_parameter_value AV_MAX_PENDING_READS {0}
	set_component_parameter_value AV_MAX_PENDING_WRITES {0}
	set_component_parameter_value AV_NUMSYMBOLS {4}
	set_component_parameter_value AV_READRESPONSE_W {8}
	set_component_parameter_value AV_READ_WAIT_TIME {0}
	set_component_parameter_value AV_REGISTERINCOMINGSIGNALS {0}
	set_component_parameter_value AV_SYMBOL_W {8}
	set_component_parameter_value AV_WAITREQUEST_ALLOWANCE {0}
	set_component_parameter_value AV_WRITERESPONSE_W {8}
	set_component_parameter_value AV_WRITE_WAIT_TIME {0}
	set_component_parameter_value REGISTER_WAITREQUEST {0}
	set_component_parameter_value USE_ADDRESS {1}
	set_component_parameter_value USE_ARBITERLOCK {0}
	set_component_parameter_value USE_BEGIN_BURST_TRANSFER {0}
	set_component_parameter_value USE_BEGIN_TRANSFER {0}
	set_component_parameter_value USE_BURSTCOUNT {1}
	set_component_parameter_value USE_BYTE_ENABLE {1}
	set_component_parameter_value USE_CLKEN {0}
	set_component_parameter_value USE_DEBUGACCESS {0}
	set_component_parameter_value USE_LOCK {0}
	set_component_parameter_value USE_READ {1}
	set_component_parameter_value USE_READRESPONSE {0}
	set_component_parameter_value USE_READ_DATA {1}
	set_component_parameter_value USE_READ_DATA_VALID {1}
	set_component_parameter_value USE_TRANSACTIONID {0}
	set_component_parameter_value USE_WAIT_REQUEST {1}
	set_component_parameter_value USE_WRITE {1}
	set_component_parameter_value USE_WRITERESPONSE {0}
	set_component_parameter_value USE_WRITE_DATA {1}
	set_component_parameter_value VHDL_ID {0}
	set_component_project_property HIDE_FROM_IP_CATALOG {false}
	save_component
	load_instantiation mm_master_bfm_0
	remove_instantiation_interfaces_and_ports
	add_instantiation_interface clk clock INPUT
	set_instantiation_interface_parameter_value clk clockRate {0}
	set_instantiation_interface_parameter_value clk externallyDriven {false}
	set_instantiation_interface_parameter_value clk ptfSchematicName {}
	add_instantiation_interface_port clk clk clk 1 STD_LOGIC Input
	add_instantiation_interface clk_reset reset INPUT
	set_instantiation_interface_parameter_value clk_reset associatedClock {clk}
	set_instantiation_interface_parameter_value clk_reset synchronousEdges {DEASSERT}
	add_instantiation_interface_port clk_reset reset reset 1 STD_LOGIC Input
	add_instantiation_interface m0 avalon OUTPUT
	set_instantiation_interface_parameter_value m0 adaptsTo {}
	set_instantiation_interface_parameter_value m0 addressGroup {0}
	set_instantiation_interface_parameter_value m0 addressUnits {SYMBOLS}
	set_instantiation_interface_parameter_value m0 alwaysBurstMaxBurst {false}
	set_instantiation_interface_parameter_value m0 associatedClock {clk}
	set_instantiation_interface_parameter_value m0 associatedReset {clk_reset}
	set_instantiation_interface_parameter_value m0 bitsPerSymbol {8}
	set_instantiation_interface_parameter_value m0 burstOnBurstBoundariesOnly {true}
	set_instantiation_interface_parameter_value m0 burstcountUnits {WORDS}
	set_instantiation_interface_parameter_value m0 constantBurstBehavior {true}
	set_instantiation_interface_parameter_value m0 dBSBigEndian {false}
	set_instantiation_interface_parameter_value m0 doStreamReads {false}
	set_instantiation_interface_parameter_value m0 doStreamWrites {false}
	set_instantiation_interface_parameter_value m0 holdTime {0}
	set_instantiation_interface_parameter_value m0 interleaveBursts {false}
	set_instantiation_interface_parameter_value m0 isAsynchronous {false}
	set_instantiation_interface_parameter_value m0 isBigEndian {false}
	set_instantiation_interface_parameter_value m0 isReadable {false}
	set_instantiation_interface_parameter_value m0 isWriteable {false}
	set_instantiation_interface_parameter_value m0 linewrapBursts {true}
	set_instantiation_interface_parameter_value m0 maxAddressWidth {32}
	set_instantiation_interface_parameter_value m0 maximumPendingReadTransactions {0}
	set_instantiation_interface_parameter_value m0 maximumPendingWriteTransactions {0}
	set_instantiation_interface_parameter_value m0 minimumReadLatency {1}
	set_instantiation_interface_parameter_value m0 minimumResponseLatency {1}
	set_instantiation_interface_parameter_value m0 prSafe {false}
	set_instantiation_interface_parameter_value m0 readLatency {0}
	set_instantiation_interface_parameter_value m0 readWaitTime {0}
	set_instantiation_interface_parameter_value m0 registerIncomingSignals {false}
	set_instantiation_interface_parameter_value m0 registerOutgoingSignals {false}
	set_instantiation_interface_parameter_value m0 setupTime {0}
	set_instantiation_interface_parameter_value m0 timingUnits {Cycles}
	set_instantiation_interface_parameter_value m0 waitrequestAllowance {0}
	set_instantiation_interface_parameter_value m0 writeWaitTime {0}
	add_instantiation_interface_port m0 avm_address address 32 STD_LOGIC_VECTOR Output
	add_instantiation_interface_port m0 avm_burstcount burstcount 8 STD_LOGIC_VECTOR Output
	add_instantiation_interface_port m0 avm_readdata readdata 32 STD_LOGIC_VECTOR Input
	add_instantiation_interface_port m0 avm_writedata writedata 32 STD_LOGIC_VECTOR Output
	add_instantiation_interface_port m0 avm_waitrequest waitrequest 1 STD_LOGIC Input
	add_instantiation_interface_port m0 avm_write write 1 STD_LOGIC Output
	add_instantiation_interface_port m0 avm_read read 1 STD_LOGIC Output
	add_instantiation_interface_port m0 avm_byteenable byteenable 4 STD_LOGIC_VECTOR Output
	add_instantiation_interface_port m0 avm_readdatavalid readdatavalid 1 STD_LOGIC Input
	save_instantiation
	add_component onchip_memory2_0 ip/my_sys/my_sys_onchip_memory2_0.ip altera_avalon_onchip_memory2 onchip_memory2_0 19.3.9
	load_component onchip_memory2_0
	set_component_parameter_value allowInSystemMemoryContentEditor {0}
	set_component_parameter_value blockType {M20K}
	set_component_parameter_value copyInitFile {0}
	set_component_parameter_value dataWidth {32}
	set_component_parameter_value dataWidth2 {32}
	set_component_parameter_value dualPort {0}
	set_component_parameter_value ecc_enabled {0}
	set_component_parameter_value enPRInitMode {0}
	set_component_parameter_value enableDiffWidth {0}
	set_component_parameter_value initMemContent {1}
	set_component_parameter_value initializationFileName {onchip_mem.hex}
	set_component_parameter_value instanceID {NONE}
	set_component_parameter_value memorySize {1024.0}
	set_component_parameter_value readDuringWriteMode {DONT_CARE}
	set_component_parameter_value resetrequest_enabled {1}
	set_component_parameter_value simAllowMRAMContentsFile {0}
	set_component_parameter_value simMemInitOnlyFilename {0}
	set_component_parameter_value singleClockOperation {0}
	set_component_parameter_value slave1Latency {2}
	set_component_parameter_value slave2Latency {1}
	set_component_parameter_value useNonDefaultInitFile {0}
	set_component_parameter_value useShallowMemBlocks {0}
	set_component_parameter_value writable {1}
	set_component_project_property HIDE_FROM_IP_CATALOG {false}
	save_component
	load_instantiation onchip_memory2_0
	remove_instantiation_interfaces_and_ports
	set_instantiation_assignment_value embeddedsw.CMacro.ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR {0}
	set_instantiation_assignment_value embeddedsw.CMacro.ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE {0}
	set_instantiation_assignment_value embeddedsw.CMacro.CONTENTS_INFO {""}
	set_instantiation_assignment_value embeddedsw.CMacro.DUAL_PORT {0}
	set_instantiation_assignment_value embeddedsw.CMacro.GUI_RAM_BLOCK_TYPE {M20K}
	set_instantiation_assignment_value embeddedsw.CMacro.INIT_CONTENTS_FILE {my_sys_onchip_memory2_0_onchip_memory2_0}
	set_instantiation_assignment_value embeddedsw.CMacro.INIT_MEM_CONTENT {1}
	set_instantiation_assignment_value embeddedsw.CMacro.INSTANCE_ID {NONE}
	set_instantiation_assignment_value embeddedsw.CMacro.NON_DEFAULT_INIT_FILE_ENABLED {0}
	set_instantiation_assignment_value embeddedsw.CMacro.RAM_BLOCK_TYPE {M20K}
	set_instantiation_assignment_value embeddedsw.CMacro.READ_DURING_WRITE_MODE {DONT_CARE}
	set_instantiation_assignment_value embeddedsw.CMacro.SINGLE_CLOCK_OP {0}
	set_instantiation_assignment_value embeddedsw.CMacro.SIZE_MULTIPLE {1}
	set_instantiation_assignment_value embeddedsw.CMacro.SIZE_VALUE {1024}
	set_instantiation_assignment_value embeddedsw.CMacro.WRITABLE {1}
	set_instantiation_assignment_value embeddedsw.memoryInfo.DAT_SYM_INSTALL_DIR {SIM_DIR}
	set_instantiation_assignment_value embeddedsw.memoryInfo.GENERATE_DAT_SYM {1}
	set_instantiation_assignment_value embeddedsw.memoryInfo.GENERATE_HEX {1}
	set_instantiation_assignment_value embeddedsw.memoryInfo.HAS_BYTE_LANE {0}
	set_instantiation_assignment_value embeddedsw.memoryInfo.HEX_INSTALL_DIR {QPF_DIR}
	set_instantiation_assignment_value embeddedsw.memoryInfo.MEM_INIT_DATA_WIDTH {32}
	set_instantiation_assignment_value embeddedsw.memoryInfo.MEM_INIT_FILENAME {my_sys_onchip_memory2_0_onchip_memory2_0}
	set_instantiation_assignment_value postgeneration.simulation.init_file.param_name {INIT_FILE}
	set_instantiation_assignment_value postgeneration.simulation.init_file.type {MEM_INIT}
	add_instantiation_interface clk1 clock INPUT
	set_instantiation_interface_parameter_value clk1 clockRate {0}
	set_instantiation_interface_parameter_value clk1 externallyDriven {false}
	set_instantiation_interface_parameter_value clk1 ptfSchematicName {}
	add_instantiation_interface_port clk1 clk clk 1 STD_LOGIC Input
	add_instantiation_interface s1 avalon INPUT
	set_instantiation_interface_parameter_value s1 addressAlignment {DYNAMIC}
	set_instantiation_interface_parameter_value s1 addressGroup {0}
	set_instantiation_interface_parameter_value s1 addressSpan {1024}
	set_instantiation_interface_parameter_value s1 addressUnits {WORDS}
	set_instantiation_interface_parameter_value s1 alwaysBurstMaxBurst {false}
	set_instantiation_interface_parameter_value s1 associatedClock {clk1}
	set_instantiation_interface_parameter_value s1 associatedReset {reset1}
	set_instantiation_interface_parameter_value s1 bitsPerSymbol {8}
	set_instantiation_interface_parameter_value s1 bridgedAddressOffset {0}
	set_instantiation_interface_parameter_value s1 bridgesToMaster {}
	set_instantiation_interface_parameter_value s1 burstOnBurstBoundariesOnly {false}
	set_instantiation_interface_parameter_value s1 burstcountUnits {WORDS}
	set_instantiation_interface_parameter_value s1 constantBurstBehavior {false}
	set_instantiation_interface_parameter_value s1 dfhFeatureGuid {0}
	set_instantiation_interface_parameter_value s1 dfhFeatureId {35}
	set_instantiation_interface_parameter_value s1 dfhFeatureMajorVersion {0}
	set_instantiation_interface_parameter_value s1 dfhFeatureMinorVersion {0}
	set_instantiation_interface_parameter_value s1 dfhFeatureType {3}
	set_instantiation_interface_parameter_value s1 dfhGroupId {0}
	set_instantiation_interface_parameter_value s1 dfhParameterData {}
	set_instantiation_interface_parameter_value s1 dfhParameterDataLength {}
	set_instantiation_interface_parameter_value s1 dfhParameterId {}
	set_instantiation_interface_parameter_value s1 dfhParameterName {}
	set_instantiation_interface_parameter_value s1 dfhParameterVersion {}
	set_instantiation_interface_parameter_value s1 explicitAddressSpan {1024}
	set_instantiation_interface_parameter_value s1 holdTime {0}
	set_instantiation_interface_parameter_value s1 interleaveBursts {false}
	set_instantiation_interface_parameter_value s1 isBigEndian {false}
	set_instantiation_interface_parameter_value s1 isFlash {false}
	set_instantiation_interface_parameter_value s1 isMemoryDevice {true}
	set_instantiation_interface_parameter_value s1 isNonVolatileStorage {false}
	set_instantiation_interface_parameter_value s1 linewrapBursts {false}
	set_instantiation_interface_parameter_value s1 maximumPendingReadTransactions {0}
	set_instantiation_interface_parameter_value s1 maximumPendingWriteTransactions {0}
	set_instantiation_interface_parameter_value s1 minimumReadLatency {1}
	set_instantiation_interface_parameter_value s1 minimumResponseLatency {1}
	set_instantiation_interface_parameter_value s1 minimumUninterruptedRunLength {1}
	set_instantiation_interface_parameter_value s1 prSafe {false}
	set_instantiation_interface_parameter_value s1 printableDevice {false}
	set_instantiation_interface_parameter_value s1 readLatency {2}
	set_instantiation_interface_parameter_value s1 readWaitStates {0}
	set_instantiation_interface_parameter_value s1 readWaitTime {0}
	set_instantiation_interface_parameter_value s1 registerIncomingSignals {false}
	set_instantiation_interface_parameter_value s1 registerOutgoingSignals {false}
	set_instantiation_interface_parameter_value s1 setupTime {0}
	set_instantiation_interface_parameter_value s1 timingUnits {Cycles}
	set_instantiation_interface_parameter_value s1 transparentBridge {false}
	set_instantiation_interface_parameter_value s1 waitrequestAllowance {0}
	set_instantiation_interface_parameter_value s1 wellBehavedWaitrequest {false}
	set_instantiation_interface_parameter_value s1 writeLatency {0}
	set_instantiation_interface_parameter_value s1 writeWaitStates {0}
	set_instantiation_interface_parameter_value s1 writeWaitTime {0}
	set_instantiation_interface_assignment_value s1 embeddedsw.configuration.isFlash {0}
	set_instantiation_interface_assignment_value s1 embeddedsw.configuration.isMemoryDevice {1}
	set_instantiation_interface_assignment_value s1 embeddedsw.configuration.isNonVolatileStorage {0}
	set_instantiation_interface_assignment_value s1 embeddedsw.configuration.isPrintableDevice {0}
	set_instantiation_interface_sysinfo_parameter_value s1 address_map {<address-map><slave name='s1' start='0x0' end='0x400' datawidth='32' /></address-map>}
	set_instantiation_interface_sysinfo_parameter_value s1 address_width {10}
	set_instantiation_interface_sysinfo_parameter_value s1 max_slave_data_width {32}
	add_instantiation_interface_port s1 address address 8 STD_LOGIC_VECTOR Input
	add_instantiation_interface_port s1 clken clken 1 STD_LOGIC Input
	add_instantiation_interface_port s1 chipselect chipselect 1 STD_LOGIC Input
	add_instantiation_interface_port s1 write write 1 STD_LOGIC Input
	add_instantiation_interface_port s1 readdata readdata 32 STD_LOGIC_VECTOR Output
	add_instantiation_interface_port s1 writedata writedata 32 STD_LOGIC_VECTOR Input
	add_instantiation_interface_port s1 byteenable byteenable 4 STD_LOGIC_VECTOR Input
	add_instantiation_interface reset1 reset INPUT
	set_instantiation_interface_parameter_value reset1 associatedClock {clk1}
	set_instantiation_interface_parameter_value reset1 synchronousEdges {DEASSERT}
	add_instantiation_interface_port reset1 reset reset 1 STD_LOGIC Input
	add_instantiation_interface_port reset1 reset_req reset_req 1 STD_LOGIC Input
	save_instantiation
	add_component reset_in ip/my_sys/my_sys_reset_in.ip altera_reset_bridge reset_in 19.2.0
	load_component reset_in
	set_component_parameter_value ACTIVE_LOW_RESET {0}
	set_component_parameter_value NUM_RESET_OUTPUTS {1}
	set_component_parameter_value SYNCHRONOUS_EDGES {deassert}
	set_component_parameter_value SYNC_RESET {0}
	set_component_parameter_value USE_RESET_REQUEST {0}
	set_component_project_property HIDE_FROM_IP_CATALOG {false}
	save_component
	load_instantiation reset_in
	remove_instantiation_interfaces_and_ports
	add_instantiation_interface clk clock INPUT
	set_instantiation_interface_parameter_value clk clockRate {0}
	set_instantiation_interface_parameter_value clk externallyDriven {false}
	set_instantiation_interface_parameter_value clk ptfSchematicName {}
	add_instantiation_interface_port clk clk clk 1 STD_LOGIC Input
	add_instantiation_interface in_reset reset INPUT
	set_instantiation_interface_parameter_value in_reset associatedClock {clk}
	set_instantiation_interface_parameter_value in_reset synchronousEdges {DEASSERT}
	add_instantiation_interface_port in_reset in_reset reset 1 STD_LOGIC Input
	add_instantiation_interface out_reset reset OUTPUT
	set_instantiation_interface_parameter_value out_reset associatedClock {clk}
	set_instantiation_interface_parameter_value out_reset associatedDirectReset {in_reset}
	set_instantiation_interface_parameter_value out_reset associatedResetSinks {in_reset}
	set_instantiation_interface_parameter_value out_reset synchronousEdges {DEASSERT}
	add_instantiation_interface_port out_reset out_reset reset 1 STD_LOGIC Output
	save_instantiation

	# add wirelevel expressions

	# preserve ports for debug

	# add the connections
	add_connection clock_in.out_clk/mm_master_bfm_0.clk
	set_connection_parameter_value clock_in.out_clk/mm_master_bfm_0.clk clockDomainSysInfo {-1}
	set_connection_parameter_value clock_in.out_clk/mm_master_bfm_0.clk clockRateSysInfo {50000000.0}
	set_connection_parameter_value clock_in.out_clk/mm_master_bfm_0.clk clockResetSysInfo {}
	set_connection_parameter_value clock_in.out_clk/mm_master_bfm_0.clk resetDomainSysInfo {-1}
	add_connection clock_in.out_clk/onchip_memory2_0.clk1
	set_connection_parameter_value clock_in.out_clk/onchip_memory2_0.clk1 clockDomainSysInfo {-1}
	set_connection_parameter_value clock_in.out_clk/onchip_memory2_0.clk1 clockRateSysInfo {50000000.0}
	set_connection_parameter_value clock_in.out_clk/onchip_memory2_0.clk1 clockResetSysInfo {}
	set_connection_parameter_value clock_in.out_clk/onchip_memory2_0.clk1 resetDomainSysInfo {-1}
	add_connection clock_in.out_clk/reset_in.clk
	set_connection_parameter_value clock_in.out_clk/reset_in.clk clockDomainSysInfo {-1}
	set_connection_parameter_value clock_in.out_clk/reset_in.clk clockRateSysInfo {50000000.0}
	set_connection_parameter_value clock_in.out_clk/reset_in.clk clockResetSysInfo {}
	set_connection_parameter_value clock_in.out_clk/reset_in.clk resetDomainSysInfo {-1}
	add_connection mm_master_bfm_0.m0/onchip_memory2_0.s1
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 addressMapSysInfo {}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 addressWidthSysInfo {}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 arbitrationPriority {1}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 baseAddress {0x0000}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 defaultConnection {0}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 domainAlias {}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.burstAdapterImplementation {GENERIC_CONVERTER}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.clockCrossingAdapter {HANDSHAKE}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.enableAllPipelines {FALSE}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.enableEccProtection {FALSE}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.enableInstrumentation {FALSE}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.enableOutOfOrderSupport {FALSE}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.insertDefaultSlave {FALSE}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.interconnectResetSource {DEFAULT}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.interconnectType {STANDARD}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.maxAdditionalLatency {1}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.optimizeRdFifoSize {FALSE}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.piplineType {PIPELINE_STAGE}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.responseFifoType {REGISTER_BASED}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.syncResets {TRUE}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 qsys_mm.widthAdapterImplementation {GENERIC_CONVERTER}
	set_connection_parameter_value mm_master_bfm_0.m0/onchip_memory2_0.s1 slaveDataWidthSysInfo {-1}
	add_connection reset_in.out_reset/mm_master_bfm_0.clk_reset
	set_connection_parameter_value reset_in.out_reset/mm_master_bfm_0.clk_reset clockDomainSysInfo {-1}
	set_connection_parameter_value reset_in.out_reset/mm_master_bfm_0.clk_reset clockResetSysInfo {}
	set_connection_parameter_value reset_in.out_reset/mm_master_bfm_0.clk_reset resetDomainSysInfo {-1}
	add_connection reset_in.out_reset/onchip_memory2_0.reset1
	set_connection_parameter_value reset_in.out_reset/onchip_memory2_0.reset1 clockDomainSysInfo {-1}
	set_connection_parameter_value reset_in.out_reset/onchip_memory2_0.reset1 clockResetSysInfo {}
	set_connection_parameter_value reset_in.out_reset/onchip_memory2_0.reset1 resetDomainSysInfo {-1}

	# add the exports
	set_interface_property clk EXPORT_OF clock_in.in_clk
	set_interface_property reset EXPORT_OF reset_in.in_reset

	# set values for exposed HDL parameters
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.burstAdapterImplementation GENERIC_CONVERTER
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.clockCrossingAdapter HANDSHAKE
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.enableAllPipelines FALSE
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.enableEccProtection FALSE
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.enableInstrumentation FALSE
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.enableOutOfOrderSupport FALSE
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.insertDefaultSlave FALSE
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.interconnectResetSource DEFAULT
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.interconnectType STANDARD
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.maxAdditionalLatency 1
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.optimizeRdFifoSize FALSE
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.piplineType PIPELINE_STAGE
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.responseFifoType REGISTER_BASED
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.syncResets TRUE
	set_domain_assignment mm_master_bfm_0.m0 qsys_mm.widthAdapterImplementation GENERIC_CONVERTER

	# set the the module properties
	set_module_property BONUS_DATA {<?xml version="1.0" encoding="UTF-8"?>
<bonusData>
 <element __value="clock_in">
  <datum __value="_sortIndex" value="0" type="int" />
 </element>
 <element __value="mm_master_bfm_0">
  <datum __value="_sortIndex" value="2" type="int" />
 </element>
 <element __value="onchip_memory2_0">
  <datum __value="_sortIndex" value="3" type="int" />
 </element>
 <element __value="onchip_memory2_0.s1">
  <datum __value="baseAddress" value="0" type="String" />
 </element>
 <element __value="reset_in">
  <datum __value="_sortIndex" value="1" type="int" />
 </element>
</bonusData>
}
	set_module_property FILE {my_sys.qsys}
	set_module_property GENERATION_ID {0x00000000}
	set_module_property NAME {my_sys}

	# save the system
	sync_sysinfo_parameters
	save_system my_sys
}

proc do_set_exported_interface_sysinfo_parameters {} {
}

# create all the systems, from bottom up
do_create_my_sys

# set system info parameters on exported interface, from bottom up
do_set_exported_interface_sysinfo_parameters
