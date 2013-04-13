`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:34 04/07/2013 
// Design Name: 
// Module Name:    TwoInputOr10 
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
module Mux_MemInData(
    input [16:0] Input1,
    input [16:0] Input2,
    input [2:0] Selection,
    output reg [16:0] Output
    );
	
	
	always @ (Selection or Input1 or Input2)
	begin
		if( Selection == 0)
			Output = Input1;
		if( Selection == 1)
			Output = Input2;
		if( Selection == 2)
			Output = 16'b1010;
	end
	
endmodule
