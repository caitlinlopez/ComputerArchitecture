`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:05:53 AM
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


module mux3to1(w0, w1, w2, s, out);
input [31:0]w0; 
input [31:0]w1;
input [31:0]w2;
input [1:0]s;
output reg [31:0]out;

// seletor value chooses one of the inputs to send to output
always@(w0, w1, w2, s)
    case(s)
    0: out = w0;
    1: out = w1;
    2: out = w2;
    endcase

endmodule