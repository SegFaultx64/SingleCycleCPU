`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:31:49 10/27/2011
// Design Name:   reg_file
// Module Name:   /department/home/leporter/Xilinx/lab_basics/reg_file_tb.v
// Project Name:  lab_basics
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module reg_file_tb;

	// Inputs
	reg CLK;
	reg RegWrite;
	reg [3:0] srcA;
	reg [3:0] srcB;
	reg [3:0] writeReg;
	reg [15:0] writeValue;

	// Outputs
	wire [15:0] ReadA;
	wire [15:0] ReadB;

	// Instantiate the Unit Under Test (UUT)
	reg_file uut (
		.CLK(CLK), 
		.RegWrite(RegWrite), 
		.srcA(srcA), 
		.srcB(srcB), 
		.writeReg(writeReg), 
		.writeValue(writeValue), 
		.ReadA(ReadA), 
		.ReadB(ReadB)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RegWrite = 0;
		srcA = 0;
		srcB = 0;
		writeReg = 0;
		writeValue = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// check if writing works
		srcA = 4'b0001;
		writeReg = 4'b0001;
		writeValue = 16'hABCD;
		RegWrite = 1;
		
		#20;
		// verify writing to reg 0 does not work
		writeReg=4'b0000;
		writeValue = 16'h2030;
		
		#20;
		//verify writing without RegWrite has no impact
		RegWrite = 0;
		writeReg = 4'b0010;
		writeValue = 16'hABCD;
		srcA = 4'b0010;
		
	end
always
#10 CLK = ~CLK;
      
endmodule

