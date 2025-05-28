`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2025 20:47:46
// Design Name: 
// Module Name: tb
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


module tb();
reg clk;
reg rst;
reg RX;
wire [7:0] out;
wire czywysylac;
receiver odbiornik(clk,rst,RX,out,czywysylac);
initial
begin
clk=1'b0;
$monitor("Wartosc countera: %d", odbiornik.counter2);
$monitor("Wartosc enable: %d, %d", $time, odbiornik.enable );
$monitor("Counter1 co tam wyplul: %d, %d, czybitcostam %d", $time, odbiornik.counter1==5207, odbiornik.czy1bitprzeczytany);
RX=1'b1;
rst=1'b0;
end
always
#5 clk=~clk;
initial
    begin
        #40 rst =1'b1;
        #40 rst= 1'b0;
        #104160 RX = 1'b0;
        #104160 RX = 1'b1;
        #104160 RX = 1'b0;
        #104160 RX = 1'b1;
        #104160 RX = 1'b0;
        #104160 RX = 1'b1;
        #104160 RX = 1'b0;
        #104160 RX = 1'b1;
        #104160 RX = 1'b0;
        #104160 RX = 1'b1;
    end
    
endmodule