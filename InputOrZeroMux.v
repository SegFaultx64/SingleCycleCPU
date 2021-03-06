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
    input [15:0] Input,
    output reg [15:0] Output,
    input [1:0] Selection
    );
	 
	always @ (Selection or Input)
	begin
		case(Selection) 
			0 : Output = Input;
			1 : Output = 0;
			2 : Output = 10;
		endcase 
		//$display("MemDest Selection: %d Value: %d",Selection,Output);
	end


endmodule
