`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:53:14 04/07/2013 
// Design Name: 
// Module Name:    ThreeInputsOr3HardWiredMuxes 
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
module ThreeInputsOr3HardWiredMuxes(
    input [16:0] Input1,
    input [16:0] Input2,
    input [16:0] Input3,
	 input [16:0] PC,
    input [3:0] Selection,
    output reg [16:0] Output
    );
	 
	always @ (Selection or Input1 or Input2 or Input3 or PC)
	begin
		if( Selection == 0)
			Output = Input1;
		if( Selection == 1)
			Output = Input2;
		if( Selection == 2)
			Output = Input3;
		if( Selection == 3)
			Output = 16'b1011111;
		if( Selection == 4)
			Output = 16'b11001000;
		if( Selection == 5)
			Output = -1;
		if( Selection == 6)
			Output = PC;
	end

endmodule
