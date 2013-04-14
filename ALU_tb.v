`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:12:37 10/27/2011
// Design Name:   ALU
// Module Name:   /department/home/leporter/Xilinx/lab_basics/ALU_tb.v
// Project Name:  lab_basics
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [1:0] OP;
	reg [15:0] INPUTA;
	reg [15:0] INPUTB;

	// Outputs
	wire [15:0] OUT;
	wire ZERO;
	wire EQUAL;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.OP(OP), 
		.INPUTA(INPUTA), 
		.INPUTB(INPUTB), 
		.OUT(OUT), 
		.ZERO(ZERO), 
		.EQUAL(EQUAL)
	);

	initial begin
		// Initialize Inputs
		OP = 0;
		INPUTA = 0;
		INPUTB = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		INPUTA = 16'h0004;
		INPUTB = 16'h0004;
		#15;
		
		OP = 1;
		#15
		OP=2;
		#15
		INPUTB = 16'h0003;
		OP=3;

	end


endmodule

