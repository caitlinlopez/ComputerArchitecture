`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2022 10:11:01 AM
// Design Name: 
// Module Name: control
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


module Control_final(clk, Op,sign_extend, RegWrt,MemRead,MemWrite,Branch,J,ALUtoReg,Const,PCtoALU,Max,ALUop,WAI);
input [3:0] Op;
input clk;

output reg [1:0]sign_extend;
output reg RegWrt;
output reg MemRead;
output reg MemWrite;
output reg Branch;
output reg J;
output reg ALUtoReg;
output reg Const;
output reg PCtoALU;
output reg Max;
output reg[2:0] ALUop;
output reg WAI;

initial
begin
    RegWrt = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    J = 0;
    ALUtoReg = 0;
    Const = 0;
    PCtoALU = 0;
    Max=0;
    ALUop=3'b000;
    sign_extend = 0;
    WAI = 0;
end

always@(negedge clk)
begin
    case(Op)
    //NOP
    4'b0000:
    begin
        RegWrt = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        J = 0;
        ALUtoReg = 0;
        Const = 0;
        PCtoALU = 0;
        Max=0;
        ALUop=3'b000;
        sign_extend = 0;
        WAI = 0;
    end

    //SVPC
    4'b1111:
    begin
        RegWrt = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        J = 0;
        ALUtoReg = 1;
        Const = 1;
        PCtoALU = 1;
        Max=0;
        ALUop = 3'b100;
        sign_extend = 1;
        WAI = 0;
    end

    //Load
    4'b1110:
    begin
        RegWrt = 1;
        MemRead = 1;
        MemWrite = 0;
        Branch = 0;
        J = 0;
        ALUtoReg = 0;
        Const = 0;
        PCtoALU = 0;
        Max=0;
        ALUop = 3'b000;
        sign_extend = 0;
        WAI = 0;
     end

     //store
     4'b0011:
     begin
        RegWrt = 0;
        MemRead = 0;
        MemWrite = 1;
        Branch = 0;
        J = 0;
        ALUtoReg = 0;
        Const = 0;
        PCtoALU = 0;
        Max=0;
        ALUop = 3'b000;
        sign_extend = 0;
        WAI = 0;
     end

     //Add
     4'b0100:
     begin
        RegWrt = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        J = 0;
        ALUtoReg = 1;
        Const = 0;
        PCtoALU = 0;
        Max=0;
        ALUop = 3'b100;
        sign_extend = 0;
        WAI = 0;
     end 

     //Addi
     4'b0101:
     begin
        RegWrt = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        J = 0;
        ALUtoReg = 1;
        Const = 1;
        PCtoALU = 0;
        Max=0;
        ALUop = 3'b100;
        sign_extend = 2;
        WAI = 0;
     end 

     //Negate
     4'b0110:
     begin
        RegWrt = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        J = 0;
        ALUtoReg = 1;
        Const = 0;
        PCtoALU = 0;
        Max=0;
        ALUop = 3'b010;
        sign_extend = 0;
        WAI = 0;
     end 

     //Subtract
     4'b0111:
     begin
        RegWrt = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        J = 0;
        ALUtoReg = 1;
        Const = 0;
        PCtoALU = 0;
        Max=0;
        ALUop = 3'b001;
        sign_extend = 0;
        WAI = 0;
     end 

     //Jump
     4'b1000:
     begin
        RegWrt = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        J = 1;
        ALUtoReg = 0;
        Const = 0;
        PCtoALU = 0;
        Max=0;
        ALUop = 3'b000;
        sign_extend = 0;
        WAI = 0;
     end

     //BRZ
     4'b1001:
     begin
        RegWrt = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        J = 0;
        ALUtoReg = 0;
        Const = 0;
        PCtoALU = 0;
        Max=0;
        ALUop = 3'b000;
        sign_extend = 0;
        WAI = 0;
     end

     //BRN
     4'b1011:
     begin
        RegWrt = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        J = 0;
        ALUtoReg = 0;
        Const = 0;
        PCtoALU = 0;
        Max=0;
        ALUop = 3'b000;
        sign_extend = 0;
        WAI = 0;
     end

     //Max
     4'b0001:
     begin
        RegWrt=0;
        MemRead=1;
        MemWrite=0;
        Branch=0;
        J=0;
        ALUtoReg = 0;
        Const = 0;
        PCtoALU = 0;
        Max=1;
        ALUop = 3'b000;
        sign_extend = 0;
        WAI = 0;
     end
     
     //WAI
     4'b0010:
     begin
        RegWrt = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        J = 0;
        ALUtoReg = 1;
        Const = 1;
        PCtoALU = 1;
        Max=0;
        ALUop = 3'b100;
        sign_extend = 1;
        WAI = 1;
     end
     endcase
end
endmodule
