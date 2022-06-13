`timescale 1ns / 1ps
/*********************************************************************************
    Company: 
    Engineer: 

    Create Date: 03/15/2021 11:17:42 AM
    Design Name: 
    Module Name: clk_div
    Project Name: 
    Target Devices: 
    Tool Versions: 
    Description: 

    Dependencies: 

    Revision:
    Revision 0.01 - File Created
    Additional Comments:
*********************************************************************************/



/*
The following module is our clock divider
we will be output "clock" signals that will
operate at variable rates
*/

module clk_div #(
    parameter speed = 42_659_840
) (
    input clk,
    output new_clk // slower clock
);

    reg new_clk_reg;
    reg [31:0] clk_counter;

    initial begin
        new_clk_reg = 0;
        clk_counter = 0;
    end

    always @(posedge clk ) begin
        clk_counter <= clk_counter + 1;
        if (clk_counter >= speed/27) begin
            clk_counter <= 0;
            new_clk_reg <= ~new_clk_reg;
        end
    end

    assign new_clk = new_clk_reg;
    //assign new_clk = clk;
endmodule
