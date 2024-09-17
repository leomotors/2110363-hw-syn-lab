`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 02:57:44 PM
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
    input btnC,
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

// #region Stack Declaration
wire push, pop;
InputBuffer inpush(btnU, targetClk, push);
InputBuffer inpop(btnC, targetClk, pop);

reg [7:0] displayVal;
reg [7:0] index = 0;
reg [7:0] stack [255:0];
// #endregion Stack Declaration

// #region Logic
always@(posedge targetClk)
begin
    if (push && index != 256)
    begin
        stack[index] <= sw;
        index <= index + 1;
    end
    else if (pop && index != 0)
    begin
        displayVal <= stack[index - 1];
        index <= index - 1;
    end
end
// #endregion Logic

// #region Seven Segg
wire [3:0] num3, num2, num1, num0;
assign num3 = index[7:4];
assign num2 = index[3:0];
assign num1 = displayVal[7:4];
assign num0 = displayVal[3:0];

wire an0, an1, an2, an3;
assign an = {an3, an2, an1, an0};

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
    num3,
    targetClk
    );
// #endregion Seven Segg

endmodule
