`timescale 1ns/100ps

module counter  (
                output logic [4:0] count,
                input  logic [4:0] data ,
                input  logic       clk  ,
                input  logic       load ,
                input  logic       enable ,
                input  logic       rst_   
                );

// if reset is zero, the design is shut down
always_ff @(posedge clk, negedge rst_)// set rst at negedge time clock to avoid race complict
   if (!rst_)
       count <= 0;
   else if (load)
       count <= data;
   else if (enable)
       count++;  

endmodule
