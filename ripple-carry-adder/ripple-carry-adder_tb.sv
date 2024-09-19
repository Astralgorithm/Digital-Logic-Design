`timescale 1ns / 1ps
module tb ();

   logic [3:0] a;
   logic [3:0] b;
   logic cin;
   logic [4:0] sum, Sum_correct;
   logic clk;   
   
  // instantiate device under test
   rca dut (a, b, cin, sum); // sv module: rca(input [3:0] a, b , output [4:0] sum, output cout);
	assign Sum_correct = a + b + cin;
   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end

	integer handle3;
	integer desc3;
	integer i;

	initial
		begin
			handle3 = $fopen("rca.out");
			desc3 = handle3;
			#1250 $finish;
		end
	initial
		begin
			for (i=0; i < 128; i=i+1)
				begin
				// Put vectors before beginning of clk
				@(posedge clk)
					begin
					a = $random;
					b = $random;
					cin = 1'b0;
					end
				@(negedge clk)
					begin
					$fdisplay(desc3, "%h %h || %h | %h | %b", b, a, sum, Sum_correct, (sum == Sum_correct));
					end
			end // @(negedge clk)
		end


   
endmodule
