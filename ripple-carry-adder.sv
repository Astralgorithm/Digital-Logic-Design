module full_adder(input logic a, b, cin, output logic sum, cout);
  
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (a & cin) | (b & cin);

endmodule

module rca(input logic [3:0] a, b, input logic cin, output logic [4:0] sum);

  wire c1, c2, c3;

  full_adder FA0(a[0], b[0], cin, sum[0], c1);
  full_adder FA1(a[1], b[1], c1, sum[1], c2);
  full_adder FA2(a[2], b[2], c2, sum[2], c3);
  full_adder FA3(a[3], b[3], c3, sum[3], sum[4]);

endmodule