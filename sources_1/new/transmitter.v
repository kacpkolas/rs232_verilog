`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 01:32:58 PM
// Design Name: 
// Module Name: transmitter
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


module transmitter(
input clk_i,
    input rst_i,
    output reg TXD_o,
    input wire[7:0] in,
    input wire czywysylac 
    );
    
reg czywysylac_old;
reg enable;
reg[13:0] counter1;
reg[5:0] counter2;
 
 always @(posedge clk_i or posedge rst_i)
   begin
        if(rst_i)
        begin
        enable=0;
        counter1=0;
        counter2=0;
        TXD_o=1'b1;
        czywysylac_old=0;
        end else
        begin
        if(czywysylac_old==0 & czywysylac==1'b1)
            begin
                enable=1'b1;
                counter1=0;
                counter2=0;
            end
        if(enable)
        begin
            counter1=counter1+1;
                if(counter1==10416)
                begin
                    if(counter2==0)
                    begin
                        TXD_o = 0;
                       
                    end
                    if(counter2>0 && counter2<9)
                    begin
                    if(counter2==6)
                    begin
                    TXD_o = ~in[counter2-1];
                    
                    end else begin
                    TXD_o = in[counter2-1];
                    end
                        
                    end
                    if(counter2==9)
                    begin
                    TXD_o = 1'b1;
                    enable = 0;
                    counter2=0;
                    end
                counter1=0;
                counter2=counter2+1;        
                end
        end
        end
   czywysylac_old = czywysylac;     
   end    
endmodule
