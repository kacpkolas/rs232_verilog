`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 03:08:57 PM
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


module receiver(
    input clk_i,
    input rst_i,
    input RXD_i,
    output reg[7:0] out,
    output reg czywysylac   
    );
    
    
    reg[13:0] counter1;
    reg rxd_old;
    reg enable;

    reg czy1bitprzeczytany;
    reg[3:0] counter2;
   
 
   
   always @(posedge clk_i or posedge rst_i)
   begin
   
   if (rst_i) 
   begin
   counter1=0;
   counter2=0;
   enable<=0;
   out=0;
   czy1bitprzeczytany<=0;
   czywysylac <=0;
   rxd_old<=1'b1;
   end else begin
   if(rxd_old ^ RXD_i)
   begin
   enable <= 1'b1;
   end
   
   if (enable) 
   begin
   counter1=counter1+1;
   
        if(counter1==5208 && czy1bitprzeczytany==0)
        begin
        czywysylac<=1'b0;
        czy1bitprzeczytany <= 1'b1;
        counter1=0;
        counter2=0;
        end
        
        if(counter1==10416)
        begin 
        if(counter2<8)
        begin
        out[counter2]=RXD_i;
        counter1=0;
        end
        
        if(counter2==8)
        begin
        czywysylac<=1'b1;
        counter1=0;
        end
        if(counter2==9)
        begin
        enable<=0;
        counter2=1'b0;
        counter1=0;
        czywysylac<=1'b0;
        czy1bitprzeczytany <= 1'b0;
        end
        counter2 = counter2+1;
        end
   end
   rxd_old <= RXD_i;
   end 
        
   end
endmodule