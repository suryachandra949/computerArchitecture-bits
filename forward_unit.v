module forward_unit(input [2:0] EX_ID_Rs_out,EX_ID_Rd_out,EX_WB_Rd_out,
  input EX_WB_regWrite,output reg [1:0] ctrl);
  always@(EX_WB_regWrite,EX_WB_Rd_out,EX_ID_Rs_out,EX_ID_Rd_out)
  begin
    if ( EX_WB_regWrite==1)
      begin
        ctrl[0] = (EX_WB_Rd_out == EX_ID_Rs_out) ? 1 : 0;
        ctrl[1] = (EX_WB_Rd_out == EX_ID_Rd_out) ? 1 : 0;
      end
    else
      ctrl = 2'b0;
  end
endmodule
        

      
  