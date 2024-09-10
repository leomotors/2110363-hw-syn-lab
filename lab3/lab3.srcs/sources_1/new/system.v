`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 12:48:10 AM
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

wire [3:0] num3, num2, num1, num0;

wire an0, an1, an2, an3;
assign an = {an3, an2, an1, an0};

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

// #region Debouncer
// Using Double D-FF
wire [7:0] d, notd, d2, notd2;
genvar n;

generate for (n = 0; n < 8; n = n + 1) begin
    DFlipFlop dFF2(d2[n], notd2[n], sw[n], targetClk);
    DFlipFlop dFF(d[n], notd[n], d2[n], targetClk);
end endgenerate
// #endregion Debouncer

// #region Single Pulser
wire up0, up1, up2, up3, down0, down1, down2, down3;
SinglePulser spUP3(up3, d[7], targetClk);
SinglePulser spDOWN3(down3, d[6], targetClk);
SinglePulser spUP2(up2, d[5], targetClk);
SinglePulser spDOWN2(down2, d[4], targetClk);
SinglePulser spUP1(up1, d[3], targetClk);
SinglePulser spDOWN1(down1, d[2], targetClk);
SinglePulser spUP0(up0, d[1], targetClk);
SinglePulser spDOWN0(down0, d[0], targetClk);
// #endregion Single Pulser

// Counter
wire cout0, cout1, cout2, cout3;
wire bout0, bout1, bout2, bout3;

BCDCounter counter0(num0, cout0, bout0, up0, down0, btnU | cout3, btnC | bout3, targetClk);
BCDCounter counter1(num1, cout1, bout1, up1 | cout0, down1 | bout0, btnU | cout3, btnC | bout3, targetClk);
BCDCounter counter2(num2, cout2, bout2, up2 | cout1, down2 | bout1, btnU | cout3, btnC | bout3, targetClk);
BCDCounter counter3(num3, cout3, bout3, up3 | cout2, down3 | bout2, btnU | cout3, btnC | bout3, targetClk);

// Display Number
quad7Segg segg(seg, dp, an0, an1, an2, an3, num0, num1, num2, num3, targetClk);

endmodule
