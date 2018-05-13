`timescale 1ns / 1ps
module Instruction_Fetch(input clk,input reset,
  
  input mux_jump, input [5:0] jump_adress,
  output [7:0] Instruction_Code
  );

wire [7:0] jump_extend,jump_adder;

reg [7:0] pc,pc_nex;
Instruction_Memory ins(pc,reset,Instruction_Code);

assign jump_extend = {jump_adress[5],jump_adress[5],jump_adress};

assign jump_adder = jump_extend + pc;



always @(posedge clk,negedge reset)
begin
if(reset ==0)
  begin
    
    pc =0;
    pc_nex = pc +1;
    
    
  end
else
  begin
    pc = (mux_jump) ? jump_adder : pc_nex;
    pc_nex = pc +1;
  end
end
  
endmodule