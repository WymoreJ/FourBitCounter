`timescale 1ns/10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2025 08:06:30 PM
// Design Name: 
// Module Name: FourBitBinaryCounter
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


module FourBitBinaryCounter(
    input clk, 			//134Mhz clk source on Zybo z7-10
    input reset,		//reset counter and clock counter
    output reg[3:0] Q	//LED bit counter
    );
    
    reg [28:0] count = 0;
    
    always @(posedge(clk)) count <= count + 1;
  	
    always @(posedge count[26] or posedge reset)
    	begin
    		if (reset)
    			Q <= 0;					//reset binary counter
			else
				Q <= Q + 1; 			//increment binary counter
		end
	
endmodule
