`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2022 9:34:30 AM
// Design Name: 
// Module Name: max_hazard
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


module MAX_Hazard_Unit(max,END,PCWrite,IFIDWrite,START, RegMux);
input max, END;
output reg PCWrite, IFIDWrite, START, RegMux;

always@(max,END)
begin
    // starting max calculation instruction
    if (max == 1 & END != 1)
    begin
       PCWrite = 0;
       IFIDWrite = 0;
       START = 1;
       RegMux = 0;
    end
    // stopping max calculation and instruction
    else if (max == 1 & END == 1)
    begin
       PCWrite = 1;
       IFIDWrite = 1;
       START = 0;
       RegMux = 1;
    end
    // allow all other instructions to continue through the pipeline
    else
    begin
       PCWrite = 1;
       IFIDWrite = 1;
       START = 1;
       RegMux = 0;
    end
end

endmodule
