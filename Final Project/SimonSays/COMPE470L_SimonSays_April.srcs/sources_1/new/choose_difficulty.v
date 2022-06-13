`timescale 1ns / 1ps
/*******************************************************************************
    Company: 
    Engineer: 

    Create Date: 04/09/2021 03:07:24 PM
    Design Name: 
    Module Name: States
    Project Name: 
    Target Devices: 
    Tool Versions: 
    Description: 

    Dependencies: 

    Revision:
    Revision 0.01 - File Created
    Additional Comments:

*******************************************************************************/

module choose_difficulty //#(
    //parameters
//) 
(
    input clk, // stupid fast
    // input easy_clk_in, // slowest clock
    // input medium_clk_in, // slower clock
    // input hard_clk_in, // slow clock
    input btnC, // select
    // input btnU,
    input btnR, // will be used to reset difficulty
    input [15:0] sw, // switches on board
    //output reg [15:0] led,
    output reg [1:0] difficulty_out,
    output reg difficulty_chosen, // flag
    output reg pre_diff_busy, //
    output reg [15:0] choose_led
);

    /*******************************************

    *******************************************/


    /*******************************************
    The following localparam variables are 
    created for easy reading in the code
    *******************************************/
    localparam easy = 1;
    localparam normal = 2;
    localparam hard = 3;

    /*******************************************
    We initialize our reg variables
    *******************************************/    
    initial begin
        difficulty_chosen = 0;
        //led = 0;
        difficulty_out = 0;
        choose_led = 0;
    end

    always @(posedge clk) begin
        if (!difficulty_chosen) begin
            pre_diff_busy = 1;
        end
        else begin
            pre_diff_busy = 0;
        end
    end

    always @(posedge clk ) begin
        choose_led[15:14] <= sw[15:14];
    end

    always @(posedge clk ) begin
        /*******************************************
        In the case the user has not chosen a difficulty
        we enter the following case statement. In each
        case if the user is in a valid case, and the 
        user invoke btnC on the board, the difficulty
        is outputted and reg difficulty_chosen is set
        to 1 
        *******************************************/
        if (!difficulty_chosen) begin
            case (sw[15:14])
                easy: begin
                    if (btnC) begin
                       difficulty_out <= easy;
                       difficulty_chosen <= 1;
                       // led <= (1 << 15);
                       // leds are for debugging
                    end
                end 
                normal: begin
                    if (btnC) begin
                        difficulty_out <= normal;    
                        difficulty_chosen <= 1;
                        // led <= (1 << 15 | 1 << 14);
                    end
                end
                hard: begin
                    if (btnC) begin
                        difficulty_out <= hard;    
                        difficulty_chosen <= 1;
                        // led <= (1 << 15 | 1 << 14 | 1 << 13);
                    end
                end
            endcase
        end
        /*******************************************
        In the case the user has chosen a difficulty
        we initiate a conditional statement. If the
        switches to choose a difficulty evaluate to 
        zero and if btnR on the board is invoked 
        then the difficulty_chosen is set to 0 and 
        the user will have to have to choose a 
        difficulty
        *******************************************/
        else begin
            if (sw[15:14] == 0) begin
                if (btnR) begin
                    difficulty_chosen <= 0;
                end
            end
        end
    end
endmodule
