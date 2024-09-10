`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 11:14:12 PM
// Design Name: 
// Module Name: BCDCounter
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


module BCDCounter(
    output reg[3:0] outputs,
    output reg cout,
    output reg bout,
    input up, down, set9, set0, clock
 );
    
  
initial begin
    outputs = 0;
    cout = 0;
    bout = 0;
end

always@(posedge clock)
begin 
    cout = 0;
    bout = 0;
    outputs = outputs + up;
    outputs = outputs - down;
    
    case({set9, set0})
        2'b10: outputs = 9;
        2'b01: outputs = 0;
    endcase
 
    case(outputs)
        4'b1010: // A overflow
            begin
                outputs = 0;
                cout = 1;
            end 
        4'b1111: // F underflow
            begin
                outputs = 9; 
                bout = 1;
            end
    endcase
end
    
endmodule
