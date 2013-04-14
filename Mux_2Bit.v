`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:51 04/07/2013 
// Design Name: 
// Module Name:    TwoBitTrueMux 
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
module Mux_2Bit(
    input [15:0] Input1,
    input [15:0] Input2,
    input [15:0] Input3,
    input [15:0] Input4,
	 input [1:0] Selection,
    output reg [15:0] Output
    );
	 
	always @ (Selection or Input1 or Input2 or Input3 or Input4)
	begin
		if (Selection == 0)
			Output = Input1;
		else if (Selection == 1)
			Output = Input2;
		else if (Selection == 2)
			Output = Input3;
		else if (Selection == 3)
			Output = Input3;
	end

endmodule
