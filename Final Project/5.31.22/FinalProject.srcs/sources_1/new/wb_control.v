`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2022 03:46:24 PM
// Design Name: 
// Module Name: wb_control
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


module wb_control(MaxToReg, AluToReg, RdControl);

input MaxToReg, AluToReg;
output reg[1:0] RdControl;

always@(MaxToReg, AluToReg)
begin
    // Pass data memory
    if (MaxToReg == 0 && AluToReg == 0)
    begin
        RdControl = 0;
    end
    
    // Pass ALU
    else if (MaxToReg == 0 && AluToReg == 1)
    begin
        RdControl = 1;
    end
    
    // Pass MAX
    else if (MaxToReg == 1 && AluToReg == 0)
    begin
        RdControl = 2;
    end
end

endmodule
