`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:39:36 04/07/2013
// Design Name:   GiantMux
// Module Name:   /students/home/mwalker1/SingleCycle/GiantMux_tb.v
// Project Name:  SingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GiantMux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GiantMux_tb;

	// Inputs
	reg [16:0] Input;
	reg [3:0] Selection;

	// Outputs
	wire [16:0] Output;

	// Instantiate the Unit Under Test (UUT)
	GiantMux uut (
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
		Input = 42;
		
		#10;
		
		Selection = 1;
		
		#10;
		
		Selection = 2;
		
		#10;
		
		Selection = 3;
		
		#10;
		
		Selection = 4;
		
		#10;
		
		Selection = 5;
		
		#10;
		
		Selection = 6;
		
		#10;
		
		Selection = 7;
		
		#10;
		
		Selection = 8;
		
		#10;
		
		Selection = 9;
		
		#10;
		
		Selection = 10;
		
	end
      
endmodule

