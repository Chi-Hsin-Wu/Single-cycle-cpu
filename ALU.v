//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
`timescale 1ns/1ps
module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input signed [32-1:0]  src1_i;
input signed [32-1:0]  src2_i;
input  [4-1:0]   ctrl_i;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
wire             zero_o;
//Parameter
assign zero_o = result_o ;
//Main function
always @(ctrl_i,src1_i,src2_i)begin
 case (ctrl_i)
  4'b0000:result_o<= src1_i&src2_i;                                //and 0
  4'b0001:result_o<= src1_i|src2_i;                        //or 1
  4'b0010:result_o<=src1_i+src2_i;                           //addu 2
  4'b0100:result_o<= (src1_i == src2_i)? 32'b1:32'b0;            //beq
  4'b0101:result_o<= (src1_i < src2_i)? 32'b1:32'b0;           //sltiu 5
  4'b0110:result_o<=src1_i-src2_i;                           //subu 6
  4'b0111:result_o<= (src1_i < src2_i)? 32'b1:32'b0;            //slti 7
  4'b1000:result_o[31:0]<= src1_i[31:0] + src2_i[31:0];      //addi 8
  4'b1010:result_o<= (src1_i == src2_i)? 32'b0:32'b1;        //bne
  default: result_o<= 0;
	//default: result_o<=0;
  endcase
end

endmodule





                    
                    