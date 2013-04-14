`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:01 04/07/2013 
// Design Name: 
// Module Name:    GiantMux 
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
module Mux_RegDest(
    input [15:0] Input,
    output reg [15:0] Output,
    input [3:0] Selection
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
			Output = 16'b10;
		if( Selection == 4)
			Output = 16'b11;
		if( Selection == 5)
			Output = 16'b100;
		if( Selection == 6)
			Output = 16'b110;
		if( Selection == 7)
			Output = 16'b111;
		if( Selection == 8)
			Output = 16'b1000;
		if( Selection == 9)
			Output = 16'b1001;
		if( Selection == 10)
			Output = 16'b1111;
		if( Selection == 11)
			Output = 5;
	end

endmodule
