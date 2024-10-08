`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 01:06:07 PM
// Design Name: 
// Module Name: hexTo7Seg0to9Only
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


module hexTo7Seg0to9Only(
    input [3:0] hex,
    output [6:0] segments
    );
    
reg [6:0] segments;

// 7-segment encoding
//      0
//     ---
//  5 |   | 1
//     --- <--6
//  4 |   | 2
//     ---
//      3

    initial
    begin
        segments = 7'b1111111;
    end

   always @(hex)
      case (hex)
          4'b0001 : segments = 7'b1111001;   // 1
          4'b0010 : segments = 7'b0100100;   // 2
          4'b0011 : segments = 7'b0110000;   // 3
          4'b0100 : segments = 7'b0011001;   // 4
          4'b0101 : segments = 7'b0010010;   // 5
          4'b0110 : segments = 7'b0000010;   // 6
          4'b0111 : segments = 7'b1111000;   // 7
          4'b1000 : segments = 7'b0000000;   // 8
          4'b1001 : segments = 7'b0010000;   // 9
          4'b1010 : segments = 7'b0111111;   // A
          4'b1011 : segments = 7'b0111111;   // B
          4'b1011 : segments = 7'b0111111;   // B
          4'b1100 : segments = 7'b0111111;   // C
          4'b1101 : segments = 7'b0111111;   // D
          4'b1110 : segments = 7'b0111111;   // E
          4'b1111 : segments = 7'b0111111;   // F
          default : segments = 7'b1000000;   // 0
      endcase

endmodule
