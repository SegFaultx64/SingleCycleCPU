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
module InputOr0Or1(
    input [16:0] Input,
    output reg [16:0] Output,
    input [1:0] Selection
    );
	 
	always @ (Selection or Input)
	begin
		if( Selection == 0)
			Output = Input;
		if( Selection == 1)
			Output = 16'b0;
		if( Selection == 2)
			Output = 16'b1;
	end

endmodule
