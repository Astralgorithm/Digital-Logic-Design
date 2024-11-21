///////////////////////////////////////////
// mux.sv
//
// Written: David_Harris@hmc.edu 9 January 2021
// Modified: 
//
// Purpose: Various flavors of multiplexers
// 
// A component of the CORE-V-WALLY configurable RISC-V project.
// 
// Copyright (C) 2021-23 Harvey Mudd College & Oklahoma State University
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may not use this file 
// except in compliance with the License, or, at your option, the Apache License version 2.0. You 
// may obtain a copy of the License at
//
// https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work distributed under the 
// License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
// either express or implied. See the License for the specific language governing permissions 
// and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////

/* verilator lint_off DECLFILENAME */

module mux2 #(parameter WIDTH = 8) (
    input  logic [WIDTH-1:0] d0, d1, 
    input  logic s, 
    output logic [WIDTH-1:0] y);

    assign y = s ? d1 : d0; 
endmodule

module mux3 #(parameter WIDTH = 8) (
    input  logic [WIDTH-1:0] d0, d1, d2,
    input  logic [1:0]       s, 
    output logic [WIDTH-1:0] y);

    assign y = s[1] ? d2 : (s[0] ? d1 : d0); // exclusion-tag: mux3
endmodule

module mux4 #(parameter WIDTH = 8) (
    input  logic [WIDTH-1:0] d0, d1, d2, d3,
    input  logic [1:0]       s, 
    output logic [WIDTH-1:0] y);

  assign y = s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0); 
endmodule

module mux5 #(parameter WIDTH = 8) (
    input  logic [WIDTH-1:0] d0, d1, d2, d3, d4,
    input  logic [2:0]       s, 
    output logic [WIDTH-1:0] y);

    assign y = s[2] ? d4 : (s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0)); 
endmodule

module mux6 #(parameter WIDTH = 8) (
    input  logic [WIDTH-1:0] d0, d1, d2, d3, d4, d5,
    input  logic [2:0]       s, 
    output logic [WIDTH-1:0] y);

    assign y = s[2] ? (s[0] ? d5 : d4) : (s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0)); 
endmodule

module mux16 #(parameter WIDTH = 8)
    (input logic [WIDTH-1:0] d0, d1, d2, d3, d4, input [3:0] s,
    output logic [WIDTH-1:0] y);

    always_comb
        case(s)
            4'b0001: y = d0;
            4'b0010: y = d1;
            4'b0100: y = d2;
            4'b1000: y = d3;
            default: y = d4;
        endcase // case (s)
endmodule // mux16

module mux64 #(parameter WIDTH = 32)
    (input logic [WIDTH-1:0] W0, W1, W2, W3, W4, W5, W6, W7, 
                W8, W9, W10, W11, W12, W13, W14, W15, 
                W16, W17, W18, W19, W20, W21, W22, W23, 
                W24, W25, W26, W27, W28, W29, W30, W31, 
                W32, W33, W34, W35, W36, W37, W38, W39, 
                W40, W41, W42, W43, W44, W45, W46, W47, 
                W48, W49, W50, W51, W52, W53, W54, W55, 
                W56, W57, W58, W59, W60, W61, W62, W63, 
    input [5:0] s,
    output logic [WIDTH-1:0] W);

    always_comb
    case(s)
        6'b000000: W = W0;
        6'b000001: W = W1;
        6'b000010: W = W2;
        6'b000011: W = W3;
        6'b000100: W = W4;
        6'b000101: W = W5;
        6'b000110: W = W6;
        6'b000111: W = W7;
        6'b001000: W = W8;
        6'b001001: W = W9;
        6'b001010: W = W10;
        6'b001011: W = W11;
        6'b001100: W = W12;
        6'b001101: W = W13;
        6'b001110: W = W14;
        6'b001111: W = W15;
        6'b010000: W = W16;
        6'b010001: W = W17;
        6'b010010: W = W18;
        6'b010011: W = W19;
        6'b010100: W = W20;
        6'b010101: W = W21;
        6'b010110: W = W22;
        6'b010111: W = W23;
        6'b011000: W = W24;
        6'b011001: W = W25;
        6'b011010: W = W26;
        6'b011011: W = W27;
        6'b011100: W = W28;
        6'b011101: W = W29;
        6'b011110: W = W30;
        6'b011111: W = W31;
        6'b100000: W = W32;
        6'b100001: W = W33;
        6'b100010: W = W34;
        6'b100011: W = W35;
        6'b100100: W = W36;
        6'b100101: W = W37;
        6'b100110: W = W38;
        6'b100111: W = W39;
        6'b101000: W = W40;
        6'b101001: W = W41;
        6'b101010: W = W42;
        6'b101011: W = W43;
        6'b101100: W = W44;
        6'b101101: W = W45;
        6'b101110: W = W46;
        6'b101111: W = W47;
        6'b110000: W = W48;
        6'b110001: W = W49;
        6'b110010: W = W50;
        6'b110011: W = W51;
        6'b110100: W = W52;
        6'b110101: W = W53;
        6'b110110: W = W54;
        6'b110111: W = W55;
        6'b111000: W = W56;
        6'b111001: W = W57;
        6'b111010: W = W58;
        6'b111011: W = W59;
        6'b111100: W = W60;
        6'b111101: W = W61;
        6'b111110: W = W62;
        6'b111111: W = W63;
        default: W = 32'b0;
    endcase // case (s)
endmodule // mux16
/* verilator lint_on DECLFILENAME */

