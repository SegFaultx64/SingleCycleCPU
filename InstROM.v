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
module InstROM2(InstAddress, InstOut);
    input [15:0] InstAddress;
    output [9:0] InstOut;
	 
	 reg[9:0] InstOut;
	 always @ (InstAddress)
		begin
		case (InstAddress)
		0  : InstOut = 10'b0100000000;
		1  : InstOut = 10'b0010001001;
		2  : InstOut = 10'b0101001101;
		3  : InstOut = 10'b0110000000;
		4  : InstOut = 10'b0011000000;
		5  : InstOut = 10'b0101001101;
		6  : InstOut = 10'b0110000000;
		7  : InstOut = 10'b0011000001;
		8  : InstOut = 10'b0000000001;
		9  : InstOut = 10'b0000000100;
		10 : InstOut = 10'b0000000010;
		11 : InstOut = 10'b0000000100;
		12 : InstOut = 10'b0000000011;
		13 : InstOut = 10'b0000000100;
		default : InstOut = 10'b0000000000;
    endcase
  end

endmodule
