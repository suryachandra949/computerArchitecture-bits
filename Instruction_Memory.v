`timescale 1ns / 1ps
module Instruction_Memory(
  input [7:0] pc,
  input reset,
  output [7:0] Instruction_Code);

reg [7:0] Mem[0:27];




assign Instruction_Code = {Mem[pc]};

always@(reset)
begin

if(reset ==0)
begin
$readmemh("instructions.mem",Mem);
end
end
endmodule