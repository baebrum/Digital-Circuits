`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2021 04:04:10 PM
// Design Name: 
// Module Name: tb_top
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


module tb_top;

    reg clk, btnC, btnU, btnR;
    reg [15:0] sw;
    wire [3:0] an;
    wire [6:0] seg;
    wire [15:0] led;

    initial begin
        clk = 1;
        btnC = 0;
        btnU = 0;
        btnR = 0;
        sw = 0;
    end
    
    always begin
        #5 clk = ~clk; 
    end

    Top inst11 (
        .clk(clk),
        .btnC(btnC),
        .btnU(btnU),
        .sw(sw),
        .led(led),
        .seg(seg),
        .an(an)
    );

    initial begin
        #1;
        #(10*1)
        #10;
        sw = sw | (1 << 14);
        #10;
        #10;
        btnC = 1;
        #10;
        btnC = 0;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        sw =  sw | 8'b1100_1011;
        #10;
        #10;
        #10;
        #(1000*10);
        //btnC = 1;
        #10;
        btnC = 0;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        //btnC = 1;
        #10;
        btnC = 0;
        #(10*4000);    
        btnU = 1;
        #10;
        btnU = 0;
        #(10*4000);
        btnU = 1;
        #10;
        btnU = 0;
        #(10*100);
        btnC= 1;
        #10;
        btnC = 0;
        #10;
        #10;
        #10;
        sw[7:0] = 7'b01110110;
        #10;
        #10;
        #(10*100);
        btnC= 1;
        #10;
        btnC = 0;
        #10;

    end
endmodule
