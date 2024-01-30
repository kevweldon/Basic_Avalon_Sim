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


// $Id: //acds/rel/23.4/ip/iconnect/merlin/altera_merlin_burst_adapter/new_source/altera_default_burst_converter.sv#1 $
// $Revision: #1 $
// $Date: 2023/10/12 $

// --------------------------------------------
// Default Burst Converter
// Notes:
//  1) If burst type FIXED and slave is AXI,
//     passthrough the transaction.
//  2) Else, converts burst into non-bursting
//     transactions (length of 1).
// --------------------------------------------

`timescale 1 ns / 1 ns

module altera_default_burst_converter
#(
    parameter PKT_BURST_TYPE_W  = 2,
    parameter PKT_BURSTWRAP_W   = 5,
    parameter PKT_ADDR_W        = 12,
    parameter PKT_BURST_SIZE_W  = 3,
    parameter IS_AXI_SLAVE      = 0,
    parameter LEN_W             = 2,
    parameter SYNC_RESET        = 0
)
(
    input                                    clk,
    input                                    reset,
    input                                    enable,

    input      [PKT_BURST_TYPE_W - 1 : 0]    in_bursttype,
    input      [PKT_BURSTWRAP_W  - 1 : 0]    in_burstwrap_reg,
    input      [PKT_BURSTWRAP_W  - 1 : 0]    in_burstwrap_value,
    input      [PKT_ADDR_W       - 1 : 0]    in_addr,
    input      [PKT_ADDR_W       - 1 : 0]    in_addr_reg,
    input      [LEN_W            - 1 : 0]    in_len,
    input      [PKT_BURST_SIZE_W - 1 : 0]    in_size_value,

    input                                    in_is_write,

    output reg [PKT_ADDR_W       - 1 : 0]    out_addr,
    output reg [LEN_W            - 1 : 0]    out_len,

    output reg                               new_burst
);

    // ---------------------------------------------------
    // AXI Burst Type Encoding
    // ---------------------------------------------------
    typedef enum bit  [1:0]
    {
     FIXED       = 2'b00,
     INCR        = 2'b01,
     WRAP        = 2'b10,
     RESERVED    = 2'b11
    } AxiBurstType;

    // -------------------------------------------
    // Internal Signals
    // -------------------------------------------
    wire [LEN_W - 1 : 0]    unit_len = {{LEN_W - 1 {1'b0}}, 1'b1};
    reg  [LEN_W - 1 : 0]    next_len;
    reg  [LEN_W - 1 : 0]    remaining_len;
    reg  [PKT_ADDR_W       - 1 : 0]    next_incr_addr;
    reg  [PKT_ADDR_W       - 1 : 0]    incr_wrapped_addr;
    reg  [PKT_ADDR_W       - 1 : 0]    extended_burstwrap_value;
    reg  [PKT_ADDR_W       - 1 : 0]    addr_incr_variable_size_value;


    // Generation of internal reset synchronization
   reg internal_sclr;
   generate if (SYNC_RESET == 1) begin : rst_syncronizer
      always @ (posedge clk) begin
         internal_sclr <= reset;
      end
   end
   endgenerate

    // -------------------------------------------
    // Byte Count Converter
    // -------------------------------------------
    // Avalon Slave: Read/Write, the out_len is always 1 (unit_len).
    // AXI Slave: Read/Write, the out_len is always the in_len (pass through) of a given cycle.
    //            If bursttype RESERVED, out_len is always 1 (unit_len).
    generate if (IS_AXI_SLAVE == 1)
        begin : axi_slave_out_len
          always_ff @(posedge clk) begin
              if (enable) begin
                  out_len <= (in_bursttype == FIXED) ? in_len : unit_len;
              end
          end

          //if (SYNC_RESET == 0 ) begin : async_rst1
          //  always_ff @(posedge clk, posedge reset) begin
          //      if (reset) begin
          //          out_len <= {LEN_W{1'b0}};
          //      end
          //      else if (enable) begin
          //          out_len <= (in_bursttype == FIXED) ? in_len : unit_len;
          //      end
          //  end
          //end // async_rst1
          //else begin // sync_rst1
          //  always_ff @(posedge clk) begin
          //      if (internal_sclr) begin
          //          out_len <= {LEN_W{1'b0}};
          //      end
          //      else if (enable) begin
          //          out_len <= (in_bursttype == FIXED) ? in_len : unit_len;
          //      end
          //  end
          //end // sync_rst1
        end
    else // IS_AXI_SLAVE == 0
        begin : non_axi_slave_out_len
            always_comb begin
                out_len = unit_len;
            end
        end
    endgenerate


    always_comb begin : proc_extend_burstwrap
        extended_burstwrap_value = {{(PKT_ADDR_W - PKT_BURSTWRAP_W){in_burstwrap_reg[PKT_BURSTWRAP_W - 1]}}, in_burstwrap_value};
        addr_incr_variable_size_value = {{(PKT_ADDR_W - 1){1'b0}}, 1'b1} << in_size_value;
    end

    // -------------------------------------------
    // Address Converter
    // -------------------------------------------
    // Write: out_addr = in_addr at every cycle (pass through).
    // Read: out_addr = in_addr at every new_burst. Subsequent addresses calculated by converter.
    always_ff @(posedge clk) begin
        if (enable) begin
            next_incr_addr <= next_incr_addr + addr_incr_variable_size_value;
            if (new_burst) begin
                next_incr_addr <= in_addr + addr_incr_variable_size_value;
            end
            out_addr <= incr_wrapped_addr;
        end
    end


    //generate
    //if (SYNC_RESET == 0) begin : async_rst2
    //   always_ff @(posedge clk, posedge reset) begin
    //       if (reset) begin
    //           next_incr_addr <= {PKT_ADDR_W{1'b0}};
    //           out_addr <= {PKT_ADDR_W{1'b0}};
    //       end
    //       else if (enable) begin
    //           next_incr_addr <= next_incr_addr + addr_incr_variable_size_value;
    //           if (new_burst) begin
    //               next_incr_addr <= in_addr + addr_incr_variable_size_value;
    //           end
    //           out_addr <= incr_wrapped_addr;
    //       end
    //   end
    // end // async_rst2
    // else begin // sync_rst2
    //   always_ff @(posedge clk) begin
    //       if (internal_sclr) begin
    //           next_incr_addr <= {PKT_ADDR_W{1'b0}};
    //           out_addr <= {PKT_ADDR_W{1'b0}};
    //       end
    //       else if (enable) begin
    //           next_incr_addr <= next_incr_addr + addr_incr_variable_size_value;
    //           if (new_burst) begin
    //               next_incr_addr <= in_addr + addr_incr_variable_size_value;
    //           end
    //           out_addr <= incr_wrapped_addr;
    //       end
    //   end
    // end // sync_rst2
    //endgenerate
    
    always_comb begin
        incr_wrapped_addr = in_addr;
        if (!new_burst) begin
            // This formula calculates addresses of WRAP bursts and works perfectly fine for other burst types too.
            incr_wrapped_addr = (in_addr_reg & ~extended_burstwrap_value) | (next_incr_addr & extended_burstwrap_value);
        end
    end

    // -------------------------------------------
    // Control Signals
    // -------------------------------------------

    // Determine the min_len.
    //     1) FIXED read to AXI slave: One-time passthrough, therefore the min_len == in_len.
    //     2) FIXED write to AXI slave: min_len == 1.
    //     3) FIXED read/write to Avalon slave: min_len == 1.
    //     4) RESERVED read/write to AXI/Avalon slave: min_len == 1.
    wire [LEN_W  - 1 : 0] min_len;
    generate if (IS_AXI_SLAVE == 1)
        begin : axi_slave_min_len
            assign min_len = (!in_is_write && (in_bursttype == FIXED)) ? in_len : unit_len;
        end
    else // IS_AXI_SLAVE == 0
        begin : non_axi_slave_min_len
            assign min_len = unit_len;
        end
    endgenerate

    // last_beat calculation.
    wire last_beat = (remaining_len == min_len);

    // next_len calculation.
    always_comb begin
        remaining_len = in_len;
        if (!new_burst) remaining_len = next_len;
    end

    always_ff @(posedge clk) begin
        if (enable) begin
            next_len <= remaining_len - unit_len;
        end
    end

    generate 
    if (SYNC_RESET == 0) begin : async_rst3
       //always_ff @(posedge clk, posedge reset) begin
       //    if (reset) begin
       //        next_len <= 1'b0;
       //    end
       //    else if (enable) begin
       //        next_len <= remaining_len - unit_len;
       //    end
       //end

       // new_burst calculation.
        always_ff @(posedge clk, posedge reset) begin
           if (reset) begin
                new_burst <= 1'b1;
            end
         else if (enable) begin
             new_burst <= last_beat;
         end
        end
     end // async_rst3
     else begin // sync_rst3
       //always_ff @(posedge clk) begin
       //    if (internal_sclr) begin
       //        next_len <= 1'b0;
       //    end
       //    else if (enable) begin
       //        next_len <= remaining_len - unit_len;
       //    end
       //end

       // new_burst calculation.
       always_ff @(posedge clk) begin
            if (internal_sclr) begin
                new_burst <= 1'b1;
            end
            else if (enable) begin
                new_burst <= last_beat;
            end
       end
     end // sync_rst3
     endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Oy3QR2mKNgmhEfGL3SW6HQfCmb79srhD44IOaAtUlH8/pTgcm9t2UrXActBjPTmN4Bv4NNlGdb4P/mc3rtoPRgAFqt2AVMJX3s0AQGiv7LFugS4Idf0kbtvb54pTXH+zn++Y2B/CghSRss/8348bn4PK6K78kVges9jyNixGVIibFRB8G5IWj5cfOPmgt+ydiX4ZjY+CtMVd406Jcd+oQRODgD4T+W1CBwJueCo1/aIVSU1Uqelvtx0LmzJW5+oMDcTOMv1XegNO3sessnrc09/WnjfSiXcMAWhIgf54Yn7fyk4qBWkqWtKsmpHEpMLZDtLGm+7jorlI2ibx0pam7PGRhE7Q12jXf2GDC9Oj9jD3vhfCPktyLbCawTn5xXgswJBWtanH8PY23uLhzQEnlEQsGPVAggqThNrjG8wrIiR5e1vyoicsUOZVlU3SqM9nh3OcIYj9+FGegvWxdJOljkKImC3e3SKDTi/AAtw4KEdWsuhnfRk5wmB7iqXbP8keLK8NYqoHj/eidwiw/0SR0iS2EMcxSOysqDck/yPsRkyOL6wUzhj7B3E53RBBIVUyw4b3kFGYXRl1+uGGr6tsIpO+mwSEfWjgXWseMNhrKRLmRHslDo3E0m0R0onYPIr+rtPvlzh5cwwU2/CQQjFs8Mh0DtUL8TFRU+tyWGZJAQ/swoafMm1cb2Ij8CnRiCv/AffTNt9Hj4gBcqZTTm0um6VhOYnREByXSaslCZBOBAZKbZPt82/Ymt18v/znA0CjRUXETrGdya7yy7hoSbqJFygQal/X6X4S8mgMOb81KMAHnQ1niThOvDmaPpLkICaHAVR183tsLBh4LHCfDlY7GpJI4gqnjcYYnWFmFVxjb6X72Ctd9yx0504ehpevnT7IOUvasVXGZRexbgLB6Gb4uAkGhDV3qsq6QO+ooQaeoiiQIM51pB+TarZpi9cu5dm2YNdW6Zm+tcJb+ebP2XLU2Nnt3SHCMVcFEOAvRi8FSbqwRD7v23RI0WO8Oq8J/Owz"
`endif