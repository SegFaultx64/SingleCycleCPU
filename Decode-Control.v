`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:48 04/07/2013 
// Design Name: 
// Module Name:    Control
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
module Control(

		input [3:0] Opcode,
		input [3:0] ReadI1WriteI,
		input [4:0] FiveToOne,
		input [5:0] ReadI2WriteDWriteData,
		input [1:0] OneToZero,
		input Arg2,
		input Bit0,
		output reg [2:0] ReadReg1,
		output reg [2:0] ReadReg2,
		output reg [3:0] WriteReg,
		output reg [2:0] RegWriteData,
		output reg [2:0] ALU1arg2,
		output reg MemRead,
		output reg [1:0] MemWrite,
		output reg [1:0] MemWriteData,
		output reg [2:0] BranchDest,
		output reg UsuallyZero,
		output reg RegWriteFlag,
		output reg MemReadFlag,
		output reg MemWriteFlag,
		output reg [2:0] ALUop1,
		output reg [2:0] ALUop2,
		output reg [2:0] ALUop3,
		output reg [2:0] ALUop4,
		output reg [2:0] ALUop5
    );

	always @(Opcode)
		begin

		case(Opcode)
			0 :						//result
			begin
			 ReadReg1 = 3;
			 ReadReg2 = 3;
			 WriteReg = 10;
			 if (FiveToOne == 1)
				begin
					ALU1arg2 = 3;
					RegWriteData = 0;
					RegWriteFlag = 1;
					BranchDest = 0;
				end
			 else if (FiveToOne == 2)
				begin
					RegWriteData = 0;
					ALU1arg2 = 4;
					RegWriteFlag = 1;
					BranchDest = 0;
				end
			 else if (FiveToOne == 3)
				begin
					RegWriteData = 5;
					RegWriteFlag = 1;
					BranchDest = 0;
				end
			 else if (FiveToOne == 4)
				begin
					BranchDest = 6;//set PC to 200 here (halt)
					RegWriteFlag = 0;
				end
			 MemRead = 0;
			 MemWrite = 2;
			 MemWriteData = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 1;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 UsuallyZero = 0;
			end
			1 :						//setImmediate
			begin
			//param[1] isnt going anywhere atm, it needs to go to RegWriteData
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 RegWriteData = 7;
			 WriteReg = 0;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 UsuallyZero = 0;
			end
			2 :						//loadQuery
			begin
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 WriteReg = 5;
			 RegWriteData = 1;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 UsuallyZero = 0;
			end
			3 :						//compare
			begin
			 ReadReg1 = 3;
			 ReadReg2 = 2;
			 RegWriteData = 2;
			 WriteReg = 11;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 5;
			 RegWriteFlag = 1;
			 MemReadFlag = 1;
			 MemWriteFlag = 0;
			 ALUop1 = 1;
			 ALUop2 = 0;
			 ALUop3 = 5;
			 ALUop4 = 6;
			 ALUop5 = 0;
			 UsuallyZero = 0;
			end
			4 :						//jumpBackOrInit
			begin
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 WriteReg = 4;
			 RegWriteData = 3;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 if (FiveToOne == 0)
				begin
					RegWriteFlag = 1;
					BranchDest = 0;
				end
			 else if (FiveToOne == 1)
				begin
					RegWriteFlag = 0;
					BranchDest = 2;
				end
			 else if (FiveToOne == 2)
				begin
					RegWriteFlag = 0;
					BranchDest = 3;
				end
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 UsuallyZero = 0;
			end
			5 :						//increment
			begin
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 WriteReg = 0;
			 RegWriteData = 0;
			 ALU1arg2 = 2;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 if (OneToZero == 0)
				ALUop1 = 0;//add
			 else
				ALUop1 = 1;//sub
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 UsuallyZero = 0;
			end
			6 :						//ifDone
			begin
			 ReadReg1 = 3;
			 ReadReg2 = 0;
			 WriteReg = 0;
			 RegWriteData = 0;
			 ALU1arg2 = 5;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 4;
			 RegWriteFlag = 0;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 UsuallyZero = 0;
			end
			7 :						//storeToZero
			begin
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 WriteReg = 0;
			 RegWriteData = 0;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 1;
			 MemWriteData = 1;
			 BranchDest = 0;
			 RegWriteFlag = 0;
			 MemReadFlag = 0;
			 MemWriteFlag = 1;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;

			end
			8 :						//setArg
			begin
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 if (Bit0 == 0)
				WriteReg = 6;
			 else
				WriteReg = 7;
			 RegWriteData = 0;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 UsuallyZero = 0;
			end
			9 :						//jumpOrInitFp
			begin
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 if (Bit0 == 0)	
				begin
					WriteReg = 1;
					RegWriteData = 7;
					BranchDest = 1;
				end
			 else
				begin
					WriteReg = 2;
					RegWriteData = 4;
					BranchDest = 0;
				end
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 UsuallyZero = 0;
			end
			10 :						//skipIfNotOne
			begin
			 if (Bit0 == 0)
				ReadReg1 = 4;
			 else
			   ReadReg1 = 5;
			 ReadReg2 = 0;
			 WriteReg = 0;
			 RegWriteData = 0;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 1;
			 RegWriteFlag = 0;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 1;//sub
			 UsuallyZero = 0;
				
			end
			11 : 						//push
			begin
			 ReadReg1 = 2;
			 ReadReg2 = 0;
			 WriteReg = 2;
			 RegWriteData = 0;
			 ALU1arg2 = 2;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 1;
			 BranchDest = 4;
			 RegWriteFlag = 0;//THIS IS SUPPOSED TO BE 0!!!!
			 MemReadFlag = 0;
			 MemWriteFlag = 1;
			 ALUop1 = 0;
			 ALUop2 = 1;//sub
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 UsuallyZero = 1;//THIS IS SUPPOSED TO BE 1!!!
			end
			12 :						//pop
			begin
			 ReadReg1 = 2;
			 ReadReg2 = 0;
			 WriteReg = 0;
			 RegWriteData = 2;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 1;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			end
			13 :						//setTemp
			begin
			 ReadReg1 = 0;
			 ReadReg2 = 0;
			 if (Bit0 == 0)
				WriteReg = 8;
			 else
				WriteReg = 9;
			 RegWriteData = 0;
			 ALU1arg2 = 0;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			 UsuallyZero = 0;
			end
			14 :						//return	
			begin
			 ReadReg1 = 6;
			 ReadReg2 = 4;
			 WriteReg = 3;
			 RegWriteData = 0;
			 if (Arg2 == 1)
			   ALU1arg2 = 1;
			 else
			   ALU1arg2 = 6;
			 MemRead = 0;
			 MemWrite = 0;
			 MemWriteData = 0;
			 BranchDest = 0;
			 RegWriteFlag = 1;
			 MemReadFlag = 0;
			 MemWriteFlag = 0;
			 ALUop1 = 0;
			 ALUop2 = 0;
			 ALUop3 = 0;
			 ALUop4 = 0;
			 ALUop5 = 0;
			end
			
		endcase
	end		
endmodule
