`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 12:30:15 AM
// Design Name: 
// Module Name: DFlipFlopTester
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


module DFlipFlopTester();
    
wire q, notq;
reg d, clock;

DFlipFlop flipflop(q, notq, d, clock);

initial
begin
    d = 0;
    clock = 0;
end

always
begin
    #10
    clock = ~clock;
end

always
begin
    #7
    d = ~d;
end

endmodule
