`define AMM_BFM top_tb.dut.mm_master_bfm_0.mm_master_bfm_0

module top_tb;
   
   localparam ADDR_WIDTH = 32;
   localparam DATA_WIDTH = 16;

   import verbosity_pkg::*;
   import avalon_mm_pkg::*;

   timeunit 1ns;
   timeprecision 10ps;

   // my_sys
   logic         clk_clk;
   logic         reset_reset;

   // Test Bench Signals
   logic [ADDR_WIDTH-1:0] address;
   logic [DATA_WIDTH-1:0] read_data [256];
   int 			  i, j;
   logic [DATA_WIDTH-1:0] write_data [256];
   logic [7:0] 		  byte_data;
   logic [31:0] 	  burst_length;
   
   always #5 force clk_clk = !clk_clk;

   initial
     begin
	$timeformat(-9, 2, "ns", 1);
	clk_clk = 0;

	// Configure Avalon BFM
	`AMM_BFM.set_response_timeout(500);
        `AMM_BFM.set_command_timeout(500);
	`AMM_BFM.init();

	reset_reset = 1;
	repeat (5) @(posedge clk_clk);
	reset_reset = 0;
	repeat (20) @(posedge clk_clk);

	///////////////////////
	// Sequential Access //
	///////////////////////
	// Write repeating 8'h01 to address 0.
	address = 0;
	byte_data = 8'h01;
	master_write(address * (DATA_WIDTH/8), {(DATA_WIDTH/8){byte_data}}, {32{1'b1}});
	
	// Write repeating 8'h02 to next word address
	master_write(64'd1 * (DATA_WIDTH/8), {(DATA_WIDTH/8){8'h02}}, {64{1'b1}});

	// Read data from address 0.
	address = 0;
	byte_data = 8'h01;
	master_read(address * (DATA_WIDTH/8),1, read_data);
	if (read_data[0] != {(DATA_WIDTH/8){byte_data}})
          $display ( "%m: %t: Error: Expected data 0x%h at address 0x%h, but got 0x%h", 
		     $time,  {(DATA_WIDTH/8){byte_data}}, address * (DATA_WIDTH/8), read_data[0]);

	// Read data from address 1.
	address = 1;
	byte_data = 8'h02;
	master_read(address * (DATA_WIDTH/8),1, read_data);
	if (read_data[0] != {(DATA_WIDTH/8){byte_data}})
          $display ( "%m: %t: Error: Expected data 0x%h at address 0x%h, but got 0x%h", 
		     $time,  {(DATA_WIDTH/8){byte_data}}, address * (DATA_WIDTH/8), read_data[0]);

	//////////////////
	// Burst Access //
	//////////////////
	// Write data burst length of 8 to start address 0.
	address = 0;
	burst_length = 8;
	for (logic[DATA_WIDTH-1:0] i=0; i<burst_length; i++)
	  begin
	     write_data[i] = i;
	  end
	master_write_burst(address * (DATA_WIDTH/8), write_data, {32{1'b1}}, burst_length);

	// Read data burst of length 8 from address 0.
	address = 0;
	burst_length = 8;
	master_read(address * (DATA_WIDTH/8), burst_length, read_data);
	for (int i=0; i<burst_length; i++)
	  begin
	     address = i;
	     if (read_data[i] != i)
	       $display ( "%m: %t: Error: Expected data 0x%h at word address 0x%h, recieved 0x%h", 
			  $time, i, address, read_data[i]);
	  end

	repeat (10) @(posedge clk_clk);
	stop_sim();
     end // initial begin

   task stop_sim;
     begin
	$display("%m: %t: Simulation finished.", $time);
	$finish;
     end
   endtask

   my_sys dut (.*);

   task master_write_burst;
      input [ADDR_WIDTH-1:0] address;
      input [DATA_WIDTH-1:0]  data [256];
      input [(DATA_WIDTH/8)-1:0] byteenable;
      input [7:0]  burst_size;
      begin
	 logic [ADDR_WIDTH-1:0] write_address;
	 for (int i = 0; i<burst_size ; i++)
	   begin
	      `AMM_BFM.set_command_data(data[i], i);
	     `AMM_BFM.set_command_byte_enable(byteenable, i);
	      `AMM_BFM.set_command_idle(0,i);
	   end
	 `AMM_BFM.set_command_address(address);
	 `AMM_BFM.set_command_burst_count(burst_size);
	 `AMM_BFM.set_command_burst_size(burst_size);
	 `AMM_BFM.set_command_init_latency(0);
	 `AMM_BFM.set_command_request(REQ_WRITE);
	 `AMM_BFM.push_command();
	 @(`AMM_BFM.signal_response_complete);	 
	 `AMM_BFM.pop_response();
	 //$display("top_tb: [%t] Response Request: %s", $time,`AMM_BFM.get_response_request());
	 for (int i=0; i<burst_size; i++)
	   begin
	      write_address = i * (DATA_WIDTH/8) + address;
	      $display("%m: %t: Wrote Data %h to address %h", $time, `AMM_BFM.get_response_data(i),write_address);
	   end
      end
   endtask
   
   task master_write;
      input [ADDR_WIDTH-1:0] address;
      input [DATA_WIDTH-1:0] data;
      input [(DATA_WIDTH/8)-1:0] byteenable;
      begin
	 `AMM_BFM.set_command_data(data, 0);
	 `AMM_BFM.set_command_byte_enable(byteenable, 0);
	 `AMM_BFM.set_command_idle(0, 0);
	 `AMM_BFM.set_command_address(address);
	 `AMM_BFM.set_command_burst_count('h1);
	 `AMM_BFM.set_command_burst_size('h1);
	 `AMM_BFM.set_command_init_latency(0);
	 `AMM_BFM.set_command_request(REQ_WRITE);
	 `AMM_BFM.push_command();
	 @(`AMM_BFM.signal_response_complete);	 
	 `AMM_BFM.pop_response();
	 $display("%m: %t: Wrote Data %h to address %h, byteenable=%h", 
		  $time, `AMM_BFM.get_response_data(0),`AMM_BFM.get_response_address(), 
		  `AMM_BFM.get_response_byte_enable(0));
      end
   endtask // master_write

   task master_read;
      input [ADDR_WIDTH-1:0] address;
      input [7:0] burst_size;
      output [DATA_WIDTH-1:0] data_out [256];
      begin
	 logic [ADDR_WIDTH-1:0] read_address;
	 `AMM_BFM.set_command_address(address);
	 `AMM_BFM.set_command_byte_enable({64{1'b1}}, 0);
	 `AMM_BFM.set_command_burst_count(burst_size);
	 `AMM_BFM.set_command_burst_size(burst_size);
	 `AMM_BFM.set_command_data('h0, 0);
	 `AMM_BFM.set_command_idle(0, 0);
	 `AMM_BFM.set_command_init_latency(0);
	 `AMM_BFM.set_command_request(REQ_READ);
	 `AMM_BFM.push_command();
	 @(`AMM_BFM.signal_response_complete);	 
	 `AMM_BFM.pop_response();
	 for (int i=0; i<burst_size; i++)
	   begin
	      read_address = i * (DATA_WIDTH/8) + address;
	      data_out[i] = `AMM_BFM.get_response_data(i);
	      $display("%m: %t: Read Data %h from address %h", $time, data_out[i], read_address);
	   end
      end
   endtask // master_read

endmodule: top_tb
