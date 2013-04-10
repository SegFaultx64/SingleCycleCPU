`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:01 04/10/2013 
// Design Name: 
// Module Name:    BranchSelectionMux 
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
module BranchSelectionMux(
    input [16:0] Input1,
    input [16:0] Input2,
    input [16:0] Input3,
    input [16:0] Input4,
    input [3:0] Selection,
    output reg [16:0] Output
    );

	always @ (Selection or Input1 or Input2 or Input3 or Input4)
	begin
		if( Selection == 0)
			Output = Input1;
		if( Selection == 1)
			Output = Input2;
		if( Selection == 2)
			Output = Input3;
		if( Selection == 3)
			Output = Input4;
		if( Selection == 4)
			Output = 22;
		if( Selection == 5 )
			Output = 12;
	end

endmodule
