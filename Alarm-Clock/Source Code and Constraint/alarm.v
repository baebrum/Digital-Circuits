`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 11:08:10 AM
// Design Name: 
// Module Name: alarm
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

module alarm (
    input clk,
    input fast_clk,
    input btnC,
    input btnU,
    input [15:0] sw,
    output [3:0] an,
    output [6:0] seg,
    output reg [15:0] led
    );
    
    wire [15:13] alarm_clock_state;
    assign alarm_clock_state = sw[15:13];

    reg [15:0] ssd_counter;
    reg [3:0] ssd_display;
    reg [3:0] ssd_display_value;

    reg [13:0] normal_ac_counter;
    reg [13:0] set_ac_counter;
    reg [13:0] set_ac_counter_saved;
    reg [13:0] current_ac_counter;
    reg [13:0] stopwatch_ac_counter;
    reg [13:0] kitchen_timer_ac_counter;
    reg ac_alarm_met;
    reg stopwatch_switch;
    reg kitchen_timer_switch;
    reg kitchen_timer_ac_counter_done;
    reg [15:0] led_all_toggle;

    reg [6:0] ssd_display_out;
    reg [31:0] led_blink_counter;

    initial begin
        ssd_counter = 0;
        ssd_display = 0;
        normal_ac_counter = 0;
        set_ac_counter = 1200;
        stopwatch_ac_counter = 0;
        ac_alarm_met = 0;
        kitchen_timer_ac_counter_done = 0;
        stopwatch_switch = 0;
        kitchen_timer_switch = 0;
        kitchen_timer_ac_counter = 9959;
        led_all_toggle = 16'b1111_1111_1111_1111;
        led_blink_counter = 0;
    end

    always @(posedge fast_clk ) begin
        ssd_counter <= ssd_counter + 1;
        if (ssd_counter < 13000*1) begin
            ssd_display <= 4'b1110;
            ssd_display_value <= (((current_ac_counter%1000)%100)%10);
        end
        else if (ssd_counter < 13000*2) begin
            ssd_display <= 4'b1101;
            ssd_display_value <= (((current_ac_counter%1000)%100)/10);
        end
        else if (ssd_counter < 13000*3) begin
            ssd_display <= 4'b1011;
            ssd_display_value <= (((current_ac_counter%1000)/100));
        end
        else if (ssd_counter < 13000*4) begin
            ssd_display <= 4'b0111;
            ssd_display_value <= (((current_ac_counter/1000)));
        end
        else begin
            ssd_counter <= 0;
        end
    end
    

    always @(posedge clk ) begin
        led_blink_counter <= led_blink_counter + 1;
        if (led_blink_counter >= 25) begin
            led_blink_counter <= 0;
            led_all_toggle <= ~led_all_toggle;
        end
        case (alarm_clock_state)
            3'b000: begin
                normal_ac_counter <= normal_ac_counter + 1;
                current_ac_counter <= normal_ac_counter;
                if (normal_ac_counter == set_ac_counter_saved) begin
                    ac_alarm_met <= 1;
                end
                if (ac_alarm_met == 1) begin
                    led <= led_all_toggle;
                    if (btnC == 1) begin
                        led <= 0;
                        led_all_toggle <= 16'b1111_1111_1111_1111;
                        ac_alarm_met <= 0;
                        set_ac_counter_saved <= -1;
                    end
                end


                if (normal_ac_counter < 100) begin
                    normal_ac_counter <= 100;
                end
                if (normal_ac_counter > 159 && normal_ac_counter < 200) begin
                    normal_ac_counter <= 200;
                end
                if (normal_ac_counter > 259 && normal_ac_counter < 300) begin
                    normal_ac_counter <= 300;
                end
                if (normal_ac_counter > 359 && normal_ac_counter < 400) begin
                    normal_ac_counter <= 400;
                end
                if (normal_ac_counter > 459 && normal_ac_counter < 500) begin
                    normal_ac_counter <= 500;
                end
                if (normal_ac_counter > 559 && normal_ac_counter < 600) begin
                    normal_ac_counter <= 600;
                end
                if (normal_ac_counter > 659 && normal_ac_counter < 700) begin
                    normal_ac_counter <= 700;
                end
                if (normal_ac_counter > 759 && normal_ac_counter < 800) begin
                    normal_ac_counter <= 800;
                end
                if (normal_ac_counter > 859 && normal_ac_counter < 900) begin
                    normal_ac_counter <= 900;
                end
                if (normal_ac_counter > 959 && normal_ac_counter < 1000) begin
                    normal_ac_counter <= 1000;
                end
                if (normal_ac_counter > 1059 && normal_ac_counter < 1100) begin
                    normal_ac_counter <= 1100;
                end
                if (normal_ac_counter > 1159 && normal_ac_counter < 1200) begin
                    normal_ac_counter <= 1200;
                end
                if (normal_ac_counter > 1259 && normal_ac_counter < 1300) begin
                    normal_ac_counter <= 100;
                end
            end
            3'b100: begin
                if (btnC == 1) begin
                    set_ac_counter_saved <= set_ac_counter;
                end
                if (btnU == 1) begin
                    normal_ac_counter <= sw[10:0];
                end
                current_ac_counter <= set_ac_counter;



                if (sw[10:0] <1300 && sw[10:0] >= 0) begin
                    if (sw[10:0] < 100) begin
                        set_ac_counter <= 100;
                    end
                    else if (sw[10:0] > 159 && sw[10:0] < 200) begin
                        set_ac_counter <= 159;
                    end
                    else if (sw[10:0] > 259 && sw[10:0] < 300) begin
                        set_ac_counter <= 259;
                    end
                    else if (sw[10:0] > 359 && sw[10:0] < 400) begin
                        set_ac_counter <= 359;
                    end
                    else if (sw[10:0] > 459 && sw[10:0] < 500) begin
                        set_ac_counter <= 459;
                    end
                    else if (sw[10:0] > 559 && sw[10:0] < 600) begin
                        set_ac_counter <= 559;
                    end
                    else if (sw[10:0] > 659 && sw[10:0] < 700) begin
                        set_ac_counter <= 659;
                    end
                    else if (sw[10:0] > 759 && sw[10:0] < 800) begin
                        set_ac_counter <= 759;
                    end
                    else if (sw[10:0] > 859 && sw[10:0] < 900) begin
                        set_ac_counter <= 859;
                    end
                    else if (sw[10:0] > 959 && sw[10:0] < 1000) begin
                        set_ac_counter <= 959;
                    end
                    else if (sw[10:0] > 1059 && sw[10:0] < 1100) begin
                        set_ac_counter <= 1059;
                    end
                    else if (sw[10:0] > 1159 && sw[10:0] < 1200) begin
                        set_ac_counter <= 1159;
                    end
                    else if (sw[10:0] > 1259) begin
                        set_ac_counter <= 1259;
                    end
                    else begin
                        set_ac_counter <= sw[10:0];
                    end
                end
            end
            3'b110: begin
                //current_ac_counter <= stopwatch_ac_counter;
                if (btnU == 1) begin
                    stopwatch_ac_counter <= 0;
                    current_ac_counter <= 0;
                end
                if (btnC == 1) begin
                    stopwatch_switch <= ~stopwatch_switch;
                end
                if (stopwatch_switch == 1) begin
                    stopwatch_ac_counter <= stopwatch_ac_counter + 1;
                    if (stopwatch_ac_counter > 9959) begin
                        stopwatch_ac_counter <= 9959;
                        current_ac_counter <= 9959;
                    end
                    else begin
                        if ((((stopwatch_ac_counter%1000)%100)%10) == 9) begin
                            if ((((stopwatch_ac_counter%1000)%100)/10) == 5) begin
                                stopwatch_ac_counter <= stopwatch_ac_counter + 41;
                                current_ac_counter <= stopwatch_ac_counter;
                            end
                        end
                        else begin
                            current_ac_counter <= stopwatch_ac_counter;
                            
                        end
                    end
                end
            end
            3'b001: begin
                // if (btnU == 1) begin
                //     kitchen_timer_ac_counter <= 0;
                //     current_ac_counter <= 0;
                // end
                if (btnC == 1) begin
                    kitchen_timer_switch <= ~kitchen_timer_switch;
                end
                if (kitchen_timer_ac_counter == 0) begin
                    if ( kitchen_timer_ac_counter_done == 0) begin
                        ac_alarm_met <= 1;
                    end
                end
                if (ac_alarm_met == 1) begin
                    led <= led_all_toggle;
                    if (btnU == 1) begin
                        led <= 0;
                        led_all_toggle <= 16'b1111_1111_1111_1111;
                        ac_alarm_met <= 0;
                        kitchen_timer_ac_counter_done <= 1;
                    end
                end
                if (kitchen_timer_switch == 1 && sw[12] == 0) begin
                    if (kitchen_timer_ac_counter == 1) begin
                        kitchen_timer_ac_counter <= 0;
                        current_ac_counter <= 0;
                    end
                    else if (kitchen_timer_ac_counter < 0) begin
                        kitchen_timer_ac_counter <= 0;
                        current_ac_counter <= 0;
                    end
                    else begin
                        if (kitchen_timer_ac_counter != 1 && kitchen_timer_ac_counter != 0) begin
                            kitchen_timer_ac_counter <= kitchen_timer_ac_counter - 1;
                            if ((((kitchen_timer_ac_counter%1000)%100)%10) == 0 && kitchen_timer_ac_counter != 0) begin
                                if ((((kitchen_timer_ac_counter%1000)%100)/10) == 0) begin
                                    kitchen_timer_ac_counter <= kitchen_timer_ac_counter - 41;
                                    current_ac_counter <= kitchen_timer_ac_counter;
                                end
                            end
                            else if ((((kitchen_timer_ac_counter%1000)%100)/10) > 5 && kitchen_timer_ac_counter != 0) begin
                                kitchen_timer_ac_counter <= (((kitchen_timer_ac_counter/1000)))*1000 + (((kitchen_timer_ac_counter%1000)/100))*100 + 59;
                            end
                            else begin
                                current_ac_counter <= kitchen_timer_ac_counter;
                            end
                        end
                    end
                end
                if (kitchen_timer_switch == 0 && sw[12] == 1) begin
                    kitchen_timer_ac_counter_done <= 0;
                    current_ac_counter <= kitchen_timer_ac_counter;
                    if ((((sw[11:0]%1000)%100)/10) > 5 && sw[11:0] != 0) begin
                        kitchen_timer_ac_counter <= (((sw[11:0]/1000)))*1000 + (((sw[11:0]%1000)/100))*100 + 59;
                    end
                    else begin
                        if (sw[11:0] > 0) begin
                            kitchen_timer_ac_counter <= sw[11:0];
                        end
                    end
                end
            end
        endcase
    end

    always @(posedge fast_clk ) begin
        case (ssd_display_value)
            0:ssd_display_out <= 7'b1000000;////0000												   __					
			1:ssd_display_out <= 7'b1111001;////0001												f/	  /b
			2:ssd_display_out <= 7'b0100100;////0010												  g__	
			3:ssd_display_out <= 7'b0110000;////0011										 	 e /   /c
			4:ssd_display_out <= 7'b0011001;////0100												 __
			5:ssd_display_out <= 7'b0010010;////0101                                               d  
			6:ssd_display_out <= 7'b0000010;////0110
			7:ssd_display_out <= 7'b1111000;////0111
			8:ssd_display_out <= 7'b0000000;////1000
			9:ssd_display_out <= 7'b0010000;////1001            default:  
        endcase
    end
    
    assign seg = ssd_display_out;
    assign an = ssd_display;
endmodule