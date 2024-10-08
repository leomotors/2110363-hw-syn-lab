`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 01:27:16 PM
// Design Name: 
// Module Name: skillissueROMTester
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


module skillissueROMTester(

    );
    
reg [13:0] realsw;
reg clk;
wire [15:0] out;

initial
begin
    realsw = 69;
end
 
skillissueROM rom(realsw, clk, out);

initial
begin
    clk = 0;
end

always
begin
    #10 clk = ~clk;
end

endmodule
