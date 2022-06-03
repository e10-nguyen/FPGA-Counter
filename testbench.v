
module testbench();
  // Generate the clock signal
  reg clk;
  parameter CLK = 10;
  
  always begin
    #(CLK) clk = ~clk;
  end
  
  reg rst;
  reg enable;
  reg dir;
  wire [2:0] count;
  wire [6:0] lights;
  
  // Instantiate the DUT
  counter DUT(.clk(clk), .reset(rst), .enable(enable), .dir(dir), .count(count));
  display LED(.count(count), .lights(lights));
  initial begin
    
    clk = 0; //Initialize clk and rst
    rst = 1; // Demonstrate behavior when rst = 1
    enable = 1;
    dir = 1;
    
    #(4*CLK + 3) rst = 0; // Turn off rst to enable counting
    
    @(posedge clk); // Demonstrate counting and wrap-around to 0
    #(2*CLK*12);
    
    # (2*CLK*12);
    
    @(posedge clk);
    #(2*CLK*4);
    $stop;
  end
endmodule