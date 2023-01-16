	component my_sys_pcie_pio_av_mm_0 is
		port (
			pcie_clk                    : in  std_logic                      := 'X';             -- clk
			pcie_rst                    : in  std_logic                      := 'X';             -- reset
			avalon_slave_address        : out std_logic_vector(63 downto 0);                     -- address
			avalon_slave_read           : out std_logic;                                         -- read
			avalon_slave_readdatavalid  : in  std_logic                      := 'X';             -- readdatavalid
			avalon_slave_write          : out std_logic;                                         -- write
			avalon_slave_writedata      : out std_logic_vector(511 downto 0);                    -- writedata
			avalon_slave_waitrequest    : in  std_logic                      := 'X';             -- waitrequest
			avalon_slave_byteenable     : out std_logic_vector(63 downto 0);                     -- byteenable
			avalon_slave_burstcount     : out std_logic_vector(3 downto 0);                      -- burstcount
			avalon_slave_readdata       : in  std_logic_vector(511 downto 0) := (others => 'X'); -- readdata
			reset_sink_reset            : out std_logic;                                         -- reset
			avalon_master_address       : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- address
			avalon_master_read          : in  std_logic                      := 'X';             -- read
			avalon_master_readdatavalid : out std_logic;                                         -- readdatavalid
			avalon_master_write         : in  std_logic                      := 'X';             -- write
			avalon_master_writedata     : in  std_logic_vector(511 downto 0) := (others => 'X'); -- writedata
			avalon_master_waitrequest   : out std_logic;                                         -- waitrequest
			avalon_master_byteenable    : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- byteenable
			avalon_master_burstcount    : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- burstcount
			avalon_master_readdata      : out std_logic_vector(511 downto 0)                     -- readdata
		);
	end component my_sys_pcie_pio_av_mm_0;

	u0 : component my_sys_pcie_pio_av_mm_0
		port map (
			pcie_clk                    => CONNECTED_TO_pcie_clk,                    --     clock_sink.clk
			pcie_rst                    => CONNECTED_TO_pcie_rst,                    --     reset_sink.reset
			avalon_slave_address        => CONNECTED_TO_avalon_slave_address,        --  avalon_master.address
			avalon_slave_read           => CONNECTED_TO_avalon_slave_read,           --               .read
			avalon_slave_readdatavalid  => CONNECTED_TO_avalon_slave_readdatavalid,  --               .readdatavalid
			avalon_slave_write          => CONNECTED_TO_avalon_slave_write,          --               .write
			avalon_slave_writedata      => CONNECTED_TO_avalon_slave_writedata,      --               .writedata
			avalon_slave_waitrequest    => CONNECTED_TO_avalon_slave_waitrequest,    --               .waitrequest
			avalon_slave_byteenable     => CONNECTED_TO_avalon_slave_byteenable,     --               .byteenable
			avalon_slave_burstcount     => CONNECTED_TO_avalon_slave_burstcount,     --               .burstcount
			avalon_slave_readdata       => CONNECTED_TO_avalon_slave_readdata,       --               .readdata
			reset_sink_reset            => CONNECTED_TO_reset_sink_reset,            --    reset_sink1.reset
			avalon_master_address       => CONNECTED_TO_avalon_master_address,       -- avalon_master1.address
			avalon_master_read          => CONNECTED_TO_avalon_master_read,          --               .read
			avalon_master_readdatavalid => CONNECTED_TO_avalon_master_readdatavalid, --               .readdatavalid
			avalon_master_write         => CONNECTED_TO_avalon_master_write,         --               .write
			avalon_master_writedata     => CONNECTED_TO_avalon_master_writedata,     --               .writedata
			avalon_master_waitrequest   => CONNECTED_TO_avalon_master_waitrequest,   --               .waitrequest
			avalon_master_byteenable    => CONNECTED_TO_avalon_master_byteenable,    --               .byteenable
			avalon_master_burstcount    => CONNECTED_TO_avalon_master_burstcount,    --               .burstcount
			avalon_master_readdata      => CONNECTED_TO_avalon_master_readdata       --               .readdata
		);

