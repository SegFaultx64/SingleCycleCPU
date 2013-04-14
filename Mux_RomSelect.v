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
module Mux_RomSelect(
    input [9:0] Input1,
    input [9:0] Input2,
	 input Selection,
    output reg [9:0] Output
    );
	 
	always @ (Selection or Input1 or Input2)
	begin
		if (Selection == 0)
			Output = Input1;
		else
			Output = Input2;
	end

endmodule
