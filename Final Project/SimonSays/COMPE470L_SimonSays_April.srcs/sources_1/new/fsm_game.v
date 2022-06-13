`timescale 1ns / 1ps
/*********************************************************************************
    Company: 
    Engineer: 

    Create Date: 03/15/2021 11:17:42 AM
    Design Name: 
    Module Name: fsm_game
    Project Name: 
    Target Devices: 
    Tool Versions: 
    Description: 

    Dependencies: 

    Revision:
    Revision 0.01 - File Created
    Additional Comments:
*********************************************************************************/


module fsm_game#(
    /*******************************************
        The following parameters are used to
        increase or decrease the speed of the 
        decrementing counter for the seven
        segment display. Higher is slower and
        lower is faster
    *******************************************/
    parameter easy_speed = 5,
    parameter normal_speed = 4,//42_659_840,
    parameter hard_speed = 3,
    parameter NUM_BITS = 0
) (
    input clk, // not system clock (slowed down)
    input btnC, // select
    input btnU, // reset button
    input [15:0] sw, // switches on board
    input [NUM_BITS-1:0] LSFR_random_in, // random value from lsfr
    output reg [1:0] game_difficulty, // output game difficulty
    output reg [15:0] fsm_led, // output what leds should be to a decoder
    output reg LSFR_start, // flag to enable/disable lsfr
    output [2:0] state_out, // outputs current state
    output [31:0] sevenSegDisplay_timer // output timer value to seven segment
);

    /*******************************************
        The following local parameters are made
        for readability in cases or modes
    *******************************************/    
    localparam choosing_diff = 0;
    localparam playing_game = 1;
    localparam getting_rand_sequence = 2;
    localparam simon_shows = 3;
    localparam show_results = 4;
    localparam reset = 5;
    localparam easy = 1;
    localparam normal = 2;
    localparam hard = 3;

    /*******************************************
        The following registers will be used 
        througout the module
    *******************************************/  

    reg [2:0] state; // current state in fsm
    reg difficulty_chosen; // flag to confirm a mode has been chosen

    reg user_lost; // flag
    reg user_won; // flag
    reg round_finished; // flag

    reg [31:0] timer_counter;
    
    reg easy_decrement; // flag to decrement
    reg [31:0] easy_counter; // clock div for easy mode
    reg normal_decrement; // flag to decrement
    reg [31:0] normal_counter; // clock div for normal mode
    reg hard_decrement; // flag to decrement
    reg [31:0] hard_counter; // clock div for hard mode
    
    
    reg [NUM_BITS-1:0] led_sequence; // register to save lsfr input value

    reg sequence_on; // flag 
    reg [31:0] sequence_on_counter; // counter to loop lsfr


    reg [31:0] show_led_delay_counter; // counter used to delay leds on ON state
    
    reg led_alternate; // flag to flag LEDs off and on
    reg [31:0] led_alternate_counter; // counter for flashing LEDs
    reg [15:0] Sixteen_LED_ON; // register to hold max and min 16-bit value

    /*******************************************
        The following initializes our former 
        registers to default values
    *******************************************/  
    initial begin
        state = choosing_diff;
        difficulty_chosen = 0;
        game_difficulty = 0;
        fsm_led <= 0;
        user_lost = 0;
        user_won = 0;
        round_finished = 0;
        timer_counter = 35;
        easy_decrement = 0;
        easy_counter = 0;
        normal_decrement = 0;
        normal_counter = 0;
        hard_decrement = 0;
        hard_counter = 0;
        led_sequence = 0;
        sequence_on = 0;
        sequence_on_counter = 0;
        LSFR_start = 0;
        show_led_delay_counter = 0;
        led_alternate = 0;
        led_alternate_counter = 0;
        Sixteen_LED_ON = 16'b1111_1111_1111_1111;
    end

    /*******************************************
        The following are asynchronously assigning
        values to output our current state and for
        our seven segment displays
    *******************************************/  
    assign state_out = state;
    assign sevenSegDisplay_timer = timer_counter;

    always @(posedge clk ) begin
        /*******************************************
            The following conditions for xxx_decrement
            are used to decrement at a speed with 
            respect to the difficulty chosen
        *******************************************/  
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
        else if (normal_decrement) begin
            normal_counter <= normal_counter + 1;
            if (normal_counter > normal_speed) begin
                normal_counter <= 0;
                timer_counter <= timer_counter - 1;
                if(timer_counter == 1) begin
                    normal_decrement = 0;     
                    timer_counter = timer_counter - 1;
                end
            end
        end
        else if (hard_decrement) begin
            hard_counter <= hard_counter + 1;
            if (hard_counter > hard_speed) begin
                hard_counter <= 0;
                timer_counter <= timer_counter - 1;
                if(timer_counter == 1) begin
                    hard_decrement = 0;     
                    timer_counter = timer_counter - 1;
                end
            end
        end

        /*******************************************
            For the following condition, when led_alternate
            is asserted the board will flash 16 LEDs on
            and off 
        *******************************************/
        if(led_alternate) begin
            led_alternate_counter <= led_alternate_counter + 1;
            if(led_alternate_counter >= 7) begin
                Sixteen_LED_ON <= ~Sixteen_LED_ON;
                fsm_led <= Sixteen_LED_ON;
                led_alternate_counter <= 0;
            end
        end

        case (state)
            choosing_diff: begin
                /******************************************* 
                    Upon entering the first state, essentially our
                    default state, we assign the round_finished to
                    zero on the next clock cycle. If a difficulty
                    has yet to be chosen then we enter a case
                    block for our three modes. A mode is selected
                    by a button press and regardless of mode, the 
                    two far left LEDs on the board (15 and 14) are
                    turned off and on with respect to switches 15
                    and 14
                *******************************************/
                round_finished <= 0;
                if (!difficulty_chosen) begin
                    fsm_led[15:14] <= sw[15:14];
                    case (sw[15:14])
                        easy: begin
                            if (btnC) begin
                                game_difficulty <= easy;
                                state <= getting_rand_sequence;
                                difficulty_chosen <= 1; // this is a flag
                            end
                        end 
                        normal: begin
                            if (btnC) begin
                                game_difficulty <= normal;
                                state <= getting_rand_sequence;    
                                difficulty_chosen <= 1;
                            end
                        end
                        hard: begin
                            if (btnC) begin
                                game_difficulty <= hard;
                                state <= getting_rand_sequence;    
                                difficulty_chosen <= 1;
                            end
                        end
                    endcase
                end
            end 
            getting_rand_sequence: begin
                /*******************************************
                    In this state our LSFR runs until a counter
                    is no longer satisfied.
                *******************************************/
                if (sequence_on_counter < 19) begin
                    sequence_on_counter <= sequence_on_counter + 1;
                    LSFR_start <= 1;
                    state <= getting_rand_sequence;
                end
                else begin
                    state <= simon_shows;
                    LSFR_start <= 0;
                end
            end
            simon_shows: begin
                /*******************************************
                    In this state we create a delay to show
                    the user a sequence created by our lsfr
                    and where bits 1 and 0 are leds on and off
                    respectively
                *******************************************/
                if (show_led_delay_counter < 25) begin
                    show_led_delay_counter <= show_led_delay_counter + 1;
                    led_sequence <= LSFR_random_in;
                    fsm_led[7:0] <= LSFR_random_in; 
                end
                else begin
                    state <= playing_game;
                    show_led_delay_counter = 0;
                    fsm_led[7:0] <= 0;
                end
            end
            playing_game: begin
                /*******************************************
                    We have a condition where if the round has not
                    finished we will play; otherwise, we will move onto
                    the next state and show the results
                *******************************************/   
                if (!round_finished) begin
                    case (game_difficulty)
                        /*******************************************
                            The following modes and their conditions
                            are fairly similar. They differ in how long 
                            they remain active while playing. For example
                            in mode easy, if the timer counter condition
                            is satisfied then we decrement with respect
                            to the difficulty and if the user enters the
                            correct sequence that was previously lit along
                            with a button press. The user has won and 
                            the LEDs will flash off and on; otherwise,
                            the user has lost.
                        *******************************************/   
                        easy: begin
                            if (timer_counter > 0) begin
                                easy_decrement <= 1;
                                if (sw[7:0] == led_sequence[7:0]) begin
                                    if (btnC) begin
                                        user_won <= 1;
                                        led_alternate <= 1;
                                    end
                                end
                            end
                            else begin
                                led_alternate = 0;
                                fsm_led[15:14] = game_difficulty;
                                fsm_led[13:0] = 0;
                                round_finished <= 1;
                                if(!user_won) begin
                                    user_lost <= 1;
                                end
                            end
                        end
                        normal: begin
                            if (timer_counter > 0) begin
                                normal_decrement <= 1;
                                if (sw[7:0] == led_sequence[7:0]) begin
                                    if (btnC) begin
                                        user_won <= 1;
                                        led_alternate <= 1;
                                    end
                                end
                            end
                            else begin
                                led_alternate = 0;
                                fsm_led[15:14] = game_difficulty;
                                fsm_led[13:0] = 0;
                                round_finished <= 1;
                                if(!user_won) begin
                                    user_lost <= 1;
                                end
                            end
                        end
                        hard: begin
                            if (timer_counter > 0) begin
                                hard_decrement <= 1;
                                if (sw[7:0] == led_sequence[7:0]) begin
                                    if (btnC) begin
                                        user_won <= 1;
                                        led_alternate <= 1;
                                    end
                                end
                            end
                            else begin
                                led_alternate = 0;
                                fsm_led[15:14] = game_difficulty;
                                fsm_led[13:0] = 0;
                                round_finished <= 1;
                                if(!user_won) begin
                                    user_lost <= 1;
                                end
                            end
                        end 
                    endcase
                end
                else if (round_finished) begin
                    state <= show_results;
                end
            end
            /*******************************************
                In the following state, we allow the user
                to appreciate their win or loss by display
                9999 or 1111 respectively. They are able
                to proceed by pressing the reset button.
                If the user previously won, they will
                keep playing.
                If the user previously lost, they will
                enter the state to choose a difficulty
                Afterwards we move into the reset state
            *******************************************/   
            show_results: begin
                if (user_won) begin
                    timer_counter <= 9999;
                    if (btnU) begin
                        state <= reset;
                    end
                end
                else if (user_lost) begin
                    timer_counter <= 1111;
                    if (btnU) begin
                        state <= reset;
                        difficulty_chosen <= 0;
                        fsm_led[10:0] <= 2;
                    end
                end
            end
            /*******************************************
                The following state is used to reset the values
                used throughout the module.
            *******************************************/   
            reset: begin
                state <= getting_rand_sequence;
                timer_counter <= 35;
                sequence_on_counter <= 0;
                user_won <= 0;
                user_lost <= 0;
                round_finished <= 0;
                fsm_led[11:0] <= 0;
                easy_decrement <= 0;
                easy_counter <= 0;
                normal_decrement <= 0;
                normal_counter <= 0;
                hard_decrement <= 0;
                hard_counter <= 0;
                if (user_won) begin
                    state <= getting_rand_sequence;
                end
                else if(user_lost) begin
                    state <= choosing_diff;
                end
            end
        endcase
    end
endmodule
