`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:37:58 02/16/2012 
// Design Name: 
// Module Name:    TopLevel 
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
module TopLevel(
    input start,
	 input CLK
    );

	// control signals not defined as outputs
	 wire ReadReg1, ReadReg2, WriteReg, RegWriteData, ALU1Arg2,
	 MemRead, MemWrite, MemWriteData, BranchDest, UsuallyZero,
	 RegWriteFlag, MemReadFlag, MemWriteFlag, ALUOp1, ALUOp2 ,
	 ALUOp3, ALUOp4, ALUOp5, ALUOp6;
	 
	 // Decoder outputs
	 wire [3:0] Opcode;
	 wire [1:0] Instruction1to0;
	 wire Bit1;
	 wire Bit0;
    wire [3:0] Instruction5to2;
    wire [4:0] Instruction5to1;
    wire [5:0] Instruction5to0;
	 
	 // ALU outputs
	 wire ALU1Zero, ALU2Zero, ALU3Zero, ALU4Zero, ALU5Zero;
	 wire [15:0] ALU1Out;
	 wire [15:0] ALU2Out;
	 wire [15:0] ALU3Out;
	 wire [15:0] ALU4Out;
	 wire [15:0] ALU5Out;
	 
	 // ALU inputs
	 wire [15:0] ALU1Input1;
	 wire [15:0] ALU1Input2;
	 wire [15:0] ALU2Input1;
	 wire [15:0] ALU2Input2;
	 wire [15:0] ALU3Input1;
	 wire [15:0] ALU3Input2;
	 wire [15:0] ALU4Input1;
	 wire [15:0] ALU4Input2;
	 wire [15:0] ALU5Input1;
	 wire [15:0] ALU5Input2;
	 wire [15:0] ALU6Input1;
	 wire [15:0] ALU6Input2;
	 
	 // Data mem wires
	 wire [15:0] MemOut;
	 wire [15:0] MemReadIndex;
	 wire [15:0] MemWriteIndex;
	 wire [15:0] MemWriteData;
	 
	 // Register File
	 // Out
	 wire [15:0] ReadA;
	 wire [15:0] ReadB;
	 // In
	 wire [15:0] RegWriteIndex;
	 wire [15:0] RegWriteData;
	 wire [3: 0] srcA;
	 wire [3: 0] srcB;

	 //assign regWriteValue = (MEM_TO_REG==1)?ALUOut:MemOut;
	 assign regWriteValue = ALUOut;
	 
	 // assign input to memory
	 assign memWriteValue = ReadB;
	 
	 // PC wires
	 wire [15:0] PC;
	 
	 //Instruction Rom wires
	 wire [15:0] InstRom1Out;
	 wire [15:0] InstRom2Out;
	 wire [15:0] Instruction;

	// instruction ROM1
	InstROM1 inst_module1(
	.InstAddress(PC), 
	.InstOut(InstRom1Out)
	);
	
	// instruction ROM2
	InstROM1 inst_module2(
	.InstAddress(PC), 
	.InstOut(InstRom2Out)
	);
	
	// Select which program to run Mux
	Mux_1Bit rom_mux (
	.Selection(0),
	.Input1(InstRom1Out),
	.Input2(InstRom2Out),
	.Output(Instruction)
	);
	
	Decoder decoder (
	.Opcode(Opcode),
	.Instruction(Instruction),
	.OneToZero(Instruction1to0),
	.Bit1(Bit1),
	.Bit0(Bit0),
	.FiveToTwo(Instruction5to2),
	.FiveToOne(Instruction5to1),
	.FiveToZero(Instuction5to0),
	)


	/* NOT DONE
	// Control module
	Control control_module (
		.OPCODE(Instruction[9:6]), 
		.ALU_OP(ALU_OP), 
		.ALU_SRC_B(ALU_SRC_B), 
		.REG_WRITE(REG_WRITE), 
		.BRANCH(BRANCH), 
		.MEM_WRITE(MEM_WRITE), 
		.MEM_READ(MEM_READ), 
		.REG_DST(REG_DST), 
		.MEM_TO_REG(MEM_TO_REG), 
		.HALT(halt)
	);
	*/


	reg_file register_module (
		.CLK(CLK), 
		.RegWrite(WriteReg), 
		.srcA(srcA), //concatenate with 0 to give us 4 bits
		.srcB(srcB), 
		.writeReg(RegWriteIndex), 	  // mux above
		.writeValue(RegWriteData), 
		.ReadA(ReadA), 
		.ReadB(ReadB)
	);
	
	/* NOT DONE
	ALU ALU_Module (
		.OP(ALU_OP), 
		.INPUTA(ReadA), 
		.INPUTB(ALUInputB), 
		.OUT(ALUOut), 
		.ZERO(ZERO), 
		.EQUAL(EQ)
	);
	*/

	DataRAM Data_Module(
		.DataAddress(MemReadIndex), 
		.ReadMem(MemRead), 
		.WriteMem(MemMWrite), 
		.DataIn(MemWriteData), 
		.DataOut(MemOut), 
		.CLK(CLK)
	);
	
	// might help debug
	/*
	always@(SE_Immediate)
	begin 
	$display("SE Immediate = %d",SE_Immediate);
	end
	*/
	
	// Todo this duplicates PC functionality
	always@(posedge CLK)
	if (start == 1)
		InstCounter = 0;
	else if(halt == 0)
		InstCounter = InstCounter+1;

endmodule