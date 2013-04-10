`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:57:56 04/07/2013
// Design Name:   ThreeInputsOr3HardWiredMuxes
// Module Name:   /students/home/mwalker1/SingleCycle/ThreeInputsOr3HardWiredMuxes_tb.v
// Project Name:  SingleCycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ThreeInputsOr3HardWiredMuxes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ThreeInputsOr3HardWiredMuxes_tb;

	// Inputs
	reg [16:0] Input1;
	reg [16:0] Input2;
	reg [16:0] Input3;
	reg [3:0] Selection;

	// Outputs
	wire [16:0] Output;

	// Instantiate the Unit Under Test (UUT)
	ThreeInputsOr3HardWiredMuxes uut (
		.Input1(Input1), 
		.Input2(Input2), 
		.Input3(Input3), 
		.Selection(Selection), 
		.Output(Output)
	);

	initial begin
		// Initialize Inputs
		Input1 = 0;
		Input2 = 0;
		Input3 = 0;
		Selection = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Input1 = 42;
		Input2 = 65;
		Input3 = 85;
		
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

	end
      
endmodule

