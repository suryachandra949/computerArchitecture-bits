module Register_file(input [2:0] Read_Reg_Num_1,input [2:0] Read_Reg_Num_2,input [2:0] Write_Reg_Num,
  input [7:0] Write_Data,
  output  [7:0] Read_Data_1,
  output  [7:0] Read_Data_2,
  input RegWrite,
  input reset);
  
  reg  [7:0] RegMemory[0:7];
  
  
  assign  Read_Data_1=RegMemory[Read_Reg_Num_1];
  assign  Read_Data_2=RegMemory[Read_Reg_Num_2];
  
  
  always@(RegWrite,Write_Data,Write_Reg_Num)
  begin
    if(RegWrite)
      RegMemory[Write_Reg_Num]<=Write_Data;
  end
      
  always@(negedge reset)
  
  begin
  $readmemh("register.mem",RegMemory);
  end
  
   
    
endmodule
        