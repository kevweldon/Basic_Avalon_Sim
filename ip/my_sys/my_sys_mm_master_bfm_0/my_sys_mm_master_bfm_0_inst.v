	my_sys_mm_master_bfm_0 #(
		.AV_ADDRESS_W               (INTEGER_VALUE_FOR_AV_ADDRESS_W),
		.AV_SYMBOL_W                (INTEGER_VALUE_FOR_AV_SYMBOL_W),
		.AV_NUMSYMBOLS              (INTEGER_VALUE_FOR_AV_NUMSYMBOLS),
		.AV_BURSTCOUNT_W            (INTEGER_VALUE_FOR_AV_BURSTCOUNT_W),
		.AV_READRESPONSE_W          (INTEGER_VALUE_FOR_AV_READRESPONSE_W),
		.AV_WRITERESPONSE_W         (INTEGER_VALUE_FOR_AV_WRITERESPONSE_W),
		.USE_READ                   (INTEGER_VALUE_FOR_USE_READ),
		.USE_WRITE                  (INTEGER_VALUE_FOR_USE_WRITE),
		.USE_ADDRESS                (INTEGER_VALUE_FOR_USE_ADDRESS),
		.USE_BYTE_ENABLE            (INTEGER_VALUE_FOR_USE_BYTE_ENABLE),
		.USE_BURSTCOUNT             (INTEGER_VALUE_FOR_USE_BURSTCOUNT),
		.USE_READ_DATA              (INTEGER_VALUE_FOR_USE_READ_DATA),
		.USE_READ_DATA_VALID        (INTEGER_VALUE_FOR_USE_READ_DATA_VALID),
		.USE_WRITE_DATA             (INTEGER_VALUE_FOR_USE_WRITE_DATA),
		.USE_BEGIN_TRANSFER         (INTEGER_VALUE_FOR_USE_BEGIN_TRANSFER),
		.USE_BEGIN_BURST_TRANSFER   (INTEGER_VALUE_FOR_USE_BEGIN_BURST_TRANSFER),
		.USE_WAIT_REQUEST           (INTEGER_VALUE_FOR_USE_WAIT_REQUEST),
		.USE_TRANSACTIONID          (INTEGER_VALUE_FOR_USE_TRANSACTIONID),
		.USE_WRITERESPONSE          (INTEGER_VALUE_FOR_USE_WRITERESPONSE),
		.USE_READRESPONSE           (INTEGER_VALUE_FOR_USE_READRESPONSE),
		.USE_CLKEN                  (INTEGER_VALUE_FOR_USE_CLKEN),
		.AV_CONSTANT_BURST_BEHAVIOR (INTEGER_VALUE_FOR_AV_CONSTANT_BURST_BEHAVIOR),
		.AV_BURST_LINEWRAP          (INTEGER_VALUE_FOR_AV_BURST_LINEWRAP),
		.AV_BURST_BNDR_ONLY         (INTEGER_VALUE_FOR_AV_BURST_BNDR_ONLY),
		.AV_MAX_PENDING_READS       (INTEGER_VALUE_FOR_AV_MAX_PENDING_READS),
		.AV_MAX_PENDING_WRITES      (INTEGER_VALUE_FOR_AV_MAX_PENDING_WRITES),
		.AV_FIX_READ_LATENCY        (INTEGER_VALUE_FOR_AV_FIX_READ_LATENCY),
		.AV_READ_WAIT_TIME          (INTEGER_VALUE_FOR_AV_READ_WAIT_TIME),
		.AV_WRITE_WAIT_TIME         (INTEGER_VALUE_FOR_AV_WRITE_WAIT_TIME),
		.AV_WAITREQUEST_ALLOWANCE   (INTEGER_VALUE_FOR_AV_WAITREQUEST_ALLOWANCE),
		.REGISTER_WAITREQUEST       (INTEGER_VALUE_FOR_REGISTER_WAITREQUEST),
		.AV_REGISTERINCOMINGSIGNALS (INTEGER_VALUE_FOR_AV_REGISTERINCOMINGSIGNALS),
		.VHDL_ID                    (INTEGER_VALUE_FOR_VHDL_ID)
	) u0 (
		.clk               (_connected_to_clk_),               //   input,   width = 1,       clk.clk
		.reset             (_connected_to_reset_),             //   input,   width = 1, clk_reset.reset
		.avm_address       (_connected_to_avm_address_),       //  output,  width = 32,        m0.address
		.avm_burstcount    (_connected_to_avm_burstcount_),    //  output,   width = 4,          .burstcount
		.avm_readdata      (_connected_to_avm_readdata_),      //   input,  width = 32,          .readdata
		.avm_writedata     (_connected_to_avm_writedata_),     //  output,  width = 32,          .writedata
		.avm_waitrequest   (_connected_to_avm_waitrequest_),   //   input,   width = 1,          .waitrequest
		.avm_write         (_connected_to_avm_write_),         //  output,   width = 1,          .write
		.avm_read          (_connected_to_avm_read_),          //  output,   width = 1,          .read
		.avm_byteenable    (_connected_to_avm_byteenable_),    //  output,   width = 4,          .byteenable
		.avm_readdatavalid (_connected_to_avm_readdatavalid_)  //   input,   width = 1,          .readdatavalid
	);

