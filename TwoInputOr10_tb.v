`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:57:44 04/07/2013
// Design Name:   TwoInputOr10
// Module Name:   /students/home/mwalker1/SingleCycle/TwoInputOr10_tb.v
// Project Name:  SingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TwoInputOr10
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TwoInputOr10_tb;

	// Inputs
	reg [16:0] Input1;
	reg [16:0] Input2;
	reg [2:0] Selection;

	// Outputs
	wire [16:0] Output;

	// Instantiate the Unit Under Test (UUT)
	TwoInputOr10 uut (
		.Input1(Input1), 
		.Input2(Input2), 
		.Selection(Selection), 
		.Output(Output)
	);

	initial begin
		// Initialize Inputs
		Input1 = 0;
		Input2 = 0;
		Selection = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Input1 = 5;
		Input2 = 15;

		#10;
		
		Selection = 1;
		
		#10;
		
		Selection = 2;

	end
      
endmodule

