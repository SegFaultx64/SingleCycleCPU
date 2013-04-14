`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:
//
// Create Date:    19:25:24 11/16/2006
// Design Name:
// Module Name:    DataRAM
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
module DataRAM(DataAddress, MemWriteIndex, ReadMem, WriteMem, DataIn, DataOut, CLK);
    input CLK;

    input [15:0] DataAddress;
	 input [15:0] MemWriteIndex;
    input ReadMem;
    input WriteMem;
    input [15:0] DataIn;

    output [15:0] DataOut;
    reg [15:0] DataOut;

    reg [15:0] my_memory [0:255];

    initial begin
        $readmemh("dataram_init.list", my_memory);
    end

    always @ (ReadMem or DataAddress)
	 begin
        if(ReadMem) begin
				$display("Reading from address %d val: %d",DataAddress,my_memory[DataAddress]);
            DataOut = my_memory[DataAddress];
        end else begin
				$display("Reading FUCKING BULLSHIT %d",16'bZ);
            DataOut = 16'bZ;
        end
	  end

    always @ (posedge CLK)
        if(WriteMem) begin
				$display("Memory write %d = %d",MemWriteIndex,DataIn);
            my_memory[MemWriteIndex] = DataIn;
        end

endmodule
