`timescale 1ns / 1ps
module tb ();

   logic a;
   logic b;
   logic c;
   logic sum;
   logic cout;
   logic clk;   
   
  // instantiate device under test
   full_adder dut (a, b, c, sum, cout);

   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end


   initial
     begin
    
	#20  a = 0;	
	#0   b = 0;	
	#0   c = 0;

	#20  a = 0;	
	#0   b = 0;	
	#0   c = 1;

	#20  a = 0;	
	#0   b = 1;	
	#0   c = 0;	

	#20  a = 0;	
	#0   b = 1;	
	#0   c = 1;	

	#20  a = 1;	
	#0   b = 0;	
	#0   c = 0;	

	#20  a = 1;	
	#0   b = 0;	
	#0   c = 1;	

	#20  a = 1;	
	#0   b = 1;	
	#0   c = 0;	

	#20  a = 1;	
	#0   b = 1;	
	#0   c = 1;		
	
     end

   
endmodule
