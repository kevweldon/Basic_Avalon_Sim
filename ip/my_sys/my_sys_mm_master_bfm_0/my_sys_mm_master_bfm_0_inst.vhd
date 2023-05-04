	component my_sys_mm_master_bfm_0 is
		generic (
			AV_ADDRESS_W               : integer := 32;
			AV_SYMBOL_W                : integer := 8;
			AV_NUMSYMBOLS              : integer := 4;
			AV_BURSTCOUNT_W            : integer := 8;
			AV_READRESPONSE_W          : integer := 8;
			AV_WRITERESPONSE_W         : integer := 8;
			USE_READ                   : integer := 1;
			USE_WRITE                  : integer := 1;
			USE_ADDRESS                : integer := 1;
			USE_BYTE_ENABLE            : integer := 1;
			USE_BURSTCOUNT             : integer := 1;
			USE_READ_DATA              : integer := 1;
			USE_READ_DATA_VALID        : integer := 1;
			USE_WRITE_DATA             : integer := 1;
			USE_BEGIN_TRANSFER         : integer := 0;
			USE_BEGIN_BURST_TRANSFER   : integer := 0;
			USE_WAIT_REQUEST           : integer := 1;
			USE_TRANSACTIONID          : integer := 0;
			USE_WRITERESPONSE          : integer := 0;
			USE_READRESPONSE           : integer := 0;
			USE_CLKEN                  : integer := 0;
			AV_CONSTANT_BURST_BEHAVIOR : integer := 1;
			AV_BURST_LINEWRAP          : integer := 1;
			AV_BURST_BNDR_ONLY         : integer := 1;
			AV_MAX_PENDING_READS       : integer := 0;
			AV_MAX_PENDING_WRITES      : integer := 0;
			AV_FIX_READ_LATENCY        : integer := 2;
			AV_READ_WAIT_TIME          : integer := 0;
			AV_WRITE_WAIT_TIME         : integer := 0;
			AV_WAITREQUEST_ALLOWANCE   : integer := 0;
			REGISTER_WAITREQUEST       : integer := 0;
			AV_REGISTERINCOMINGSIGNALS : integer := 0;
			VHDL_ID                    : integer := 0
		);
		port (
			clk               : in  std_logic                     := 'X';             -- clk
			reset             : in  std_logic                     := 'X';             -- reset
			avm_address       : out std_logic_vector(31 downto 0);                    -- address
			avm_burstcount    : out std_logic_vector(7 downto 0);                     -- burstcount
			avm_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			avm_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			avm_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			avm_write         : out std_logic;                                        -- write
			avm_read          : out std_logic;                                        -- read
			avm_byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			avm_readdatavalid : in  std_logic                     := 'X'              -- readdatavalid
		);
	end component my_sys_mm_master_bfm_0;

	u0 : component my_sys_mm_master_bfm_0
		generic map (
			AV_ADDRESS_W               => INTEGER_VALUE_FOR_AV_ADDRESS_W,
			AV_SYMBOL_W                => INTEGER_VALUE_FOR_AV_SYMBOL_W,
			AV_NUMSYMBOLS              => INTEGER_VALUE_FOR_AV_NUMSYMBOLS,
			AV_BURSTCOUNT_W            => INTEGER_VALUE_FOR_AV_BURSTCOUNT_W,
			AV_READRESPONSE_W          => INTEGER_VALUE_FOR_AV_READRESPONSE_W,
			AV_WRITERESPONSE_W         => INTEGER_VALUE_FOR_AV_WRITERESPONSE_W,
			USE_READ                   => INTEGER_VALUE_FOR_USE_READ,
			USE_WRITE                  => INTEGER_VALUE_FOR_USE_WRITE,
			USE_ADDRESS                => INTEGER_VALUE_FOR_USE_ADDRESS,
			USE_BYTE_ENABLE            => INTEGER_VALUE_FOR_USE_BYTE_ENABLE,
			USE_BURSTCOUNT             => INTEGER_VALUE_FOR_USE_BURSTCOUNT,
			USE_READ_DATA              => INTEGER_VALUE_FOR_USE_READ_DATA,
			USE_READ_DATA_VALID        => INTEGER_VALUE_FOR_USE_READ_DATA_VALID,
			USE_WRITE_DATA             => INTEGER_VALUE_FOR_USE_WRITE_DATA,
			USE_BEGIN_TRANSFER         => INTEGER_VALUE_FOR_USE_BEGIN_TRANSFER,
			USE_BEGIN_BURST_TRANSFER   => INTEGER_VALUE_FOR_USE_BEGIN_BURST_TRANSFER,
			USE_WAIT_REQUEST           => INTEGER_VALUE_FOR_USE_WAIT_REQUEST,
			USE_TRANSACTIONID          => INTEGER_VALUE_FOR_USE_TRANSACTIONID,
			USE_WRITERESPONSE          => INTEGER_VALUE_FOR_USE_WRITERESPONSE,
			USE_READRESPONSE           => INTEGER_VALUE_FOR_USE_READRESPONSE,
			USE_CLKEN                  => INTEGER_VALUE_FOR_USE_CLKEN,
			AV_CONSTANT_BURST_BEHAVIOR => INTEGER_VALUE_FOR_AV_CONSTANT_BURST_BEHAVIOR,
			AV_BURST_LINEWRAP          => INTEGER_VALUE_FOR_AV_BURST_LINEWRAP,
			AV_BURST_BNDR_ONLY         => INTEGER_VALUE_FOR_AV_BURST_BNDR_ONLY,
			AV_MAX_PENDING_READS       => INTEGER_VALUE_FOR_AV_MAX_PENDING_READS,
			AV_MAX_PENDING_WRITES      => INTEGER_VALUE_FOR_AV_MAX_PENDING_WRITES,
			AV_FIX_READ_LATENCY        => INTEGER_VALUE_FOR_AV_FIX_READ_LATENCY,
			AV_READ_WAIT_TIME          => INTEGER_VALUE_FOR_AV_READ_WAIT_TIME,
			AV_WRITE_WAIT_TIME         => INTEGER_VALUE_FOR_AV_WRITE_WAIT_TIME,
			AV_WAITREQUEST_ALLOWANCE   => INTEGER_VALUE_FOR_AV_WAITREQUEST_ALLOWANCE,
			REGISTER_WAITREQUEST       => INTEGER_VALUE_FOR_REGISTER_WAITREQUEST,
			AV_REGISTERINCOMINGSIGNALS => INTEGER_VALUE_FOR_AV_REGISTERINCOMINGSIGNALS,
			VHDL_ID                    => INTEGER_VALUE_FOR_VHDL_ID
		)
		port map (
			clk               => CONNECTED_TO_clk,               --       clk.clk
			reset             => CONNECTED_TO_reset,             -- clk_reset.reset
			avm_address       => CONNECTED_TO_avm_address,       --        m0.address
			avm_burstcount    => CONNECTED_TO_avm_burstcount,    --          .burstcount
			avm_readdata      => CONNECTED_TO_avm_readdata,      --          .readdata
			avm_writedata     => CONNECTED_TO_avm_writedata,     --          .writedata
			avm_waitrequest   => CONNECTED_TO_avm_waitrequest,   --          .waitrequest
			avm_write         => CONNECTED_TO_avm_write,         --          .write
			avm_read          => CONNECTED_TO_avm_read,          --          .read
			avm_byteenable    => CONNECTED_TO_avm_byteenable,    --          .byteenable
			avm_readdatavalid => CONNECTED_TO_avm_readdatavalid  --          .readdatavalid
		);

