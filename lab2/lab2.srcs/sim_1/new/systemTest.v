`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 12:39:09 PM
// Design Name: 
// Module Name: systemTest
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module systemTest(
    );

reg clk;
wire [6:0] segg;
wire dp;
wire [3:0] an;

system sys(segg, dp, an, clk);

initial
begin
    clk = 0;
end

always
begin
    #10 clk = ~clk;
end
    
endmodule
