`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:14:32 04/07/2013
// Design Name:   InputOr0Or1
// Module Name:   /students/home/mwalker1/SingleCycle/InpurOr0Or1.v
// Project Name:  SingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InputOr0Or1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InpurOr0Or1;

	// Inputs
	reg [16:0] Input;
	reg [1:0] Selection;

	// Outputs
	wire [16:0] Output;

	// Instantiate the Unit Under Test (UUT)
	InputOr0Or1 uut (
		.Input(Input), 
		.Output(Output), 
		.Selection(Selection)
	);

	initial begin
		// Initialize Inputs
		Input = 0;
		Selection = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Input = 5;

		#10;
		
		Selection = 1;
		
		#10;
		
		Selection = 2;

	end
      
endmodule

