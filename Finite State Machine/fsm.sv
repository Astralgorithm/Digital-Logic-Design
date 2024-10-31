module FSM (clk, reset, left, right, L1, L2, L3, R1, R2, R3);

   input logic  clk;
   input logic  reset;
   input logic 	left, right;
   
   output logic L1, L2, L3, R1, R2, R3;

   typedef enum 	logic [3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9} statetype; 
    // Default/Reset: S0; 
    // L:     S1, S2, S3
    // R:     S4, S5, S6
    // L & R: S7, S8, S9
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
         L1 <= 1'b0; // L 000 
         L2 <= 1'b0; //   321
         L3 <= 1'b0;   
         R1 <= 1'b0; // R 000
         R2 <= 1'b0; //   123
         R3 <= 1'b0;         
         if (~left & ~right) nextstate <= S0;
         else if (left & ~right) nextstate <= S1;
         else if (right & ~left) nextstate <= S4;
         else if (left & right) nextstate <= S7;
       end

       S1: begin
         L1 <= 1'b1; // L 001
         L2 <= 1'b0;
         L3 <= 1'b0;   
         R1 <= 1'b0; // R 000
         R2 <= 1'b0;
         R3 <= 1'b0;
         nextstate <= S2;
       end

       S2: begin
	       L1 <= 1'b1; // L 011
         L2 <= 1'b1;
         L3 <= 1'b0;   
         R1 <= 1'b0; // R 000
         R2 <= 1'b0;
         R3 <= 1'b0;
         nextstate <= S3;
       end

       S3: begin
	       L1 <= 1'b1; // L 111
         L2 <= 1'b1;
         L3 <= 1'b1;   
         R1 <= 1'b0; // R 000
         R2 <= 1'b0;
         R3 <= 1'b0;
         nextstate <= S0;
       end

       S4: begin
	       L1 <= 1'b0; // L 000
         L2 <= 1'b0;
         L3 <= 1'b0;   
         R1 <= 1'b1; // R 100
         R2 <= 1'b0;
         R3 <= 1'b0;  	  
	       nextstate <= S5;
       end

       S5: begin
	       L1 <= 1'b0; // L 000
         L2 <= 1'b0;
         L3 <= 1'b0;   
         R1 <= 1'b1; // R 110
         R2 <= 1'b1;
         R3 <= 1'b0;  	  	  
	       nextstate <= S6;
       end

       S6: begin
	       L1 <= 1'b0; // L 000
         L2 <= 1'b0;
         L3 <= 1'b0;   
         R1 <= 1'b1; // R 111
         R2 <= 1'b1;
         R3 <= 1'b1;  	  	  
	       nextstate <= S0;
       end

        // To Do: For the next 3, LR; As above just simultaneously.
       S7: begin
	       L1 <= 1'b1; // L 001 
         L2 <= 1'b0; //   321
         L3 <= 1'b0;   
         R1 <= 1'b1; // R 001
         R2 <= 1'b0; //   123
         R3 <= 1'b0;  	  
	       nextstate <= S8;
       end

       S8: begin
	     L1 <= 1'b1; // L 011 
         L2 <= 1'b1; //   321
         L3 <= 1'b0;   
         R1 <= 1'b1; // R 011
         R2 <= 1'b1; //   123
         R3 <= 1'b0;   	  
	       nextstate <= S9;
       end

       S9: begin
	       L1 <= 1'b1; // L 111 
         L2 <= 1'b1; //   321
         L3 <= 1'b1;   
         R1 <= 1'b1; // R 111
         R2 <= 1'b1; //   123
         R3 <= 1'b1;  	  	  
	       nextstate <= S0;
       end

       default: begin
         L1 <= 1'b0; // L 000 
         L2 <= 1'b0; //   321
         L3 <= 1'b0;   
         R1 <= 1'b0; // R 000
         R2 <= 1'b0; //   123
         R3 <= 1'b0; 	  	  
         nextstate <= S0;
       end
     endcase
endmodule
