module full_adder(s,cout,a,b,cin);
  
  output s,cout;
  input a,b,cin;
  
  wire x1,x2,x3,x4;
  
  assign x1= a ^ b;
  assign x2= x1 ^ cin;
  assign x3= x1 & cin;
  assign x4= a & b;
  assign cout= x3 | x4;
  assign s=x2;
endmodule
  
