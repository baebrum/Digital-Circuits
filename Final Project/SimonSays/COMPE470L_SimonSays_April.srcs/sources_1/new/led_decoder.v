`timescale 1ns / 1ps
/*********************************************************************************
    Company: 
    Engineer: 

    Create Date: 04/10/2021 01:01:41 PM
    Design Name: 
    Module Name: led_decoder
    Project Name: 
    Target Devices: 
    Tool Versions: 
    Description: 

    Dependencies: 

    Revision:
    Revision 0.01 - File Created
    Additional Comments:

*********************************************************************************/

/*******************************************
    The following module is made to output
    on the board's LEDs with respect to the
    state of the game. For example if the user
    is choosing a difficulty, then the LEDs on
    the board will only be driven from the 
    module choose_difficulty. The same occurs
    when after a difficulty has been chosen
*******************************************/

module led_decoder (
    //input clk,
    input state_choose_difficulty,
    input state_post_difficulty,
    input [15:0 ] led_from_fsm,
    input [15:0] leds_from_choose,
    input [15:0] leds_from_post,
    output reg [15:0] led
);

    reg [15:0] reg_led_bruh;
    initial begin
        reg_led_bruh = 0;
    end
    always @(*) begin
        led <= led_from_fsm;
    end

endmodule