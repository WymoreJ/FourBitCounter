
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

`timescale 1ns/1ps
module FourBitBinaryCounter_TB();
	
	//inputs
	reg clk;
	reg reset;
		
	//outputs
	wire [3:0] Q;
	
	//DUT instantiation
	FourBitBinaryCounter DUT(
	.clk(clk),
	.reset(reset),
	.Q(Q)
	);
	
	//clock generation
	initial
	begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end
	
	//always #5 clk = ~clk;
	
	//initialization
	initial
	begin
		reset = 1'b0;
	end
	
	//variation (fixed values/loops)
	initial
	begin
		reset = 1'b1; #50;
		reset = 1'b0; #50;
	end
	
	//values to monitor

endmodule
