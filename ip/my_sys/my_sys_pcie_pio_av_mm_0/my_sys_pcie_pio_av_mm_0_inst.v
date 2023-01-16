	my_sys_pcie_pio_av_mm_0 u0 (
		.pcie_clk                    (_connected_to_pcie_clk_),                    //   input,    width = 1,     clock_sink.clk
		.pcie_rst                    (_connected_to_pcie_rst_),                    //   input,    width = 1,     reset_sink.reset
		.avalon_slave_address        (_connected_to_avalon_slave_address_),        //  output,   width = 64,  avalon_master.address
		.avalon_slave_read           (_connected_to_avalon_slave_read_),           //  output,    width = 1,               .read
		.avalon_slave_readdatavalid  (_connected_to_avalon_slave_readdatavalid_),  //   input,    width = 1,               .readdatavalid
		.avalon_slave_write          (_connected_to_avalon_slave_write_),          //  output,    width = 1,               .write
		.avalon_slave_writedata      (_connected_to_avalon_slave_writedata_),      //  output,  width = 512,               .writedata
		.avalon_slave_waitrequest    (_connected_to_avalon_slave_waitrequest_),    //   input,    width = 1,               .waitrequest
		.avalon_slave_byteenable     (_connected_to_avalon_slave_byteenable_),     //  output,   width = 64,               .byteenable
		.avalon_slave_burstcount     (_connected_to_avalon_slave_burstcount_),     //  output,    width = 4,               .burstcount
		.avalon_slave_readdata       (_connected_to_avalon_slave_readdata_),       //   input,  width = 512,               .readdata
		.reset_sink_reset            (_connected_to_reset_sink_reset_),            //  output,    width = 1,    reset_sink1.reset
		.avalon_master_address       (_connected_to_avalon_master_address_),       //   input,   width = 64, avalon_master1.address
		.avalon_master_read          (_connected_to_avalon_master_read_),          //   input,    width = 1,               .read
		.avalon_master_readdatavalid (_connected_to_avalon_master_readdatavalid_), //  output,    width = 1,               .readdatavalid
		.avalon_master_write         (_connected_to_avalon_master_write_),         //   input,    width = 1,               .write
		.avalon_master_writedata     (_connected_to_avalon_master_writedata_),     //   input,  width = 512,               .writedata
		.avalon_master_waitrequest   (_connected_to_avalon_master_waitrequest_),   //  output,    width = 1,               .waitrequest
		.avalon_master_byteenable    (_connected_to_avalon_master_byteenable_),    //   input,   width = 64,               .byteenable
		.avalon_master_burstcount    (_connected_to_avalon_master_burstcount_),    //   input,    width = 4,               .burstcount
		.avalon_master_readdata      (_connected_to_avalon_master_readdata_)       //  output,  width = 512,               .readdata
	);

