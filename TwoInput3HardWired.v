`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:58 04/07/2013 
// Design Name: 
// Module Name:    TwoInput3HardWired 
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
module Mux_ALU1In2(
    input [15:0] Input1,
    input [15:0] Input2,
    input [15:0] Input3,
    input [2:0] Selection,
    output reg [15:0] Output
    );
	 
	always @ (Selection or Input1 or Input2)
	begin
		if( Selection == 0)
			Output = Input1;
		if( Selection == 1)
			Output = Input2;
		if( Selection == 2)
			Output = 1;
		if( Selection == 3)
			Output = 96;
		if( Selection == 4)
			Output = 97;
		if( Selection == 5)
			Output = 144;
		if( Selection == 6)
			Output = 0;
		if(Selection == 7)
			Output = Input3;
	end


endmodule
