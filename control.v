module control(input [1:0] opcode,output reg mux_jump,regWrite,write_value_mux,
  output reg ID_flush);
  always@(opcode)
  begin
    case(opcode)
      2'b11: {mux_jump,ID_flush,regWrite,write_value_mux} = 4'b110x;
      2'b00: {mux_jump,ID_flush,regWrite,write_value_mux} = 4'b0010;
      2'b01: {mux_jump,ID_flush,regWrite,write_value_mux} = 4'b0011;
    endcase
  end
endmodule
  