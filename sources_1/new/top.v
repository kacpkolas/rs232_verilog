`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 01:56:19 PM
// Design Name: 
// Module Name: top
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


module top(
input clk_i,
    input rst_i,
    output TXD_o,
    input RXD_i
    );
    wire [7:0] out_between;
    wire czywysylac;
    receiver odbiornik(clk_i,rst_i,RXD_i,out_between,czywysylac);
    transmitter nadajnik(clk_i, rst_i, TXD_o, out_between, czywysylac);
endmodule
