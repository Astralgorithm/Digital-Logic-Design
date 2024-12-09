module FSM (clk, reset, start, not64, s, en1, en2);
    input logic clk;
    input logic reset;
    input logic start;

    input logic not64;

    output logic s, en1, en2;

    typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
    statetype state, nextstate;

    // state register
    always_ff @( posedge clk, posedge reset ) 
        if (reset) state <= S0;
        else state <= nextstate;

        always_comb 
            case (state)
                S0: begin
                    s = 1'b0;
                    en1 = 1'b0;
                    en2 = 1'b0;
                    if (start) nextstate = S1;
                    else nextstate = S0;
                end
                
                S1: begin
                    s = 1'b0;
                    en1 = 1'b1;
                    en2 = 1'b0;
                    
                    nextstate = S2;
                end

                S2: begin
                    s = 1'b1;
                    en1 = 1'b1;
                    en2 = 1'b0;
                    if (not64) nextstate = S2;
                    else nextstate = S3;
                end

                S3: begin
                    s = 1'b0;
                    en1 <= 1'b0;
                    en2 <= 1'b1;
                    if (start) nextstate = S3;
                    else nextstate <= S0;
                end

                default: begin
                    s = 1'b0;
                    en1 = 1'b0;
                    en2 = 1'b0;
                    nextstate <= S0;
                end
            endcase
endmodule