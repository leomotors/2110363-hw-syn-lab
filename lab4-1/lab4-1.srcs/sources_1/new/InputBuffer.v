`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 02:54:48 PM
// Design Name: 
// Module Name: InputBuffer
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


module InputBuffer(
    input D,
    input clock,
    output Q
);
    
wire s0, s1;
wire ns0, ns1;

DFlipFlop df1(s0, ns0, D, clock);
DFlipFlop df2(s1, ns1, s0, clock);
SinglePulser sp(Q, s1, clock);
    
endmodule
