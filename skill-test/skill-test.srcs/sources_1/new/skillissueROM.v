`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 01:13:23 PM
// Design Name: 
// Module Name: skillissueROM
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


module skillissueROM(
    input [13:0] A,
    input clock,
    output reg [15:0] data
);

(*rom_style = "block" *) reg [15:0] mem [16383:0];
initial $readmemb("skillissueROM.mem", mem);
always @(posedge clock) begin
    data <= mem[A];
end

endmodule
