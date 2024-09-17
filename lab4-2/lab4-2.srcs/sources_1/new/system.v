`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 03:57:34 PM
// Design Name: 
// Module Name: system
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


module system(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input [4:0] sw,
    input clk
);

// #region Clock Division
wire targetClk;
wire [18:0] tclk;
assign tclk[0] = clk;

genvar c;
generate for (c = 0; c < 18; c = c + 1) begin
    clockDiv fDiv(tclk[c], tclk[c + 1]);
end endgenerate

clockDiv fDivTarget(tclk[18], targetClk);
// #endregion Clock Division

wire an0, an1, an2, an3;
reg alwaysOn = 1;
assign an = {alwaysOn, alwaysOn, an1, an0};

wire [7:0] displayVal;
FiveBinaryToTwoBCDROM rom(sw, targetClk, displayVal);

wire [3:0] num1, num0;
assign num1 = displayVal[7:4];
assign num0 = displayVal[3:0];

quad7Segg segg(
    seg,
    dp,
    an0,
    an1,
    an2,
    an3,
    num0,
    num1,
    0,
    0,
    targetClk
);

endmodule
