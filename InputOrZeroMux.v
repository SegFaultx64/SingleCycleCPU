`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:55 04/07/2013 
// Design Name: 
// Module Name:    InputOrZeroMux 
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
module Mux_MemDest(
    input [16:0] Input,
    output reg [16:0] Output,
    input [1:0] Selection
    );
	 
	always @ (Selection or Input)
	begin : MUX
		case(Selection) 
			0 : Output = Input;
			1 : Output = 16'b0;
			2 : Output = 10;
		endcase 
	end


endmodule
