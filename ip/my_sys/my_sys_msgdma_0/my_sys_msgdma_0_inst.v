	my_sys_msgdma_0 u0 (
		.clock_clk                    (_connected_to_clock_clk_),                    //   input,    width = 1,            clock.clk
		.reset_n_reset_n              (_connected_to_reset_n_reset_n_),              //   input,    width = 1,          reset_n.reset_n
		.csr_writedata                (_connected_to_csr_writedata_),                //   input,   width = 32,              csr.writedata
		.csr_write                    (_connected_to_csr_write_),                    //   input,    width = 1,                 .write
		.csr_byteenable               (_connected_to_csr_byteenable_),               //   input,    width = 4,                 .byteenable
		.csr_readdata                 (_connected_to_csr_readdata_),                 //  output,   width = 32,                 .readdata
		.csr_read                     (_connected_to_csr_read_),                     //   input,    width = 1,                 .read
		.csr_address                  (_connected_to_csr_address_),                  //   input,    width = 3,                 .address
		.descriptor_slave_write       (_connected_to_descriptor_slave_write_),       //   input,    width = 1, descriptor_slave.write
		.descriptor_slave_waitrequest (_connected_to_descriptor_slave_waitrequest_), //  output,    width = 1,                 .waitrequest
		.descriptor_slave_writedata   (_connected_to_descriptor_slave_writedata_),   //   input,  width = 256,                 .writedata
		.descriptor_slave_byteenable  (_connected_to_descriptor_slave_byteenable_),  //   input,   width = 32,                 .byteenable
		.csr_irq_irq                  (_connected_to_csr_irq_irq_),                  //  output,    width = 1,          csr_irq.irq
		.mm_read_address              (_connected_to_mm_read_address_),              //  output,   width = 34,          mm_read.address
		.mm_read_read                 (_connected_to_mm_read_read_),                 //  output,    width = 1,                 .read
		.mm_read_byteenable           (_connected_to_mm_read_byteenable_),           //  output,   width = 64,                 .byteenable
		.mm_read_readdata             (_connected_to_mm_read_readdata_),             //   input,  width = 512,                 .readdata
		.mm_read_waitrequest          (_connected_to_mm_read_waitrequest_),          //   input,    width = 1,                 .waitrequest
		.mm_read_readdatavalid        (_connected_to_mm_read_readdatavalid_),        //   input,    width = 1,                 .readdatavalid
		.mm_read_burstcount           (_connected_to_mm_read_burstcount_),           //  output,   width = 11,                 .burstcount
		.st_source_data               (_connected_to_st_source_data_),               //  output,  width = 512,        st_source.data
		.st_source_valid              (_connected_to_st_source_valid_),              //  output,    width = 1,                 .valid
		.st_source_ready              (_connected_to_st_source_ready_),              //   input,    width = 1,                 .ready
		.st_source_startofpacket      (_connected_to_st_source_startofpacket_),      //  output,    width = 1,                 .startofpacket
		.st_source_endofpacket        (_connected_to_st_source_endofpacket_),        //  output,    width = 1,                 .endofpacket
		.st_source_empty              (_connected_to_st_source_empty_),              //  output,    width = 6,                 .empty
		.st_source_error              (_connected_to_st_source_error_)               //  output,    width = 2,                 .error
	);

