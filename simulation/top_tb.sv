//Kevin Weldon - 05/2023
`define AMM_BFM top_tb.dut.mm_master_bfm_0.mm_master_bfm_0

module top_tb;
   
   localparam ADDR_WIDTH = 32;
   localparam DATA_WIDTH = 32;
   localparam NUMBER_OF_WRITES = 16;

   import verbosity_pkg::*;
   import avalon_mm_pkg::*;

   timeunit 1ns;
   timeprecision 10ps;

   logic         clk_clk;
   logic         reset_reset;
   logic [ADDR_WIDTH-1:0] address;
   logic [DATA_WIDTH-1:0] read_data [256];
   int 			  i, j;
   logic [DATA_WIDTH-1:0] write_data [256];
   logic [7:0] 		  byte_data;
   
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
	for (int i=0; i<NUMBER_OF_WRITES; i++)
	  begin
	     address = i;
	     byte_data = i;
	     write_data[i] = {(DATA_WIDTH/8){byte_data}};
	     master_write(address * (DATA_WIDTH/8), write_data[i], {32{1'b1}});
	     $display("%m: %t: Wrote data %h to address %h",
		      $time, write_data[i], address * (DATA_WIDTH/8));
	  end

	// Sequential reads
	for (i=0; i<NUMBER_OF_WRITES; i++)
	  begin
	     address = i;
	     byte_data = i;
	     master_read_push(address * (DATA_WIDTH/8));
	  end
	// Sequential reads
	for (i=0; i<NUMBER_OF_WRITES; i++)
	  begin
	     address = i;
	     master_read_pop(address * (DATA_WIDTH/8), read_data[0]);
	     if (read_data[0] !== write_data[i])
	       begin
		  $display("%m: %t: ERORR: Expected data %h from read address %h, recieved %h", 
			   $time, write_data[i], (address * (DATA_WIDTH/8)), read_data[0]);
		  stop_sim();
	       end
	     else
	       begin
		  $display("%m: %t: Read data %h from address %h", 
			   $time, read_data[0], (address * (DATA_WIDTH/8)));
	       end
	  end // for (i=0; i<NUMBER_OF_WRITES; i++)

	// Write incremental burst data
	address = 0;
	for (int i=0; i<NUMBER_OF_WRITES; i++)
	  begin
	     write_data[i] = i;
	  end
	master_write_burst(address * (DATA_WIDTH/8), write_data, {32{1'b1}}, NUMBER_OF_WRITES);
	for (int i=0; i<NUMBER_OF_WRITES; i++)
	  begin
	     $display("%m: %t: Wrote burst data %h to address %h",
		      $time, write_data[i], i * (DATA_WIDTH/8));
	  end

	// Burst read
	master_read_burst(address * (DATA_WIDTH/8), NUMBER_OF_WRITES, read_data);
	for (i=0; i<NUMBER_OF_WRITES; i++)
	  begin
	     if (read_data[i] !== write_data[i])
	       begin
		  $display("%m: %t: ERORR: Expected data %h from read address %h, recieved %h", 
			   $time, write_data[i], (address * (DATA_WIDTH/8)), read_data[i]);
		  stop_sim();
	       end
	     else
	       begin
		  $display("%m: %t: Read burst data %h from address %h", 
			   $time, read_data[i], (address * (DATA_WIDTH/8)));
	       end
	  end // for (i=0; i<NUMBER_OF_WRITES; i++)
	


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
/* -----\/----- EXCLUDED -----\/-----
	 $display("%m: %t: Wrote Data %h to address %h, byteenable=%h", 
		  $time, `AMM_BFM.get_response_data(0),`AMM_BFM.get_response_address(), 
		  `AMM_BFM.get_response_byte_enable(0));
 -----/\----- EXCLUDED -----/\----- */
      end
   endtask // master_write

   task master_write_burst;
      input [ADDR_WIDTH-1:0] address;
      input [DATA_WIDTH-1:0] data [256];
      input [31:0]  byteenable;
      input [31:0]  burst_size;
      begin
	for (int i = 0; i<burst_size ; i++)
	  begin
	     //$display("write_data %d = %h",i,write_data[i]);
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
/* -----\/----- EXCLUDED -----\/-----
	 for (int i=0; i<burst_size; i++)
	   begin
	      $display("%m: %t: Wrote Data %h to address %h", $time, `AMM_BFM.get_response_data(i),`AMM_BFM.get_response_address());
	   end
 -----/\----- EXCLUDED -----/\----- */
      end
   endtask

   task master_read_push;
      input [ADDR_WIDTH-1:0] address;
      begin
	 `AMM_BFM.set_command_address(address);
	 `AMM_BFM.set_command_byte_enable({64{1'b1}}, 0);
	 `AMM_BFM.set_command_burst_count(1);
	 `AMM_BFM.set_command_burst_size(1);
	 `AMM_BFM.set_command_data('h0, 0);
	 `AMM_BFM.set_command_idle(0, 0);
	 `AMM_BFM.set_command_init_latency(0);
	 `AMM_BFM.set_command_request(REQ_READ);
	 `AMM_BFM.push_command();
      end
   endtask // master_read_push

   task master_read_pop;
      input [ADDR_WIDTH-1:0] address;
      output [DATA_WIDTH-1:0] data_out;
      begin
	 @(`AMM_BFM.signal_response_complete);	 
	 `AMM_BFM.pop_response();
	 data_out = `AMM_BFM.get_response_data(0);
/* -----\/----- EXCLUDED -----\/-----
	 $display("%m: %t: Read Data %h from address %h", 
		  $time, data_out[i],`AMM_BFM.get_response_address());
 -----/\----- EXCLUDED -----/\----- */
      end
   endtask // master_read_pop

   task master_read_burst;
      input [ADDR_WIDTH-1:0] address;
      input [7:0] burst_size;
      output [DATA_WIDTH-1:0] data_out [256];
      begin
	 `AMM_BFM.set_command_address(address);
	 `AMM_BFM.set_command_byte_enable({64{1'b1}}, 0);
	 `AMM_BFM.set_command_burst_count(burst_size);
	 `AMM_BFM.set_command_burst_size(burst_size);
	 `AMM_BFM.set_command_data('h0, 0);
	 `AMM_BFM.set_command_idle(0, 0);
	 `AMM_BFM.set_command_init_latency(0);
	 `AMM_BFM.set_command_request(REQ_READ);
	 `AMM_BFM.push_command();
	 wait(`AMM_BFM.signal_response_complete);	 
	 `AMM_BFM.pop_response();
	 for (int i=0; i<burst_size; i++)
	   begin
	      data_out[i] = `AMM_BFM.get_response_data(i);
/* -----\/----- EXCLUDED -----\/-----
	      $display("%m: %t: Read Data %h from address %h", $time, 
		       `AMM_BFM.get_response_data(i),`AMM_BFM.get_response_address());
 -----/\----- EXCLUDED -----/\----- */
	   end
      end
   endtask // master_read_burst

endmodule: top_tb
