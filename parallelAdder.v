`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 08:36:11
// Design Name: 
// Module Name: parallelAdder
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


module parallelAdder(
input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);
    wire [6:0] carry;
    fullAdder fa0 (a[0], b[0], cin,sum[0], carry[0]);
    fullAdder fa1 (a[1], b[1], carry[0], sum[1], carry[1]);
    fullAdder fa2 (a[2], b[2], carry[1], sum[2], carry[2]);
    fullAdder fa3 (a[3], b[3], carry[2], sum[3], carry[3]);
    fullAdder fa4 (a[4], b[4], carry[3], sum[4], carry[4]);
    fullAdder fa5 (a[5], b[5], carry[4], sum[5], carry[5]);
    fullAdder fa6 (a[6], b[6], carry[5], sum[6], carry[6]);
    fullAdder fa7 (a[7], b[7], carry[6], sum[7], cout);
endmodule