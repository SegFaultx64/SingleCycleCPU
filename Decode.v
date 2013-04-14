`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:06:24 04/07/2013 
// Design Name: 
// Module Name:    Decoder 
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
module Decoder(
    input[9:0] Instruction,
    output reg [3:0] Opcode,
    output reg [15:0] FiveToTwo,
    output reg [15:0] FiveToOne,
    output reg [15:0] FiveToZero,
	 output reg [15:0] OneToZero,
    output reg Bit1,
    output reg Bit0
	 );

	always @(Instruction)
		begin
		
		assign Opcode = Instruction[9:6];
		assign FiveToTwo = {12'b0, Instruction[5:2]};
		assign FiveToOne = {11'b0, Instruction[5:1]};
		assign FiveToZero = {10'b0, Instruction[5:0]};
		assign OneToZero = {14'b0, Instruction[1:0]};
		assign Bit1 = Instruction[1:1];
		assign Bit0 = Instruction[0:0];
		
		end
endmodule
