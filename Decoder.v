//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Luke
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
`timescale 1ns/1ps
module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
 
//Internal Signals
wire   [3-1:0] ALU_op_o;
wire            ALUSrc_o;
wire           RegWrite_o;
wire           RegDst_o;
wire            Branch_o;

//Parameter
assign RegDst_o = (instr_op_i == 6'b000000)? 1'b1:1'b0;
assign RegWrite_o = (instr_op_i != 6'b000100&&instr_op_i != 6'b000101)? 1'b1:1'b0;
assign Branch_o = (instr_op_i == 6'b000100 || instr_op_i == 6'b000101)? 1'b1:1'b0;
assign ALUSrc_o = (instr_op_i == 6'b001010||instr_op_i == 6'b001011||instr_op_i == 6'b001000||instr_op_i == 6'b001111||instr_op_i == 6'b001101)? 1'b1:1'b0;

//Main function
// 010 => R-type
// 100 => addi
// 011 => beq
// 001 => bne
// 111 => slt

assign ALU_op_o = (instr_op_i == 6'b000000)? 3'b010: //R-type
                  (instr_op_i == 6'b001000)? 3'b100: //addi 
                  (instr_op_i == 6'b000100)? 3'b011: //beq
                  (instr_op_i == 6'b000101)? 3'b001: //bne
                  (instr_op_i == 6'b001011)? 3'b111://sltiu 
				  (instr_op_i == 6'b001010)? 3'b111:3'b001;//slti


endmodule





                    
                    