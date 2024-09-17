`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 03:54:16 PM
// Design Name: 
// Module Name: FiveBinaryToTwoBCDROM
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


module FiveBinaryToTwoBCDROM(
    input [4:0] A,
    input clock,
    output reg [7:0] data
);

(*rom_style = "block" *) reg [7:0] mem [31:0];
initial $readmemb("fiveBinaryToTwoBCD.mem", mem);
always @(posedge clock) begin
    data <= mem[A];
end

endmodule
