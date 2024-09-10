`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 12:31:20 AM
// Design Name: 
// Module Name: SinglePulser
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


module SinglePulser(
    output reg q,
    input d,
    input clock
);

reg state;

initial
begin
    q = 0;
    state = 0;
end

always@(posedge clock)
begin
    case ({state, d})
        2'b00:
            begin
                q = 0;
                state = 0;
            end
        2'b01:
            begin
                q = 1;
                state = 1;
            end
        2'b10:
            begin
                q = 0;
                state = 0;
            end
        2'b11:
            begin
                q = 0;
                state = 1;
            end
    endcase
end

endmodule
