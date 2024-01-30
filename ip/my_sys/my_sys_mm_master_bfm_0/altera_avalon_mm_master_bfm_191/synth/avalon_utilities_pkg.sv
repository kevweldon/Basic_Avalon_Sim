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


// $Id: //acds/rel/23.4/ip/iconnect/verification/lib/avalon_utilities_pkg.sv#1 $
// $Revision: #1 $
// $Date: 2023/10/12 $
//-----------------------------------------------------------------------------
// =head1 NAME
// avalon_utilities_pkg
// =head1 SYNOPSIS
// Package for shared types and functions
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
// This package contains shared types and functions.
// =cut
`timescale 1ns / 1ns

`ifndef _AVALON_UTILITIES_PKG_
`define _AVALON_UTILITIES_PKG_

package avalon_utilities_pkg;

   function automatic int clog2(
      bit [31:0] Depth
   );
      int	 i= Depth; 
      for(clog2 = 0; i > 0; clog2 = clog2 + 1)
        i = i >> 1;

      return clog2;
   endfunction 

   function automatic int max(
      bit [31:0] one,
      bit [31:0] two
   );     
      if(one > two)
	return one;
      else
	return two;
   endfunction 

   function automatic int lindex(
      bit [31:0] width
   );
      // returns the left index for a vector having a declared width 
      // when width is 0, then the left index is set to 0 rather than -1
      lindex = (width > 0) ? (width-1) : 0;
   endfunction
   
   typedef enum int {
      LOW      = 0,
      HIGH     = 1,
      RANDOM   = 2,  
      UNKNOWN  = 3
   } IdleOutputValue_t;
   
endpackage

`endif
   
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Oy3QR2mKNgmhEfGL3SW6HQfCmb79srhD44IOaAtUlH8/pTgcm9t2UrXActBjPTmN4Bv4NNlGdb4P/mc3rtoPRgAFqt2AVMJX3s0AQGiv7LFugS4Idf0kbtvb54pTXH+zn++Y2B/CghSRss/8348bn4PK6K78kVges9jyNixGVIibFRB8G5IWj5cfOPmgt+ydiX4ZjY+CtMVd406Jcd+oQRODgD4T+W1CBwJueCo1/aJ02x9cComQ6mqysJ8vCxCE6IpuXZGz7iIoid6N2wK72rGWCUp49gYU1KB61669/vC6MQStVOZlLSc+EXfWtg+LLOCntv+pkpUPflTcBXCwz98SXfR9Kv2OmAR2xCaePLbe6O81XlAUJ76J9NSfmEu5uRo8gcujzNZTQ08KUNtjFl9y/NhVKLJLssR4+EMN5wq6LDLUk9URuhzc6WyNXl0H7YGA3h1yPcUYYVVydGeCEjeMLu9QMqHt43JF7JDhYRRZTfFlMZsIP1n15a7BIaHuTgTdpL8AXiVP1k4pFqklOKcrJnT03qr7XGF4g5xy71TC2o/0ZQQmrg/R21p5N4NY2PMYmJTKlwCx72Il5xLMaAPrELs8b/nFU0ageZ891kvk5rDOqlM3of5bLdDzV4hUw3mXsB444PV7ZUHKkWntD2TIOnmm19p5OtBAzFe88xAwpbQqMSsIMKW5FVVbU6iBGIk/eY83QOJhZsBmzjMu2yLsi+krZ3D8B5EmD79L/ruJv3owiKR7f4OiJHVvmwM+KkUkpfOB3GlHthHYycCRu+clAlvAzwUmda8nFhFMYFQZEVMcWOzlWfGdlTFEF8Zpa1d1RZmLFWKKLeMo9VffZYvEOMBjIFdnLKKZAaZb/UxA+Mkp2025EyJMl6it6m8nnLjuETDQ+JIq0358cqL6jcvQ9EBvAV8J/mxG6w8ZbHWGf6CZAn4XSMZtIdiP7PLeqROPJtPSwXaCZKlovQE5GQS/5AtN9t18Ovu727yBr0jjWJHCq3uepfiC3OezzHsw"
`endif