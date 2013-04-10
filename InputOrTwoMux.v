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
module InputOrTwoMux(
    input [16:0] Input,
    output reg [16:0] Output,
    input [1:0] Selection
    );
	 
	always @ (Selection or Input)
	begin : MUX
		case(Selection) 
			1'b0 : Output = Input;
			1'b1 : Output = 16'b10;
			2 : Output = 4;
		endcase 
	end


endmodule
