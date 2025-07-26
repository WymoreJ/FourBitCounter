`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Justin Wymore
// 
// Create Date: 07/22/2025 08:40:03 PM
// Design Name: 
// Module Name: FourBitBinaryCounter_TB
// Project Name: Project 2
// Target Devices: Zybo Z7-10
// Tool Versions: Vivado 2025.1
// Description: 4-bit Binary counter output on 4 LED's with an asynchronous reset at button 0
//////////////////////////////////////////////////////////////////////////////////


module FourBitBinaryCounter_TB;
	reg clk;
	reg reset;
	parameter CLK_PERIOD = 8;
	reg [3:0] Q;
    
    FourBitBinaryCounter DUT(
    .clk (clk),
    .reset (reset),
    .Q (Q));
        
    initial begin
    
		clk = 0;
		reset = 0;
		
		forever begin
		#(CLK_PERIOD/2) clk = ~clk;
		//#30 Reset <= 0;
		//#50 Reset <= 1;
		//#150 Reset <= 0;
		end
	end
    
endmodule
