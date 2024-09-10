`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 12:44:32 AM
// Design Name: 
// Module Name: SinglePulserTest
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


module SinglePulserTest();

wire q;
reg d, clock;

SinglePulser sp(q, d, clock);

initial
begin
    d = 0;
    clock = 0;
end

always
begin
    #10 clock = ~clock;
end

always
begin
    #8 d =1;
    #20 d = 0;
    #42 d = 1;
    #69 d = 0;
end

endmodule
