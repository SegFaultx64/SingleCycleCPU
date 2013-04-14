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
		//$display("Halt: %d",Halt);
		$display("-------------------------------");
		$display("PC: %d",Count);
		$display("-------------------------------");
		if(Init)
			Count = 16'b0;
		else if(Halt == 1)
		begin
			$display("halting");
			Count = Count;
		end
		else
			Count = Target;
	 end


endmodule
