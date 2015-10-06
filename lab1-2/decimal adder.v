
`timescale 1ns / 1ps
module decimal_adder(display,cout,ftsd_ctl,cin,a,b,clk);


input cin,clk;

reg [3:0]a1,b1;
input [3:0]a,b;

output [14:0] display;
output cout;
output [3:0] ftsd_ctl;

wire [1:0] clk_ctl;
wire [3:0] bcd;
reg [4:0] sum;
reg [3:0] s;
reg cout;
reg cin1;





always @(a or b or cin)
begin
     if(cin)
	  cin1<=4'b0000;
	  else
	  cin1<=4'b0001;

     a1<=a; b1<=b; 
     sum<= a1+b1+cin1;
	  if(sum>=10)
	  begin
	  s<=sum[3:0]+4'b0110;
	  cout<=1;
	  end
	  
	  else
	  begin
	  s<=sum[3:0];
	  cout<=0;
	  end

end  
  
 
  
  
  
  freq_div f1(
	.clk_ctl(clk_ctl), // divided clock output
	.clk(clk), // global clock input
	.rst_n(1'b1) // active low reset
	);


scan_ctl s1(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in(bcd), // output to ftsd display
	.in0(4'b1111), // 1st input
	.in1(s), // 2nd input
	.in2(a1), // 3rd input
	.in3(b1), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);
	
	bcd2ftsegdec b0( 
	.display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);

 endmodule