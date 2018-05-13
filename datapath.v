module datapath(input clock,reset);
  
  wire [7:0] Instruction_Code;
  wire mux_jump,ID_flush;
  wire [7:0] IF_ID_inst_code_out;
  wire [2:0] write_reg_num;
  wire [7:0] WB_mux_out,EX_ID_Rsdata_in,EX_ID_Rddata_in;
  wire writeRegWB_path,write_value_mux,regWrite;
  wire [7:0] EX_ID_Rsdata_out,EX_ID_Rddata_out;
  wire [2:0] EX_ID_Rs_out,EX_ID_Rd_out;
  wire EX_ID_write_mux_out,EX_ID_regWrite_out;
  wire [1:0] ctrl;
  wire [7:0] ALU_out,EX_WB_Rsdata_in;
  wire [2:0] EX_WB_Rd_in;
  wire EX_WB_write_mux_in,EX_WB_regWrite_in;
  wire [2:0] EX_WB_Rd_out;
  wire EX_WB_regWrite_out,EX_WB_write_mux_out;
  wire [7:0] ALU_WB_out,EX_WB_Rsdata_out;
  
  Instruction_Fetch X1(clock,reset,mux_jump,IF_ID_inst_code_out[5:0],Instruction_Code);
  
 
  
  IF_ID X3(clock,reset,Instruction_Code,ID_flush,IF_ID_inst_code_out);
  
  Register_file X4(IF_ID_inst_code_out[2:0],IF_ID_inst_code_out[5:3],write_reg_num,
  WB_mux_out,EX_ID_Rsdata_in,EX_ID_Rddata_in,writeRegWB_path,reset);
  
  ID_EX X5(clock,reset,EX_ID_Rsdata_in,EX_ID_Rddata_in,IF_ID_inst_code_out[2:0],IF_ID_inst_code_out[5:3],
  write_value_mux,regWrite,EX_ID_Rsdata_out,EX_ID_Rddata_out,EX_ID_Rs_out,EX_ID_Rd_out,EX_ID_write_mux_out,EX_ID_regWrite_out);
  
  execution_unit X6(EX_ID_Rsdata_out,EX_ID_Rddata_out,EX_ID_Rs_out,EX_ID_Rd_out,EX_ID_write_mux_out,EX_ID_regWrite_out,
  ctrl,WB_mux_out,ALU_out,EX_WB_Rsdata_in,EX_WB_Rd_in,EX_WB_write_mux_in,EX_WB_regWrite_in);
  
  forward_unit X7(EX_ID_Rs_out,EX_ID_Rd_out,EX_WB_Rd_out,EX_WB_regWrite_out,ctrl);
  
  control X8(IF_ID_inst_code_out[7:6],mux_jump,regWrite,write_value_mux,ID_flush);
  
  EX_WB X9(clock,reset,ALU_out,EX_WB_Rsdata_in,EX_WB_Rd_in,EX_WB_write_mux_in,EX_WB_regWrite_in,
  ALU_WB_out,EX_WB_Rsdata_out, EX_WB_Rd_out,EX_WB_write_mux_out,EX_WB_regWrite_out);
  
  
  WB_path X10(ALU_WB_out,EX_WB_Rsdata_out, EX_WB_Rd_out,EX_WB_write_mux_out,EX_WB_regWrite_out,
  WB_mux_out,writeRegWB_path,write_reg_num);
  
endmodule
  
  
  