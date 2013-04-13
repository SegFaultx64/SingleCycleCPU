`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:36 04/07/2013 
// Design Name: 
// Module Name:    InputOrTwoMux 
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
module Mux_RegSrc2(
    input [16:0] Input1,
	 input [16:0] Input2,
    output reg [16:0] Output,
    input [2:0] Selection
    );
	 
	always @ (Selection or Input1 or Input2)
	begin : MUX
		case(Selection) 
			1'b0 : Output = Input1;
			1'b1 : Output = 16'b10;
			2 : Output = 4;
			3 : Output = 15;
			4 : Output = Input2;
		endcase 
	end


endmodule
