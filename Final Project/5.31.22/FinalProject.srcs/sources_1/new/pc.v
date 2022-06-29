`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:03:04 AM
// Design Name: 
// Module Name: test
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


module pc(clock, PCWrite, pc_in, pc_out);
input PCWrite;
input [31:0]pc_in;
output reg [31:0]pc_out;
input clock;

initial
begin
    pc_out = 0;
end

always@(negedge clock)
begin
    // only pass inputs to outputs if we are allowing PC to write, else hold current values
    if (PCWrite == 1)
    begin
        if (pc_in) 
        begin
            pc_out = pc_in;
        end
    end
end

endmodule