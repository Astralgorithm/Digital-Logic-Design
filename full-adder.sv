module full_adder(input logic a, b, c, output logic sum, cout);
  
  assign sum = a ^ b ^ c;
  assign cout = (a & b) | (a & c) | (b & c);

endmodule
