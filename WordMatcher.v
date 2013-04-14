`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:51 04/10/2013 
// Design Name: 
// Module Name:    WordMatcher 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module WordMatcher(
    input FullMatch,
    input FirstHalf,
    input SecondHalf,
    input Flag,
	 output reg [15:0] Output
    );
	 
	always @ (FullMatch or FirstHalf or SecondHalf or Flag)
	begin
	if (SecondHalf && Flag)
		Output = 10;
	else if (FullMatch)
		Output = 8;
	else if (FirstHalf)
		Output = 5;
	else
		Output = 2;
	end
	
	

endmodule
