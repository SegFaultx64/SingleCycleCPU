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
module TwoBitTrueMux(
    input [16:0] Input1,
    input [16:0] Input2,
	 input Selection,
    output reg [16:0] Output
    );
	 
	always @ (Selection or Input1 or Input2)
	begin : MUX
		case(Selection) 
			1'b0 : Output = Input1;
			1'b1 : Output = Input2;
		endcase 
	end

endmodule
