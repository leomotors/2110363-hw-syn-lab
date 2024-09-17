`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2024 12:12:37 AM
// Design Name: 
// Module Name: Lab4Part3ROM
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


module Lab4Part3ROM(
    input [9:0] A,
    input clock,
    output reg [11:0] data
);

(*rom_style = "block" *) reg [11:0] mem [1023:0];
initial $readmemb("lab4part3ROM.mem", mem);
always @(posedge clock) begin
    data <= mem[A];
end

endmodule
