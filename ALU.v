`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:22 10/27/2011 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [2:0] OP,
    input [15:0] INPUTA,
    input [15:0] INPUTB,
    output reg [15:0] OUT,
    output reg ZERO
    );
	 
	
	always @(INPUTA, INPUTB, OP)
	begin
	
	case(OP)
		0 : OUT = INPUTA+INPUTB;
		1 : OUT = INPUTA-INPUTB;
		2 : OUT = INPUTA&INPUTB;
		3 : OUT = INPUTA^INPUTB;
		4 : OUT = (INPUTA >= 144) ? 1 : 0;
		5 : OUT = (INPUTA[15:8] == INPUTB[7:0]) ? 1 : 0;
		6 : OUT = (INPUTA[7:0] == INPUTB[15:8]) ? 1 : 0;
		default: OUT = 0;
	endcase
	
	if (OP == 6)
	begin
		$display("Inputa : %d - Inputb : %d",INPUTA,INPUTB);
		$display("Out: %d",OUT);
	end
	
	if (OP == 1 && OUT == 0)
	begin
		$display("ZERO");
		ZERO = 1'b1;
	end
	else if (OP == 5 || OP == 6 || OP == 4)
	begin
		$display("OP %d | %d %d| %d",OP,INPUTA,INPUTB,OUT);
		ZERO = OUT;
	end
	else 
		ZERO = 1'b0;
	
	end

endmodule
