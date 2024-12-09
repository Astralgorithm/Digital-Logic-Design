module counter64 (
    input  logic clk,        // Clock input
    input  logic rst,        // Reset input (active high)
    input  logic start,      // Start signal (activates counting)
    output logic [5:0] count // 6-bit counter output (counts from 0 to 63)
);

    // Internal enable signal for counting
    logic count_enable;

    // Always block to handle reset and counting
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 6'b000000;             // Reset counter to 0
            count_enable <= 1'b0;           // Disable counting on reset
        end else if (count_enable) begin
            if (count == 6'b111111) begin   // End of count
               count_enable <= 1'b0;
	       count <= 6'h0;	            // Reset count to 0
            end else begin
                count <= count + 1;         // Increment counter
            end
        end else if (start) begin
            count_enable <= 1'b1;           // Enable counting when start is high
        end
    end

endmodule
