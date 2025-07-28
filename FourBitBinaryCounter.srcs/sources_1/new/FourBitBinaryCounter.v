`timescale 1ns/1ps
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

/*
module FourBitBinaryCounter (
    input clk, 			//134Mhz clk source on Zybo z7-10
    input reset,		//reset counter and clock counter
    output reg[3:0] Q	//LED bit counter
    );
        
    parameter CLOCK_LIMIT = 2;

    reg [CLOCK_LIMIT:0] count = 0;
    
    always @(posedge(clk)) count <= count + 1;
  	
    always @(posedge count[CLOCK_LIMIT] or posedge reset)
    	begin
    		if (reset)
    			Q <= 0;					//reset binary counter
			else
				Q <= Q + 1; 			//increment binary counter
		end
	
endmodule*/

module FourBitBinaryCounter (
    input clk,              // 134 MHz clock from Zybo Z7-10
    input reset,            // synchronous reset signal
    output reg [3:0] Q      // 4-bit output counter
);

	parameter CLOCK_LIMIT = 134_000_000 - 1;	//For 134MHz clock
    //parameter CLOCK_LIMIT = 2;				// For 3-bit counter (values 0-7)
    reg [26:0] count = 0;						//implementation count
    //reg [CLOCK_LIMIT:0] count = 0;			//simulation count
    wire tick = (count == CLOCK_LIMIT);
    
    //assign tick = (count == 0);

    always @(posedge clk) 
    begin
        if (reset)
            count <= 0; 
        else if (tick)
            count <= 0;
		else
			count <= count + 1;
	end
    
    always @(posedge clk) 
    begin
    	if (reset)
    		Q <= 0;
    	else if (tick)
    		Q <= Q + 1;
    end

endmodule