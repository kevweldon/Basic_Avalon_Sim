module my_sys_msgdma_0 (
		input  wire         clock_clk,                    //            clock.clk
		input  wire         reset_n_reset_n,              //          reset_n.reset_n
		input  wire [31:0]  csr_writedata,                //              csr.writedata
		input  wire         csr_write,                    //                 .write
		input  wire [3:0]   csr_byteenable,               //                 .byteenable
		output wire [31:0]  csr_readdata,                 //                 .readdata
		input  wire         csr_read,                     //                 .read
		input  wire [2:0]   csr_address,                  //                 .address
		input  wire         descriptor_slave_write,       // descriptor_slave.write
		output wire         descriptor_slave_waitrequest, //                 .waitrequest
		input  wire [255:0] descriptor_slave_writedata,   //                 .writedata
		input  wire [31:0]  descriptor_slave_byteenable,  //                 .byteenable
		output wire         csr_irq_irq,                  //          csr_irq.irq
		output wire [33:0]  mm_read_address,              //          mm_read.address
		output wire         mm_read_read,                 //                 .read
		output wire [63:0]  mm_read_byteenable,           //                 .byteenable
		input  wire [511:0] mm_read_readdata,             //                 .readdata
		input  wire         mm_read_waitrequest,          //                 .waitrequest
		input  wire         mm_read_readdatavalid,        //                 .readdatavalid
		output wire [10:0]  mm_read_burstcount,           //                 .burstcount
		output wire [511:0] st_source_data,               //        st_source.data
		output wire         st_source_valid,              //                 .valid
		input  wire         st_source_ready,              //                 .ready
		output wire         st_source_startofpacket,      //                 .startofpacket
		output wire         st_source_endofpacket,        //                 .endofpacket
		output wire [5:0]   st_source_empty,              //                 .empty
		output wire [1:0]   st_source_error               //                 .error
	);
endmodule

