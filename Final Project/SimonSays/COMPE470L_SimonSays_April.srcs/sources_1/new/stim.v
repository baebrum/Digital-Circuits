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



/*
The following module is out top module for our
simon says application
*/

module Top #(
    parameter NUM_BITS = 8
) (
    input clk,
    input btnC, // select
    input btnU, // to be determined
    //input btnR, // will be used to reset difficulty
    input [15:0] sw, // switches input
    output [3:0] an, // anodes
    output [6:0] seg, // seven segment display
    output [15:0] led // LEDs on the board
);

    // wire in_clk;

    // clk_div inst2 (
    //     .clk(clk),
    //     .new_clk(in_clk)
    // );
    wire [1:0] diff_out_jumper;
    wire diff_chosen_jumper;
    wire pre_diff_busy_jumper;
    wire post_diff_busy_jumper;
    wire [15:0] choose_led_jumper;
    wire [15:0] post_led_jumper;
    
    wire [1:0] game_difficulty_jumper;
    wire [15:0] fsm_led_jumper;
    wire [NUM_BITS-1:0] LSFR_random_jumper;
    wire LSFR_start_jumper;
    wire slower_clk_jumper;
    wire [2:0] state_out_jumper;
    wire [31:0] sevenSegDisplay_timer_jumper;

/*
    choose_difficulty inst1 (
        // .clk(clk),
        // .btnC(btnC),
        // .btnR(btnR),
        // .sw(sw),
        // //.led(led),
        // .difficulty_out(diff_out_jumper),
        // .difficulty_chosen(diff_chosen_jumper),
        // .pre_diff_busy(pre_diff_busy_jumper)
        .clk(clk), // stupid fast
        .btnC(btnC), // select
        .btnR(btnR), // will be used to reset difficulty
        .sw(sw), // switches on board
        .difficulty_out(diff_out_jumper),
        .difficulty_chosen(diff_chosen_jumper), // flag
        .pre_diff_busy(pre_diff_busy_jumper), //
        .choose_led(choose_led_jumper)
    );

    post_choose inst2 (
        .clk(clk), // fast AF
        .btnC(btnC), // select
        .btnU(btnU), // to be determined
        .sw(sw),
        .difficulty_chosen_in(diff_chosen_jumper),
        .difficulty_in(diff_out_jumper),
        // output [3:0] an,
        // output [6:0] seg,
        .post_diff_busy(post_diff_busy_jumper), //
        .post_led(post_led_jumper)
    );

*/
    fsm_game #(.NUM_BITS(NUM_BITS)) inst4(
        .clk(slower_clk_jumper), // stupid fast
        .btnC(btnC), // select
        .btnU(btnU), // reset
        //.btnR(btnR), // will be used to reset difficulty
        .sw(sw), // switches on board
        .LSFR_random_in(LSFR_random_jumper),
        //input post_diff_busy_in,
        .game_difficulty(game_difficulty_jumper),
        //output reg difficulty_chosen, // flag
        //output reg pre_diff_busy, //
        .fsm_led(fsm_led_jumper),
        .LSFR_start(LSFR_start_jumper),
        .state_out(state_out_jumper),
        .sevenSegDisplay_timer(sevenSegDisplay_timer_jumper)
    );

    
    LFSR #(.NUM_BITS(NUM_BITS)) inst5(
        .clk(clk),
        .LSFR_start(LSFR_start_jumper),
        .LSFR_enable(1'b1),
        .seed(1'b0),
        .seed_data({NUM_BITS{1'b0}}), // Replication
        .LSFR_random_out(LSFR_random_jumper),
        .LFSR_Done(w_LFSR_Done)
    );

    led_decoder inst3 (
        //.clk(clk),
        .state_choose_difficulty(pre_diff_busy_jumper),
        .state_post_difficulty(post_diff_busy_jumper),
        .led_from_fsm(fsm_led_jumper),
        .leds_from_choose(choose_led_jumper),
        .leds_from_post(post_led_jumper),
        .led(led)
    );

    clk_div inst2 (
        .clk(clk),
        .new_clk(slower_clk_jumper)
    );

    sevenSegDisplay inst6 (
        .clk(clk),
        .state(state_out_jumper),
        .visual_counter(sevenSegDisplay_timer_jumper),
        .an(an),
        .seg(seg)
    );
endmodule
/*
    // /*
    // The following commented out code is from alarm clock
    // please ignore it
    // */
    // module stim(
    //     input clk,
    //     input btnC,
    //     input btnU,
    //     input [15:0] sw,
    //     output [3:0] an,
    //     output [6:0] seg,
    //     output [15:0] led
    //     );

    //     wire in_clk;

    //     clk_div inst2 (
    //         .clk(clk),
    //         .new_clk(in_clk)
    //     );

    //     alarm inst1 (
    //         .clk(in_clk),
    //         .fast_clk(clk),
    //         .btnC(btnC),
    //         .btnU(btnU),
    //         .sw(sw),
    //         .an(an),
    //         .seg(seg),
    //         .led(led)
    //     );
        
    // endmodule