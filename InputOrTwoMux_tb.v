`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:39:59 04/07/2013
// Design Name:   InputOrTwoMux
// Module Name:   /students/home/mwalker1/SingleCycle/InputOrTwoMux_tb.v
// Project Name:  SingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InputOrTwoMux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InputOrTwoMux_tb;

	// Inputs
	reg [16:0] Input;
	reg Selection;

	// Outputs
	wire [16:0] Output;

	// Instantiate the Unit Under Test (UUT)
	InputOrTwoMux uut (
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
		Input = 10;
		
		#10;
		
		Selection = 1;

	end
      
endmodule

