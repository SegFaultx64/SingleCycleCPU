`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:31:37 04/07/2013
// Design Name:   TwoBitTrueMux
// Module Name:   /students/home/mwalker1/SingleCycle/TwoBitTrueMux_tb.v
// Project Name:  SingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TwoBitTrueMux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TwoBitTrueMux_tb;

	// Inputs
	reg [16:0] Input1;
	reg [16:0] Input2;
	reg Selection;

	// Outputs
	wire [16:0] Output;

	// Instantiate the Unit Under Test (UUT)
	TwoBitTrueMux uut (
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
		Input1 = 10;
		
		#10
		
		Input2 = 15;
		
		#10
		
		Selection = 1;

	end
      
endmodule

