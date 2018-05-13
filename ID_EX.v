module ID_EX(input clock,reset,input [7:0] EX_ID_Rsdata_in,EX_ID_Rddata_in,
  input [2:0] EX_ID_Rs_in,
  input [2:0] EX_ID_Rd_in,
  input write_value_mux,regWrite,
  output reg [7:0] EX_ID_Rsdata_out,EX_ID_Rddata_out,
  output reg [2:0] EX_ID_Rs_out,EX_ID_Rd_out,
  output reg EX_ID_write_mux_out,EX_ID_regWrite_out
  );

  
  always@(negedge reset, posedge clock)
  begin
    if(reset == 0)
      begin
        {EX_ID_Rsdata_out,EX_ID_Rddata_out,EX_ID_Rs_out,EX_ID_Rd_out} <= 22'b0;
        {EX_ID_write_mux_out,EX_ID_regWrite_out} <=2'b0;
      end
    else
      begin
        {EX_ID_Rsdata_out,EX_ID_Rddata_out,EX_ID_Rs_out,EX_ID_Rd_out} <={EX_ID_Rsdata_in,EX_ID_Rddata_in,EX_ID_Rs_in,EX_ID_Rd_in};
        {EX_ID_write_mux_out,EX_ID_regWrite_out} <= {write_value_mux,regWrite};
      end
    
  end
endmodule
  

  