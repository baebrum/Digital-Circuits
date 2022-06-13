`timescale 1ns / 1ps
/************************************************************************
    Company: 
    Engineer: 

    Create Date: 04/09/2021 05:55:06 PM
    Design Name: 
    Module Name: post_choose
    Project Name: 
    Target Devices: 
    Tool Versions: 
    Description: 

    Dependencies: 

    Revision:
    Revision 0.01 - File Created
    Additional Comments:

************************************************************************/


/// PLEASE NOTE: COLUMN 83 IS THE END OF THE RIGHT MARGIN WHEN PRINTING

/*******************************************

*******************************************/

module post_choose #(
    /*******************************************
        The following adjustable parameters are used
        for our clock dividers. The higher the value
        for each parameter the slower the clock will 
        be. Conversely, the lower the value, the
        faster each clock will run.
    *******************************************/
    parameter easy_speed = 5,
    parameter normal_speed = 42_659_840,
    parameter hard_speed = 1
) (
    input clk, // fast AF
    input btnC, // select
    input btnU, // to be determined
    input [15:0] sw,
    input difficulty_chosen_in,
    input [1:0] difficulty_in,
    output [3:0] an,
    output [6:0] seg,
    output reg post_diff_busy, //
    output reg [15:0] post_led
);

    /*******************************************
        The following local parameters are made for 
        readablility in the our finite state machine
    *******************************************/
    localparam easy = 1;
    localparam normal = 2;
    localparam hard = 3;

    /*******************************************
        The following registers will be used 
        throughout this module and some may be used
        outside of this module. Each reg variable is
        designed to easily recognized. With 1-bit
        variables: 1 is active high.
    *******************************************/
    reg user_lost;
    reg user_won;
    reg round_finished;
    reg [31:0] timer_counter;
    reg easy_decrement;
    reg [31:0] easy_counter;
    reg [7:0] led_sequence;

    reg sequence_on;
    reg [31:0] sequence_on_counter;

    reg reset_round;

    /*******************************************
        In the following initial block we initialize
        the formerly defined reg variabled 
    *******************************************/
    initial begin
        post_led <= 0;
        user_lost = 0;
        user_won = 0;
        round_finished = 0;
        timer_counter = 200;
        easy_decrement = 0;
        easy_counter = 0;
        led_sequence = 8'b0000_1111;
        sequence_on = 0;
        sequence_on_counter = 0;
        reset_round = 0;
    end

    /*******************************************
        The following always block's purpose is used
        to signal if the module is in use or not.
        For example, if a difficulty has been chosen
        then the signal is module is "in use";
        otherwise the module is not in used and the
        signal is low
    *******************************************/
    always @(posedge clk ) begin
        if (difficulty_chosen_in) begin
            post_diff_busy = 1;
        end
        else begin
            post_diff_busy = 0;
        end
    end
    /*******************************************
        The following always block will contain a form
        of clock divider for various difficulties in
        the game. For example, if condtion 
        easy_decrement is high we have a counter for 
        the easy clock divider increment and if it
        reaches X value, the counter is reset to zero
        the visual timer (timer_counter) is 
        decremented and if the value of the visual 
        timer is 1 then we stop the clock divider,
        reset the necessary variables and decrement
        the visual timer to zero. Verified through
        simulation results this format is working as
        intended.
    *******************************************/    
    always @(posedge clk) begin
            
        if (reset_round) begin
            timer_counter <= 200;
            easy_decrement <= 0;
            easy_counter <= 0;

            user_won <= 0;
            user_lost <= 0;
            round_finished <= 0;
            reset_round <= 0;
        end
        else begin
            if (easy_decrement) begin
                easy_counter <= easy_counter + 1;
                if (easy_counter > easy_speed) begin
                    easy_counter <= 0;
                    timer_counter <= timer_counter - 1;
                    if(timer_counter == 1) begin
                        easy_decrement = 0;     
                        timer_counter = timer_counter - 1;
                    end
                end
            end
        end
    end



    // always @(posedge clk ) begin
    //     if (sequence_on_counter > 7) begin
    //         if (!sequence_on) begin
    //             sequence_on <= 1;
    //         end
    //         else if (sequence_on) begin
                
    //         end
    //     end
    // end

    always @(posedge clk ) begin

        /*******************************************
            the following conditional checks if 
            difficulty_chosen_in is high; if the condition
            is satisfied then we begin playing the game;
            if the condition is not satisfied then the
            game does not start. Then the condition if
            the round has finished is checked. If the 
            round_finished is low then the round is 
            started; otherwise, DO CRAP.
        *******************************************/    
        if (difficulty_chosen_in) begin
            if (!round_finished) begin
                case (difficulty_in)
                    easy: begin
                        /*******************************************
                            In our if else blocks we check if our
                            timer_counter is greater than 0. If the
                            condition is satisfied then we invoke our
                            clock divider previously explained. While
                            the condition is satisified we have a
                            condition that checks is the far right
                            switches on our board match the switches on 
                            board match our led sequence. If satisfied
                            and if btnC has been invoked. We set the flag
                            that user has won. In the case timer_counter
                            is less than or equal to 0. We check if the
                            flag that user is won is low. If low, the 
                            flag that user has lost is invoked. And the
                            flag to signify the round has finished is
                            invoked as well.
                        *******************************************/    
                        if (timer_counter > 0) begin
                            easy_decrement <= 1;
                            if (sw[7:0] == led_sequence[7:0]) begin
                                if (btnC) begin
                                    user_won <= 1;
                                    post_led <= 16'b0000_1111_0000_1111;
                                end
                            end
                        end
                        else begin
                            round_finished <= 1;
                            if(!user_won) begin
                                user_lost <= 1;
                            end
                        end
                    end 
                endcase
            end

            
            else if (round_finished) begin
                if (user_won) begin
                    if (btnU) begin
                        reset_round <= 1;
                    end
                end
                else if (user_lost) begin
                    // do crap
                end
            end
        end
    end
endmodule
