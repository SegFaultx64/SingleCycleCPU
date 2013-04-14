`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 	Leo Porter
// 
// Create Date:    15:50:22 11/02/2007 
// Design Name: 
// Module Name:    InstROM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This is a basic verilog module to behave as an instruction ROM
// 				 template.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module InstROM1(InstAddress, InstOut);
    input [15:0] InstAddress;
    output [9:0] InstOut;
	 
	 reg[9:0] InstOut;
	 always @ (InstAddress)
		begin
		case (InstAddress)
		0  : InstOut = 10'b0010000000;
		1  : InstOut = 10'b1000010010;
		2  : InstOut = 10'b1001000001;
		3  : InstOut = 10'b1001001100;
		4  : InstOut = 10'b0111000010;
		5  : InstOut = 10'b0000000000;
		6  : InstOut = 10'b1010010010;
		7  : InstOut = 10'b0001001001;
		8  : InstOut = 10'b0100000010;
		9  : InstOut = 10'b1011000000;
		10 : InstOut = 10'b1011000110;
		11 : InstOut = 10'b0101011000;
		12 : InstOut = 10'b1001001100;
		13 : InstOut = 10'b1101001000;
		14 : InstOut = 10'b1001101000;
		15 : InstOut = 10'b1100011000;
		16 : InstOut = 10'b0101000100;
		17 : InstOut = 10'b1100000000;
		18 : InstOut = 10'b0101000100;
		19 : InstOut = 10'b0100000010;
		20 : InstOut = 10'b1101100001;
		21 : InstOut = 10'b1000011001;
		22 : InstOut = 10'b1010110001;
		23 : InstOut = 10'b0100000010;
		24 : InstOut = 10'b1110100010;
		25 : InstOut = 10'b0101011100;
		26 : InstOut = 10'b0100000001;
		default : InstOut = 10'b0000000000;
    endcase
  end

endmodule
