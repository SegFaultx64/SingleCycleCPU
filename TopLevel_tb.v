`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:43:58 04/13/2013
// Design Name:   TopLevel
// Module Name:   /students/home/mwalker1/SingleCycle/TopLevel_tb.v
// Project Name:  SingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TopLevel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TopLevel_tb;

	// Inputs
	reg Init;
	reg CLK;
	reg Program;

	// Outputs

	// Instantiate the Unit Under Test (UUT)
	TopLevel uut (
		.Init(Init), 
		.CLK(CLK),
		.Program(Program)
	);

	initial begin
		// Initialize Inputs
		Init = 1;
		CLK = 0;
		Program = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
      Init = 0;
		
		#10;
		
		// Add stimulus here

	end
	
	always begin
     #5  CLK = ~CLK; // Toggle clock every 5 ticks
	end
      
endmodule

