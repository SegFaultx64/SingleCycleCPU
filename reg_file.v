`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:09 10/27/2011 
// Design Name: 
// Module Name:    reg_file 
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
module reg_file(
	 input wire CLK,
	 input wire RegWrite,
    input wire [15:0] srcA,
    input wire [15:0] srcB,
    input wire [15:0] writeReg,
    input wire [15:0] writeValue,
	 
    output [15:0] ReadA,
    output [15:0] ReadB
    );
	 
reg [15:0] registers[15:0];

assign ReadA = registers[srcA];
assign ReadB = registers[srcB];

always @ (posedge CLK)
begin
  if (RegWrite)
  begin
    registers[writeReg] <= writeValue;
		$display("Register write %d = %d",writeReg,writeValue);
  end
end

endmodule
