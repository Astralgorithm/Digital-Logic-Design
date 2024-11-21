`timescale 1ns/1ps
module stimulus;

    parameter MSG_SIZE = 120;   
 
    logic [MSG_SIZE-1:0] message;   
    logic [255:0] hashed;

    logic 	 clk;
    logic   reset;
    logic   start;

    logic [31:0]  errors;
    logic [31:0]  vectornum;
    logic [255:0]  result;
    logic [7:0] 	 op;
    // Size of [351:0] is size of vector in file: 96 + 256 = 352 bits
    logic [351:0] testvectors[511:0];

    integer handle3;
    integer desc3;
    integer i;
    integer j;
 
    top #(MSG_SIZE, 512) dut (clk, reset, start, message, hashed);
 
    // 1 ns clock
    initial 
        begin	
            clk = 1'b1;
            forever #5 clk = ~clk;
        end
 
    initial
        begin
            handle3 = $fopen("sha256.out");
            $readmemh("sha256.tv", testvectors);       
            vectornum = 0;
            errors = 0;             
            desc3 = handle3;
        end
 
    // apply test vectors on rising edge of clk
    always @(posedge clk)
        begin
            #1 message = 120'h48656c6c6f2c205348412d32353621; // Message: "Hello, SHA-256!"
            #0 result = 256'hd0e8b8f11c98f369016eb2ed3c541e1f01382f9d5b3104c9ffd06b6175a46271; // Expected result
        end
 
    initial
        begin
            #0 reset = 1'b1;
            #21 reset = 1'b0;
            #0 start = 1'b1;
        end    
endmodule // Stimulus