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
module InputOrZeroMux(
    input [16:0] Input,
    output reg [16:0] Output,
    input Selection
    );
	 
	always @ (Selection or Input)
	begin : MUX
		case(Selection) 
			1'b0 : Output = Input;
			1'b1 : Output = 16'b0;
		endcase 
	end


endmodule
