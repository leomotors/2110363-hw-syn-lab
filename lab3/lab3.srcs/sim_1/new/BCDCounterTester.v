`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 12:06:29 AM
// Design Name: 
// Module Name: BCDCounterTester
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


module BCDCounterTester(

    );
    
wire [3:0] outputs;
wire cout;
wire bout;
reg up, down, set9, set0, clock;

BCDCounter counter(outputs, cout, bout, up, down, set9, set0, clock);

initial
begin
    clock = 0;
    up = 1;
    down = 0;
    set9 = 0;
    set0 = 0;
end

always
begin
    #10 clock = ~clock;
end
    
endmodule
