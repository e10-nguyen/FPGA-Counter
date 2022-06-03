module counter(clk, reset, enable, dir, count);
  input clk, reset, enable, dir;
  output reg[2:0] count;
  
  always @ (posedge clk && (enable == 1'b1)) begin // enable must be on in order for counting to begin
    if (reset == 1'b0) begin
      if (count == 3'b111 && dir == 1'b1) begin // 7 -> 0 when counting up
        count <= 3'b000;
      end
      else if (count == 3'b000 && dir == 1'b0) begin // 0 -> 7 when counting down
        count <= 3'b111;
      end
      else begin
        count <= (dir == 1'b1) ? count + 1'b1 : count - 1'b1;
      end
    end
    else begin
      count <= 3'b000;
    end
  end 
endmodule