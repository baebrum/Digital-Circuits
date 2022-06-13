`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 11:08:22 AM
// Design Name: 
// Module Name: stim
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


module stim(
    input clk,
    input btnC,
    input btnU,
    input [15:0] sw,
    output [3:0] an,
    output [6:0] seg,
    output [15:0] led
    );

    wire in_clk;

    clk_div inst2 (
        .clk(clk),
        .new_clk(in_clk)
    );

    alarm inst1 (
        .clk(in_clk),
        .fast_clk(clk),
        .btnC(btnC),
        .btnU(btnU),
        .sw(sw),
        .an(an),
        .seg(seg),
        .led(led)
    );
    
endmodule
