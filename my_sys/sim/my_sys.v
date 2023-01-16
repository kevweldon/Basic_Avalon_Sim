// my_sys.v

// Generated using ACDS version 22.4 94

`timescale 1 ps / 1 ps
module my_sys (
		input  wire  clk_clk,     //   clk.clk
		input  wire  reset_reset  // reset.reset
	);

	wire         clock_in_out_clk_clk;                             // clock_in:out_clk -> [mm_interconnect_0:clock_in_out_clk_clk, mm_master_bfm_0:clk, onchip_memory2_0:clk, reset_in:clk, rst_controller:clk, rst_controller_001:clk]
	wire  [31:0] mm_master_bfm_0_m0_readdata;                      // mm_interconnect_0:mm_master_bfm_0_m0_readdata -> mm_master_bfm_0:avm_readdata
	wire         mm_master_bfm_0_m0_waitrequest;                   // mm_interconnect_0:mm_master_bfm_0_m0_waitrequest -> mm_master_bfm_0:avm_waitrequest
	wire  [31:0] mm_master_bfm_0_m0_address;                       // mm_master_bfm_0:avm_address -> mm_interconnect_0:mm_master_bfm_0_m0_address
	wire         mm_master_bfm_0_m0_read;                          // mm_master_bfm_0:avm_read -> mm_interconnect_0:mm_master_bfm_0_m0_read
	wire   [3:0] mm_master_bfm_0_m0_byteenable;                    // mm_master_bfm_0:avm_byteenable -> mm_interconnect_0:mm_master_bfm_0_m0_byteenable
	wire         mm_master_bfm_0_m0_readdatavalid;                 // mm_interconnect_0:mm_master_bfm_0_m0_readdatavalid -> mm_master_bfm_0:avm_readdatavalid
	wire  [31:0] mm_master_bfm_0_m0_writedata;                     // mm_master_bfm_0:avm_writedata -> mm_interconnect_0:mm_master_bfm_0_m0_writedata
	wire         mm_master_bfm_0_m0_write;                         // mm_master_bfm_0:avm_write -> mm_interconnect_0:mm_master_bfm_0_m0_write
	wire   [3:0] mm_master_bfm_0_m0_burstcount;                    // mm_master_bfm_0:avm_burstcount -> mm_interconnect_0:mm_master_bfm_0_m0_burstcount
	wire         mm_interconnect_0_onchip_memory2_0_s1_chipselect; // mm_interconnect_0:onchip_memory2_0_s1_chipselect -> onchip_memory2_0:chipselect
	wire  [15:0] mm_interconnect_0_onchip_memory2_0_s1_readdata;   // onchip_memory2_0:readdata -> mm_interconnect_0:onchip_memory2_0_s1_readdata
	wire   [9:0] mm_interconnect_0_onchip_memory2_0_s1_address;    // mm_interconnect_0:onchip_memory2_0_s1_address -> onchip_memory2_0:address
	wire   [1:0] mm_interconnect_0_onchip_memory2_0_s1_byteenable; // mm_interconnect_0:onchip_memory2_0_s1_byteenable -> onchip_memory2_0:byteenable
	wire         mm_interconnect_0_onchip_memory2_0_s1_write;      // mm_interconnect_0:onchip_memory2_0_s1_write -> onchip_memory2_0:write
	wire  [15:0] mm_interconnect_0_onchip_memory2_0_s1_writedata;  // mm_interconnect_0:onchip_memory2_0_s1_writedata -> onchip_memory2_0:writedata
	wire         mm_interconnect_0_onchip_memory2_0_s1_clken;      // mm_interconnect_0:onchip_memory2_0_s1_clken -> onchip_memory2_0:clken
	wire         rst_controller_reset_out_reset;                   // rst_controller:reset_out -> [mm_master_bfm_0:reset, onchip_memory2_0:reset]
	wire         rst_controller_reset_out_reset_req;               // rst_controller:reset_req -> onchip_memory2_0:reset_req
	wire         reset_in_out_reset_reset;                         // reset_in:out_reset -> [rst_controller:reset_in0, rst_controller_001:reset_in0]
	wire         rst_controller_001_reset_out_reset;               // rst_controller_001:reset_out -> [mm_interconnect_0:mm_master_bfm_0_clk_reset_reset_bridge_in_reset_reset, mm_interconnect_0:mm_master_bfm_0_m0_translator_reset_reset_bridge_in_reset_reset]

	my_sys_clock_in clock_in (
		.in_clk  (clk_clk),              //   input,  width = 1,  in_clk.clk
		.out_clk (clock_in_out_clk_clk)  //  output,  width = 1, out_clk.clk
	);

	my_sys_mm_master_bfm_0 mm_master_bfm_0 (
		.clk               (clock_in_out_clk_clk),             //   input,   width = 1,       clk.clk
		.reset             (rst_controller_reset_out_reset),   //   input,   width = 1, clk_reset.reset
		.avm_address       (mm_master_bfm_0_m0_address),       //  output,  width = 32,        m0.address
		.avm_burstcount    (mm_master_bfm_0_m0_burstcount),    //  output,   width = 4,          .burstcount
		.avm_readdata      (mm_master_bfm_0_m0_readdata),      //   input,  width = 32,          .readdata
		.avm_writedata     (mm_master_bfm_0_m0_writedata),     //  output,  width = 32,          .writedata
		.avm_waitrequest   (mm_master_bfm_0_m0_waitrequest),   //   input,   width = 1,          .waitrequest
		.avm_write         (mm_master_bfm_0_m0_write),         //  output,   width = 1,          .write
		.avm_read          (mm_master_bfm_0_m0_read),          //  output,   width = 1,          .read
		.avm_byteenable    (mm_master_bfm_0_m0_byteenable),    //  output,   width = 4,          .byteenable
		.avm_readdatavalid (mm_master_bfm_0_m0_readdatavalid)  //   input,   width = 1,          .readdatavalid
	);

	my_sys_onchip_memory2_0 onchip_memory2_0 (
		.clk        (clock_in_out_clk_clk),                             //   input,   width = 1,   clk1.clk
		.address    (mm_interconnect_0_onchip_memory2_0_s1_address),    //   input,  width = 10,     s1.address
		.clken      (mm_interconnect_0_onchip_memory2_0_s1_clken),      //   input,   width = 1,       .clken
		.chipselect (mm_interconnect_0_onchip_memory2_0_s1_chipselect), //   input,   width = 1,       .chipselect
		.write      (mm_interconnect_0_onchip_memory2_0_s1_write),      //   input,   width = 1,       .write
		.readdata   (mm_interconnect_0_onchip_memory2_0_s1_readdata),   //  output,  width = 16,       .readdata
		.writedata  (mm_interconnect_0_onchip_memory2_0_s1_writedata),  //   input,  width = 16,       .writedata
		.byteenable (mm_interconnect_0_onchip_memory2_0_s1_byteenable), //   input,   width = 2,       .byteenable
		.reset      (rst_controller_reset_out_reset),                   //   input,   width = 1, reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req)                //   input,   width = 1,       .reset_req
	);

	my_sys_reset_in reset_in (
		.clk       (clock_in_out_clk_clk),     //   input,  width = 1,       clk.clk
		.in_reset  (reset_reset),              //   input,  width = 1,  in_reset.reset
		.out_reset (reset_in_out_reset_reset)  //  output,  width = 1, out_reset.reset
	);

	my_sys_altera_mm_interconnect_1920_rzjmpkq mm_interconnect_0 (
		.mm_master_bfm_0_m0_address                                      (mm_master_bfm_0_m0_address),                       //   input,  width = 32,                                        mm_master_bfm_0_m0.address
		.mm_master_bfm_0_m0_waitrequest                                  (mm_master_bfm_0_m0_waitrequest),                   //  output,   width = 1,                                                          .waitrequest
		.mm_master_bfm_0_m0_burstcount                                   (mm_master_bfm_0_m0_burstcount),                    //   input,   width = 4,                                                          .burstcount
		.mm_master_bfm_0_m0_byteenable                                   (mm_master_bfm_0_m0_byteenable),                    //   input,   width = 4,                                                          .byteenable
		.mm_master_bfm_0_m0_read                                         (mm_master_bfm_0_m0_read),                          //   input,   width = 1,                                                          .read
		.mm_master_bfm_0_m0_readdata                                     (mm_master_bfm_0_m0_readdata),                      //  output,  width = 32,                                                          .readdata
		.mm_master_bfm_0_m0_readdatavalid                                (mm_master_bfm_0_m0_readdatavalid),                 //  output,   width = 1,                                                          .readdatavalid
		.mm_master_bfm_0_m0_write                                        (mm_master_bfm_0_m0_write),                         //   input,   width = 1,                                                          .write
		.mm_master_bfm_0_m0_writedata                                    (mm_master_bfm_0_m0_writedata),                     //   input,  width = 32,                                                          .writedata
		.onchip_memory2_0_s1_address                                     (mm_interconnect_0_onchip_memory2_0_s1_address),    //  output,  width = 10,                                       onchip_memory2_0_s1.address
		.onchip_memory2_0_s1_write                                       (mm_interconnect_0_onchip_memory2_0_s1_write),      //  output,   width = 1,                                                          .write
		.onchip_memory2_0_s1_readdata                                    (mm_interconnect_0_onchip_memory2_0_s1_readdata),   //   input,  width = 16,                                                          .readdata
		.onchip_memory2_0_s1_writedata                                   (mm_interconnect_0_onchip_memory2_0_s1_writedata),  //  output,  width = 16,                                                          .writedata
		.onchip_memory2_0_s1_byteenable                                  (mm_interconnect_0_onchip_memory2_0_s1_byteenable), //  output,   width = 2,                                                          .byteenable
		.onchip_memory2_0_s1_chipselect                                  (mm_interconnect_0_onchip_memory2_0_s1_chipselect), //  output,   width = 1,                                                          .chipselect
		.onchip_memory2_0_s1_clken                                       (mm_interconnect_0_onchip_memory2_0_s1_clken),      //  output,   width = 1,                                                          .clken
		.mm_master_bfm_0_clk_reset_reset_bridge_in_reset_reset           (rst_controller_001_reset_out_reset),               //   input,   width = 1,           mm_master_bfm_0_clk_reset_reset_bridge_in_reset.reset
		.mm_master_bfm_0_m0_translator_reset_reset_bridge_in_reset_reset (rst_controller_001_reset_out_reset),               //   input,   width = 1, mm_master_bfm_0_m0_translator_reset_reset_bridge_in_reset.reset
		.clock_in_out_clk_clk                                            (clock_in_out_clk_clk)                              //   input,   width = 1,                                          clock_in_out_clk.clk
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (reset_in_out_reset_reset),           //   input,  width = 1, reset_in0.reset
		.clk            (clock_in_out_clk_clk),               //   input,  width = 1,       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     //  output,  width = 1, reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //  output,  width = 1,          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated),                       
		.reset_in1      (1'b0),                               // (terminated),                       
		.reset_req_in1  (1'b0),                               // (terminated),                       
		.reset_in2      (1'b0),                               // (terminated),                       
		.reset_req_in2  (1'b0),                               // (terminated),                       
		.reset_in3      (1'b0),                               // (terminated),                       
		.reset_req_in3  (1'b0),                               // (terminated),                       
		.reset_in4      (1'b0),                               // (terminated),                       
		.reset_req_in4  (1'b0),                               // (terminated),                       
		.reset_in5      (1'b0),                               // (terminated),                       
		.reset_req_in5  (1'b0),                               // (terminated),                       
		.reset_in6      (1'b0),                               // (terminated),                       
		.reset_req_in6  (1'b0),                               // (terminated),                       
		.reset_in7      (1'b0),                               // (terminated),                       
		.reset_req_in7  (1'b0),                               // (terminated),                       
		.reset_in8      (1'b0),                               // (terminated),                       
		.reset_req_in8  (1'b0),                               // (terminated),                       
		.reset_in9      (1'b0),                               // (terminated),                       
		.reset_req_in9  (1'b0),                               // (terminated),                       
		.reset_in10     (1'b0),                               // (terminated),                       
		.reset_req_in10 (1'b0),                               // (terminated),                       
		.reset_in11     (1'b0),                               // (terminated),                       
		.reset_req_in11 (1'b0),                               // (terminated),                       
		.reset_in12     (1'b0),                               // (terminated),                       
		.reset_req_in12 (1'b0),                               // (terminated),                       
		.reset_in13     (1'b0),                               // (terminated),                       
		.reset_req_in13 (1'b0),                               // (terminated),                       
		.reset_in14     (1'b0),                               // (terminated),                       
		.reset_req_in14 (1'b0),                               // (terminated),                       
		.reset_in15     (1'b0),                               // (terminated),                       
		.reset_req_in15 (1'b0)                                // (terminated),                       
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("both"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (reset_in_out_reset_reset),           //   input,  width = 1, reset_in0.reset
		.clk            (clock_in_out_clk_clk),               //   input,  width = 1,       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), //  output,  width = 1, reset_out.reset
		.reset_req      (),                                   // (terminated),                       
		.reset_req_in0  (1'b0),                               // (terminated),                       
		.reset_in1      (1'b0),                               // (terminated),                       
		.reset_req_in1  (1'b0),                               // (terminated),                       
		.reset_in2      (1'b0),                               // (terminated),                       
		.reset_req_in2  (1'b0),                               // (terminated),                       
		.reset_in3      (1'b0),                               // (terminated),                       
		.reset_req_in3  (1'b0),                               // (terminated),                       
		.reset_in4      (1'b0),                               // (terminated),                       
		.reset_req_in4  (1'b0),                               // (terminated),                       
		.reset_in5      (1'b0),                               // (terminated),                       
		.reset_req_in5  (1'b0),                               // (terminated),                       
		.reset_in6      (1'b0),                               // (terminated),                       
		.reset_req_in6  (1'b0),                               // (terminated),                       
		.reset_in7      (1'b0),                               // (terminated),                       
		.reset_req_in7  (1'b0),                               // (terminated),                       
		.reset_in8      (1'b0),                               // (terminated),                       
		.reset_req_in8  (1'b0),                               // (terminated),                       
		.reset_in9      (1'b0),                               // (terminated),                       
		.reset_req_in9  (1'b0),                               // (terminated),                       
		.reset_in10     (1'b0),                               // (terminated),                       
		.reset_req_in10 (1'b0),                               // (terminated),                       
		.reset_in11     (1'b0),                               // (terminated),                       
		.reset_req_in11 (1'b0),                               // (terminated),                       
		.reset_in12     (1'b0),                               // (terminated),                       
		.reset_req_in12 (1'b0),                               // (terminated),                       
		.reset_in13     (1'b0),                               // (terminated),                       
		.reset_req_in13 (1'b0),                               // (terminated),                       
		.reset_in14     (1'b0),                               // (terminated),                       
		.reset_req_in14 (1'b0),                               // (terminated),                       
		.reset_in15     (1'b0),                               // (terminated),                       
		.reset_req_in15 (1'b0)                                // (terminated),                       
	);

endmodule
