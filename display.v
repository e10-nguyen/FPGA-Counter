
module display(count, lights);
  input [2:0] count;
  output reg[6:0] lights;
  always @(*) // to be aware that the inputs are changed
  if (count == 3'b000) begin lights = 7'b1111110; end
  else if (count == 3'b001) begin lights = 7'b0110000; end
  else if (count == 3'b010) begin lights = 7'b1101101; end
  else if (count == 3'b011) begin lights = 7'b1111001; end
  else if (count == 3'b100) begin lights = 7'b0110011; end
  else if (count == 3'b101) begin lights = 7'b1011011; end
  else if (count == 3'b110) begin lights = 7'b1011111; end
  else if (count == 3'b111) begin lights = 7'b1110000; end
endmodule
  