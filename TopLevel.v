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
	input Init,
	input CLK,
	input Program
	//output reg [15:0] PC
    );

	// control signals
	wire [2:0] ReadReg1;
	wire [2:0] ReadReg2;
	wire [3:0] WriteReg;
	wire [2:0] RegWriteData;
	wire [2:0] ALU1arg2;
	wire [1:0] MemRead;
	wire [1:0] MemWriteIndexController;
	wire [1:0] MemWriteData;
	wire [2:0] BranchDest;
	wire UsuallyZero;
	wire RegWriteFlag;
	wire MemReadFlag;
	wire MemWriteFlag;
	wire [2:0] ALUop1;
	wire [2:0] ALUop2;
	wire [2:0] ALUop3;
	wire [2:0] ALUop4;
	wire [2:0] ALUop5;
	wire Halt;
	wire IfDoneFlag;
	wire SkipIfNot1Flag;
	 
	// Decoder outputs
	wire [3:0] Opcode;
	wire [15:0] Instruction1to0;
	wire Bit1;
	wire Bit0;
   wire [15:0] Instruction5to2;
   wire [15:0] Instruction5to1;
   wire [15:0] Instruction5to0;

	// ALU outputs
	wire ALU1Zero, ALU2Zero, ALU3Zero, ALU4Zero, ALU5Zero, ALU6Zero;
	wire [15:0] ALU1Out;
	wire [15:0] ALU2Out;
	wire [15:0] ALU3Out;
	wire [15:0] ALU4Out;
	wire [15:0] ALU5Out;
	wire [15:0] ALU6Out;

	// ALU inputs
	wire [15:0] ALU1Input2;

	// Data mem wires
	wire [15:0] MemOut;
	wire [15:0] MemReadIndex;
	wire [15:0] MemWriteIndex;
	wire [15:0] MemWriteInput;

	// Register File
	// Out
	wire [15:0] ReadA;
	wire [15:0] ReadB;
	// In
	wire [15:0] RegInputIndex;
	wire [15:0] RegInputData;
	wire [15:0] srcA;
	wire [15:0] srcB;

	// word matcher wires
	wire [15:0] WordMatcherOut;

	/// branching wires
	wire [15:0] BranchStage1;
	wire [15:0] BranchStage2;
	wire [15:0] BranchStage3;

	// PC wires
	wire [15:0] PC;

	//Instruction Rom wires
	wire [9:0] InstRom1Out;
	wire [9:0] InstRom2Out;
	wire [9:0] Instruction;

	// instruction ROM1
	InstROM1 inst_module1(
	.InstAddress(PC), 
	.InstOut(InstRom1Out)
	);
	
	// instruction ROM2
	InstROM2 inst_module2(
	.InstAddress(PC), 
	.InstOut(InstRom2Out)
	);
	
	// The Decoder
	Decoder decoder (
	.Opcode(Opcode),
	.Instruction(Instruction),
	.OneToZero(Instruction1to0),
	.Bit1(Bit1),
	.Bit0(Bit0),
	.FiveToTwo(Instruction5to2),
	.FiveToOne(Instruction5to1),
	.FiveToZero(Instruction5to0)
	);

	/*
	 HERE BE MUXES
	*/
	
	// Select which program to run Mux
	Mux_RomSelect rom_mux (
	.Selection(Program),
	.Input1(InstRom1Out),
	.Input2(InstRom2Out),
	.Output(Instruction)
	);

	// Select the first source register
	Mux_RegSrc1 srcA_mux (
		.Input(Instruction5to2),
		.Output(srcA),
		.Selection(ReadReg1)
	);
	
	// Select the second source register
	Mux_RegSrc2 srcB_mux (
		.Input1(Instruction5to0),
		.Input2(Instruction5to2),
		.Output(srcB),
		.Selection(ReadReg2)
	);

	// Select the destination register
	Mux_RegDest writeReg_mux (
		.Input(Instruction5to2),
		.Output(RegInputIndex),
		.Selection(WriteReg)
	);

	// Select the data to be written to the register
	Mux_RegInData writeValue_mux (
		.Input1(ALU1Out),
		.Input2(Instruction5to0),
		.Input3(MemOut),
		.Input4(Instruction1to0),
		.PC(ALU6Out),
		.Selection(RegWriteData),
		.Output(RegInputData)
	);

	// ALU1 input 2 selection
	Mux_ALU1In2 alu1Input_mux (
		.Input1({15'b0, Bit1}),
		.Input2(ReadB),
		.Input3(MemOut),
		.Selection(ALU1arg2),
		.Output(ALU1Input2)
	);

	// Select mem address to read from
	Mux_2Bit memReadIndex_mux (
		.Input1(ReadA),
		.Input2(Instruction5to0),
		.Input3(ReadB),
		.Selection(MemRead),
		.Output(MemReadIndex)
	);

	// Select Mem address to write to
	Mux_MemDest memDest_mux (
		.Input(ReadA),
		.Output(MemWriteIndex),
		.Selection(MemWriteIndexController)
	);

	// select data to write to memory
	Mux_MemInData memInput_mux (
		.Input1(ReadB),
		.Input2(Instruction5to0),
		.Output(MemWriteInput),
		.Selection(MemWriteData)
	);

	// select branch address
	Mux_BranchSelect branchSelect_mux (
		.Input1(ALU6Out),
		.Input2(Instruction5to1),
		.Input3(ReadA),
		.Input4(WordMatcherOut),
		.Output(BranchStage1),
		.Selection(BranchDest)
	);

	// select if greater than 144
	Mux_1Bit branchSubSelect1_mux (
		.Input1(BranchStage1),
		.Input2(ALU6Out),
		.Selection(~ALU1Zero & IfDoneFlag),
		.Output(BranchStage2)
	);

	// select if not one
	Mux_1Bit branchSubSelect2_mux (
		.Input1(BranchStage2),
		.Input2(ALU6Out),
		.Selection(ALU5Zero & SkipIfNot1Flag),
		.Output(BranchStage3)
	);

	// the word matcher
	WordMatcher  wordMatcher (
		.FullMatch(ALU1Zero),
		.FirstHalf(ALU4Zero),
		.SecondHalf(ALU3Zero),
		.Flag(Bit0),
		.Output(WordMatcherOut)
	);

	/*
	 Here be non-muxes
	*/

	// ALUs:

	ALU alu1 (
		.INPUTA(ReadA),
		.INPUTB(ALU1Input2),
		.OP(ALUop1),
		.OUT(ALU1Out),
		.ZERO(ALU1Zero)
	);

	ALU alu2 (
		.INPUTA(ReadB),
		.INPUTB(2),
		.OP(ALUop2),
		.OUT(ALU2Out),
		.ZERO(ALU2Zero)
	);


	ALU alu3 (
		.INPUTA(MemOut),
		.INPUTB(ReadA),
		.OP(ALUop3),
		.OUT(ALU3Out),
		.ZERO(ALU3Zero)
	);


	ALU alu4 (
		.INPUTA(MemOut),
		.INPUTB(ReadA),
		.OP(ALUop4),
		.OUT(ALU4Out),
		.ZERO(ALU4Zero)
	);


	ALU alu5 (
		.INPUTA(ReadA),
		.INPUTB(1),
		.OP(ALUop5),
		.OUT(ALU5Out),
		.ZERO(ALU5Zero)
	);


	ALU alu6 (
		.INPUTA(PC),
		.INPUTB(1),
		.OP(0),
		.OUT(ALU6Out),
		.ZERO(ALU6Zero)
	);

	// ALUs fin



	// Control module
	Control control_module (
		// Inputs
		.Opcode(Opcode),
		.ReadI1WriteI(Instruction5to2),
		.FiveToOne(Instruction5to1),
		.ReadI2WriteDWriteData(Instruction5to0),
		.OneToZero(Instruction1to0),
		.Arg2(Bit1),
		.Bit0(Bit0),
		// Outputs
		.ReadReg1(ReadReg1),
		.ReadReg2(ReadReg2),
		.WriteReg(WriteReg),
		.RegWriteData(RegWriteData),
		.ALU1arg2(ALU1arg2),
		.MemRead(MemRead),
		.MemWriteIndex(MemWriteIndexController),
		.MemWriteData(MemWriteData),
		.BranchDest(BranchDest),
		.UsuallyZero(UsuallyZero),
		.RegWriteFlag(RegWriteFlag),
		.MemReadFlag(MemReadFlag),
		.MemWriteFlag(MemWriteFlag),
		.ALUop1(ALUop1),
		.ALUop2(ALUop2),
		.ALUop3(ALUop3),
		.ALUop4(ALUop4),
		.ALUop5(ALUop5),
		.Halt(Halt),
		.SkipIfNot1Flag(SkipIfNot1Flag),
		.IfDoneFlag(IfDoneFlag)
	);


	reg_file register_module (
		.CLK(CLK), 
		.RegWrite((~ALU2Zero & UsuallyZero) | RegWriteFlag), 
		.srcA(srcA), //concatenate with 0 to give us 4 bits
		.srcB(srcB), 
		.writeReg(RegInputIndex), 	  // mux above
		.writeValue(RegInputData), 
		.ReadA(ReadA), 
		.ReadB(ReadB)
	);

	DataRAM Data_Module(
		.DataAddress(MemReadIndex),
		.MemWriteIndex(MemWriteIndex),		
		.ReadMem(MemReadFlag), 
		.WriteMem(MemWriteFlag), 
		.DataIn(MemWriteInput), 
		.DataOut(MemOut), 
		.CLK(CLK)
	);

	// Program counter

	PC program_counter(
		.Target(BranchStage3),
		.Init(Init),
		.Halt(Halt),
		.CLK(CLK),
		.Count(PC)
	);
	
	// might help debug
	
	/*
	always@(MemReadFlag)
	begin 
	$display("MemReadFlag = %d",MemReadFlag);
	end

	always@(MemOut)
	begin 
	$display("MemOut = %d",MemOut);
	end
	
	always@(CLK)
	begin
	$display("Instruction5to0 - %d",Instruction5to0);
	end
	
	always@(MemReadIndex)
	begin 
	$display("MemReadIndex = %d",MemReadIndex);
	end
	*/
	always@(PC)
	begin
	$display("BranchDest - %d",BranchDest);
	$display("BranchStage1 - %d",BranchStage1);
	$display("BranchStage2 - %d",BranchStage2);
	$display("BranchStage3 - %d",BranchStage3);
	end 
	/*
	always@(ReadA)
	begin
	$display("Read A: %d",ReadA);
	$display("Src A: %d",srcA);
	end
	*/
	

endmodule