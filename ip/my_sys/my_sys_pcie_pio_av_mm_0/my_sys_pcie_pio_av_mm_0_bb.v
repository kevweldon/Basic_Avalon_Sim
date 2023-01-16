module my_sys_pcie_pio_av_mm_0 (
		input  wire         pcie_clk,                    //     clock_sink.clk
		input  wire         pcie_rst,                    //     reset_sink.reset
		output wire [63:0]  avalon_slave_address,        //  avalon_master.address
		output wire         avalon_slave_read,           //               .read
		input  wire         avalon_slave_readdatavalid,  //               .readdatavalid
		output wire         avalon_slave_write,          //               .write
		output wire [511:0] avalon_slave_writedata,      //               .writedata
		input  wire         avalon_slave_waitrequest,    //               .waitrequest
		output wire [63:0]  avalon_slave_byteenable,     //               .byteenable
		output wire [3:0]   avalon_slave_burstcount,     //               .burstcount
		input  wire [511:0] avalon_slave_readdata,       //               .readdata
		output wire         reset_sink_reset,            //    reset_sink1.reset
		input  wire [63:0]  avalon_master_address,       // avalon_master1.address
		input  wire         avalon_master_read,          //               .read
		output wire         avalon_master_readdatavalid, //               .readdatavalid
		input  wire         avalon_master_write,         //               .write
		input  wire [511:0] avalon_master_writedata,     //               .writedata
		output wire         avalon_master_waitrequest,   //               .waitrequest
		input  wire [63:0]  avalon_master_byteenable,    //               .byteenable
		input  wire [3:0]   avalon_master_burstcount,    //               .burstcount
		output wire [511:0] avalon_master_readdata       //               .readdata
	);
endmodule

