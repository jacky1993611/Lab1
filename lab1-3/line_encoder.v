`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:32 08/18/2015 
// Design Name: 
// Module Name:    line_encoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module line_encoder(d,en,in
    );
	 
	 output [3:0] d;
	 
	 input [1:0] in;
	 input en;
	 
	wire x1,x2;

assign x1=~in[0]&en;
assign x2=~in[1]&en;	 
assign d[0]=x1&x2&en;
assign d[1]=in[0]&x2&en;
assign d[2]=x1&in[1]&en;
assign d[3]=in[0]&in[1]&en;

endmodule
