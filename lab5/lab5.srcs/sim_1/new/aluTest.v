`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 01:33:25 PM
// Design Name: 
// Module Name: aluTest
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


module aluTest(

    );
    
wire [31:0] S;
wire z;
wire Cout;
reg [31:0] A;
reg [31:0] B;
reg Cin;
reg [2:0] alu_ops;

alu alu_unit(S, z, Cout, A, B, Cin, alu_ops);

initial
begin
    A = 2;
    B = 3;
    Cin = 0;
    alu_ops = 3'b000;
end

always
begin
   #10 alu_ops = alu_ops + 1;
end

endmodule
