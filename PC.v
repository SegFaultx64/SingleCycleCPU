`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:42 04/12/2013 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input [15:0] Target,
    input Init,
    input Halt,
	 input CLK,
    output reg[15:0] Count
    );
	 
	 always @(posedge CLK)
	 begin
		if(Init==1)
			Count = 0;
		else if(Halt==1)
			Count = Count;
		else
			Count = Target;
	 end


endmodule
