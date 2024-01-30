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


// $Id: //acds/rel/23.4/ip/iconnect/verification/lib/avalon_mm_pkg.sv#1 $
// $Revision: #1 $
// $Date: 2023/10/12 $
//-----------------------------------------------------------------------------
// =head1 NAME
// avalon_mm_pkg
// =head1 SYNOPSIS
// Package for shared Avalon MM component types.
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
// This package contains shared non-parameterized type definitions.
// =cut
`timescale 1ns / 1ns

`ifndef _AVALON_MM_PKG_
`define _AVALON_MM_PKG_

package avalon_mm_pkg;
   import verbosity_pkg::*;
   
   // Transaction request types
   typedef enum int {      // public 
      REQ_READ    = 0,     // Read Request
      REQ_WRITE   = 1,     // Write Request
      REQ_IDLE    = 2      // Idle
   } Request_t;

   // Slave BFM wait state logic operates in one of three distinct modes
   typedef enum int {          
		     WAIT_FIXED = 0,  // default: fixed wait cycles per burst cycle
                     WAIT_RANDOM = 1, // random  min =< wait cycles <= max
		     WAIT_ADDRESSABLE = 2 // fixed wait cycles per command address
                     } SlaveWaitMode_t;

   // Avalon MM transaction response status
   typedef enum logic[1:0] {
      AV_OKAY           = 0,
      AV_RESERVED       = 1,
      AV_SLAVE_ERROR    = 2,
      AV_DECODE_ERROR   = 3
   } AvalonResponseStatus_t;
   
   function automatic string request_string(Request_t request);
      case(request) 
     	REQ_READ: return("read");
     	REQ_WRITE: return("write");
     	REQ_IDLE: return("idle");
     	default: return("INVALID_REQUEST");
      endcase 
   endfunction

endpackage

`endif
   
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Oy3QR2mKNgmhEfGL3SW6HQfCmb79srhD44IOaAtUlH8/pTgcm9t2UrXActBjPTmN4Bv4NNlGdb4P/mc3rtoPRgAFqt2AVMJX3s0AQGiv7LFugS4Idf0kbtvb54pTXH+zn++Y2B/CghSRss/8348bn4PK6K78kVges9jyNixGVIibFRB8G5IWj5cfOPmgt+ydiX4ZjY+CtMVd406Jcd+oQRODgD4T+W1CBwJueCo1/aJ/HunGi8xdTSrrU/8/X0HNeaRqGjYESSgkomLCrg/LKx3qfDPI77x+V2b/yxYzMXk4e4iL4H9VCyf9/UiOX5wj9rmxvPqb7MCWLnkDM1LQvjJbdSh6ZOs9R7wqzK/PVFtXc2141didrhsIbsBPNTDuHlctKaxySp/ghPoWzu2FQeZuc78n+xrFQKPteO1M38SqUxxL5O0VHuclgcAKJ16lA0Au8fViN4yNta213YMQce5hO0pMlap/4yZWlPTUWxH3UeXujB192oGPswY4TPymrkqhqWApT2AqdT6PehVi/s/0iCihmLh5qb8VTvT8PiBIlkSKyUnQEoc9tgg6sSgeszjSWLincffCGsbHPfyYLUUpJQbTRqjZeUKWL6fJgIpxgeV/EanwPDo8BaSRmFX9MP6ZtIWBTShq4UuLib8QsRrj++9orJaXyufDv/YNeRRoI/XmVmueglbYNSv92zfGDNLucTYb9n7NxbqyZM4VfbiVTYkXwx775Wsz26BrPG4LOJciMv35BHtAwWVZmW1oIIF+30eoJ/NCkHmhzghUxxbFZQDmRuOpiIXh91BDlEW/QWdbuY5A4yO9MDWDPcsJluC+CRnW+BB6xn1ACB7k6fPhHfMxAUroY6TDx+WAlABkTtapwyEmZM3806zNzws/Fp9ZQe5FpLtnfk8VxKK3MeeaR3ERP+2iGxWA85U2rzGSzFgxGHn9WNM/NR4+Q6qqshK6n0GcLi0B2UcTXucX2cwJQ0fmup9zR1OYAvUfDfH+KHSi7NzmKlRwjMSunvZP"
`endif