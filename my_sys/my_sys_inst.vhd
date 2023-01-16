	component my_sys is
		port (
			clk_clk     : in std_logic := 'X'; -- clk
			reset_reset : in std_logic := 'X'  -- reset
		);
	end component my_sys;

	u0 : component my_sys
		port map (
			clk_clk     => CONNECTED_TO_clk_clk,     --   clk.clk
			reset_reset => CONNECTED_TO_reset_reset  -- reset.reset
		);

