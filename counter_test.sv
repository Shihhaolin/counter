`timescale 1ns/100ps

module counter_test;

 localparam WIDTH=5;
 `define PERIOD 10ns/1ns
 
  logic  clk = 1'b1;

 always 
    #(`PERIOD/2) clk =~clk;

 logic [WIDTH-1:0] count;
 logic [WIDTH-1:0] data ;
 logic             load ;
 logic             enable;
 logic             rst_ ;   

 counter DUT(.count(count), .data(data), .clk(clk), .load(load), .enable(enable), .rst_(rst_));

 initial 
 begin
     $timeformat(-9,0,"ns");
     $monitor("%t data=%0h load=%0h enable=%0h rst_=%0h clk=%0b count=%0h",
      $time, data, load, enable, rst_, clk, count);
       
 end



task  countexpect(input logic [WIDTH-1:0] expectvalue);
   if(count !== expectvalue)
   begin
   $display("COUNTER TEST FAILED");
   $display("expect=%0h, actual=%0h", expectvalue, count);
   $finish;
   end
endtask


initial begin
  @(negedge clk)
  data='hX; load=0; enable=0; rst_=0;@(negedge clk) countexpect('h0);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h1);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h2);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h3);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h4);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h5);
  data='hA; load=1; enable=0; rst_=1;@(negedge clk) countexpect('hA);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('hB);
  data='hE; load=1; enable=0; rst_=1;@(negedge clk) countexpect('hE);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('hF);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h10);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h11);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h12);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h13);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h14);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h15);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h16);
  data='h1C; load=1; enable=0; rst_=1;@(negedge clk) countexpect('h1C);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h1D);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h1E);
  data='hX; load=0; enable=1; rst_=1;@(negedge clk) countexpect('h1F);
$display("COUNTER TEST PASSED");
$finish;
end

endmodule