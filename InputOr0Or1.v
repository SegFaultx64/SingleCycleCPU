`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:39 04/07/2013 
// Design Name: 
// Module Name:    InputOr0Or1 
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
module Mux_RegSrc1(
    input [15:0] Input,
    output reg [15:0] Output,
    input [2:0] Selection
    );
	 
	always @ (Selection or Input)
	begin
		if( Selection == 0)
			Output = Input;
		if( Selection == 1)
			Output = 16'b0;
		if( Selection == 2)
			Output = 16'b1;
		if( Selection == 3)
			Output = 3;
		if( Selection == 4)
			Output = 6;
		if( Selection == 5)
			Output = 7;
		if( Selection == 6)
			Output = 2;
		if(Selection == 7)
			Output = 4;
	end

endmodule
