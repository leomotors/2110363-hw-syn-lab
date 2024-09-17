`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 06:05:03 PM
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
    input [7:0] sw,
    input btnU,
    input btnL,
    input btnD,
    input btnR,
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

// #region Input Debounce
wire add, sub, mul, div;

InputBuffer inadd(btnU, targetClk, add);
InputBuffer insub(btnL, targetClk, sub);
InputBuffer inmul(btnD, targetClk, mul);
InputBuffer indiv(btnR, targetClk, div);
// #endregion Input Debounce

// #region Processing Input
reg [9:0] romAddr;

always@(posedge targetClk)
begin
    if (add)
        romAddr = {sw, 2'b00};
    else if (sub)
        romAddr = {sw, 2'b01};
    else if (mul)
        romAddr = {sw, 2'b10};
    else if (div)
        romAddr = {sw, 2'b11};
end
// #endregion Processing Input

// #region Lookup and Display
wire an0, an1, an2, an3;
reg alwaysOn = 1;
assign an = {alwaysOn, an2, an1, an0};

wire [11:0] displayVal;
Lab4Part3ROM rom(romAddr, targetClk, displayVal);

wire [3:0] num2, num1, num0;
assign num2 = displayVal[11:8];
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
    num2,
    0,
    targetClk
);
// #endregion Lookup and Display

endmodule
