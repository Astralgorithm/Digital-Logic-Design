`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 06:40:11 PM
// Design Name: 
// Module Name: top_demo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_demo
(
  // input
  input  logic [7:0] sw,
  input  logic [3:0] btn,
  input  logic       sysclk_125mhz,
  input  logic       rst,
  // output  
  output logic [7:0] led,
  output logic sseg_ca,
  output logic sseg_cb,
  output logic sseg_cc,
  output logic sseg_cd,
  output logic sseg_ce,
  output logic sseg_cf,
  output logic sseg_cg,
  output logic sseg_dp,
  output logic [3:0] sseg_an
);

  logic [16:0] CURRENT_COUNT;
  logic [16:0] NEXT_COUNT;
  logic        smol_clk;
  
  // Place TicTacToe instantiation here
  logic [119:0] message;
  logic [255:0] hashed;
  assign message = 120'h48656c6c6f2c205348412d32353621;
  top #(120, 512) dut (clock_50mhz, btn[0], btn[1], message, hashed);
  
  // 7-segment display
  logic mmcm_locked;
  logic clock_50mhz;
  clk_wiz_0 mmcm(.clk_out1(clock_50mhz),
                 .reset(1'b0),
                 .locked(mmcm_locked),
                 .clk_in1(sysclk_125mhz));
endmodule