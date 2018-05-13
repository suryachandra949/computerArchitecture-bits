module execution_unit(input [7:0] EX_ID_Rsdata_out,EX_ID_Rddata_out,
  input [2:0] EX_ID_Rs_out,EX_ID_Rd_out,
  input EX_ID_write_mux_out,EX_ID_regWrite_out,
  input [1:0] ctrl,
  input [7:0] WB_mux_out,
  output [7:0] ALU_out,
  output [7:0] EX_WB_Rsdata_in,
  output [2:0] EX_WB_Rd_in,
  output EX_WB_write_mux_in,EX_WB_regWrite_in
   );
   
   wire [7:0] Rddata_alu;
   
   
   assign EX_WB_Rd_in = EX_ID_Rd_out;
   assign {EX_WB_write_mux_in,EX_WB_regWrite_in} = {EX_ID_write_mux_out,EX_ID_regWrite_out};
   
   assign EX_WB_Rsdata_in = (ctrl[0]) ? WB_mux_out : EX_ID_Rsdata_out;
   
   assign Rddata_alu = (ctrl[1]) ? WB_mux_out : EX_ID_Rddata_out;
   
   assign ALU_out = Rddata_alu << EX_ID_Rs_out;
   
 endmodule
   
   
   
  
  
  