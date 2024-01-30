// (C) 2001-2023 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/23.4/ip/iconnect/verification/lib/verbosity_pkg.sv#1 $
// $Revision: #1 $
// $Date: 2023/10/12 $
//-----------------------------------------------------------------------------
// =head1 NAME
// verbosity_pkg
// =head1 SYNOPSIS
// Package for controlling verbosity of messages sent to the console
//-----------------------------------------------------------------------------
// =head1 COPYRIGHT
// Copyright (c) 2008 Altera Corporation. All Rights Reserved.
// The information contained in this file is the property of Altera
// Corporation. Except as specifically authorized in writing by Altera 
// Corporation, the holder of this file shall keep all information 
// contained herein confidential and shall protect same in whole or in part 
// from disclosure and dissemination to all third parties. Use of this 
// program confirms your agreement with the terms of this license.
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This module will dump diagnostic messages to the console during
// simulation. The level of verbosity can be controlled in the test
// bench by using the *set_verbosity* method in the imported package
// verbosity_pkg. For a given setting, message at that level and all
// lower levels are dumped. For example, setting VERBOSITY_DEBUG level
// causes all messages to be dumped, while VERBOSITY_FAILURE restricts
// only failure messages and those tagged as VERBOSITY_NONE to be
// dumped.
// The different levels are:
// =over 4
// =item 1 VERBOSITY_NONE
// Messages tagged with this level are always dumped to the console.
// =item 2 VERBOSITY_FAILURE
// A fatal simulation error has occurred and the simulator will exit.
// =item 3 VERBOSITY_ERROR
// A non-fatal error has occured. An example is a data comparison mismatch.
// =item 4 VERBOSITY_WARNING
// Warn the user that a potential error has occurred.
// =item 5 VERBOSITY_INFO
// Informational message.
// =item 6 VERBOSITY_DEBUG
// Dump enough state to diagnose problem scenarios.
// =back


`ifndef _AVALON_VERBOSITY_PKG_
`define _AVALON_VERBOSITY_PKG_

package verbosity_pkg;

	timeunit 1ps;
	timeprecision 1ps;
   
   typedef enum int {VERBOSITY_NONE, 
		     VERBOSITY_FAILURE, 
		     VERBOSITY_ERROR, 
		     VERBOSITY_WARNING, 
		     VERBOSITY_INFO,
		     VERBOSITY_DEBUG} Verbosity_t;

   Verbosity_t  verbosity = VERBOSITY_INFO;
   string 	message = "";
   int 		dump_file;
   int 		dump = 0;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). In this case the application program is the test bench
   // or component which imports this package.
   // =cut
   //--------------------------------------------------------------------------

   function automatic Verbosity_t get_verbosity(); // public
      // Returns the global verbosity setting.
      return verbosity;
   endfunction

   function automatic void set_verbosity ( // public
      Verbosity_t v
   );
      // Sets the global verbosity setting.

      string       verbosity_str;               
      verbosity = v;

      case(verbosity)
	VERBOSITY_NONE: verbosity_str = "VERBOSITY_";	   
	VERBOSITY_FAILURE: verbosity_str = "VERBOSITY_FAILURE";
	VERBOSITY_ERROR: verbosity_str = "VERBOSITY_ERROR";
        VERBOSITY_WARNING: verbosity_str = "VERBOSITY_WARNING";
    	VERBOSITY_INFO: verbosity_str = "VERBOSITY_INFO";
    	VERBOSITY_DEBUG: verbosity_str = "VERBOSITY_DEBUG";	   
	default: verbosity_str = "UNKNOWN";
      endcase 
      $sformat(message, "%m: Setting Verbosity level=%0d (%s)",
               verbosity, verbosity_str);
      print(VERBOSITY_NONE, message);	 	       
   endfunction

   function automatic void print( // public
      Verbosity_t level, 
      string message
   );
      // Print a message to the console if the verbosity argument
      // is less than or equal to the global verbosity setting.
      string level_str;

      if (level <= verbosity) begin
	 case(level)
	   VERBOSITY_NONE: level_str = "";	   
	   VERBOSITY_FAILURE: level_str = "FAILURE:";
	   VERBOSITY_ERROR: level_str = "ERROR:";
           VERBOSITY_WARNING: level_str = "WARNING:";
    	   VERBOSITY_INFO: level_str = "INFO:";
    	   VERBOSITY_DEBUG: level_str = "DEBUG:";	   
	   default: level_str = "UNKNOWN:";
	 endcase 
	 
	 $display("%t: %s %s",$time, level_str, message);
	 if (dump) begin
	    $fdisplay(dump_file, "%t: %s %s",$time, level_str, message);
	 end
      end
   endfunction

   function automatic void print_divider( // public
      Verbosity_t level
   );
      // Prints a divider line to the console to make a block of related text
      // easier to identify and read.
      string message;
      $sformat(message, 
	       "------------------------------------------------------------");
      print(level, message);
   endfunction
   
   function automatic void open_dump_file ( // public
      string dump_file_name = "avalon_bfm_sim.log"
   );
      // Opens a dump file which collects console messages.
	
      if (dump) begin
	 $sformat(message, "%m: Dump file already open - ignoring open.");
	 print(VERBOSITY_ERROR, message);	 
      end else begin
	 dump_file = $fopen(dump_file_name, "w");
	 $fdisplay(dump_file, "testing dump file");
	 $sformat(message, "%m: Opening dump file: %s", dump_file_name);
	 print(VERBOSITY_INFO, message);
	 dump = 1;	 
      end
   endfunction
 
   function automatic void close_dump_file();  // public
      // Close the console message dump file.      
      if (!dump) begin
	 $sformat(message, "%m: No open dump file - ignoring close.");
	 print(VERBOSITY_ERROR, message);	 	 
      end else begin
	 dump = 0;
	 $fclose(dump_file);
	 $sformat(message, "%m: Closing dump file");
	 print(VERBOSITY_INFO, message);	 
      end	 
   endfunction

   function automatic void abort_simulation();
      string message;
      $sformat(message, "%m: Abort the simulation due to fatal error incident.");      
      print(VERBOSITY_FAILURE, message);
      $stop;
   endfunction
   
endpackage
   
// =cut

`endif   
   
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Oy3QR2mKNgmhEfGL3SW6HQfCmb79srhD44IOaAtUlH8/pTgcm9t2UrXActBjPTmN4Bv4NNlGdb4P/mc3rtoPRgAFqt2AVMJX3s0AQGiv7LFugS4Idf0kbtvb54pTXH+zn++Y2B/CghSRss/8348bn4PK6K78kVges9jyNixGVIibFRB8G5IWj5cfOPmgt+ydiX4ZjY+CtMVd406Jcd+oQRODgD4T+W1CBwJueCo1/aIdFnzcY+MdA8zHmWe6yJhA7Qhy4v1Z2fe28aKwII4KtFtqKRikwrQklwynA4O+cOSZRIIEcbhwx/wFtnCiR+WTsPKMReL/GgvCJU2paO1pl/veDMSQvoJIXii9uteIi3KHuX4U3yAK7uaCjkNNaykd9DBn+ZHikYHLyZbu7BnOO8tb3m4mQ1xekA7Nekl0sl8XXgSYLd5S/7Rpxn5mHoU0iOAh9J1623mR+sRi8ZZsQB49ZHu1xPss1NWqqxkGoFZzuqbWXLbVwoTyGorBk9m6VpS8LR905vDNCjymwYoUMQsrMNPGpJSgvPzr+HQ8eaxxeDZivS7Jw4PbqxbBLkHg2il3b/mdg8frp8LGo42hbCThf6B/qBJ8PcFw06Z0MPAm6do55MFaE22ZssEl9hvHwPsZx7LfJlZQbZq5ORkgZ4Gczl5cp2V/zzxX3DOYj5S8j3+2Plnb+EcIHzSZJr+UWvuaQrZbFBiDawxt5mkr71+LCCjw21nFv9GjSY4g3Ou/Bw2vBZCydiIfKfajyj30JnUKk7cWxXZq1iTniB00YI1lxDPhY6Axy9sJnsDETgizlWigIzi4bBs9JyHD4kahxyfGJ0qB8avvk5a8Sz5zdj0mXMGSUG6zGgkX3jrnqDp+4fScZE2E3Xj+7S3aNwYONc7YqRQIpky4UFfruiAAQvUpfQAyjSAvSPdFkr1mTgC+nRT5Y5htHP5z5+jV6yswFYGGbGmLJjUw7qF56Wnut2lQVcjBCC3qHnWJqWs1UvhUUKvGbRlNn26DMvTclz6O"
`endif