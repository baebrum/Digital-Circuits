`timescale 1ns / 1ps
/*********************************************************************************
    Company: 
    Engineer: 

    Create Date: 03/15/2021 11:17:42 AM
    Design Name: 
    Module Name: sevenSegDisplay
    Project Name: 
    Target Devices: 
    Tool Versions: 
    Description: 

    Dependencies: 

    Revision:
    Revision 0.01 - File Created
    Additional Comments:

*********************************************************************************/


module sevenSegDisplay (
    input clk,
    input [2:0] state,
    input [31:0] visual_counter,
    output [3:0] an,
    output [6:0]seg
);

    localparam choosing_diff = 0;
    localparam playing_game = 1;
    localparam getting_rand_sequence = 2;
    localparam simon_shows = 3;
    localparam show_results = 4;
    localparam reset = 5;



    reg [15:0] ssd_counter;
    reg [3:0] ssd_display;
    reg [3:0] ssd_display_value;
    reg [6:0] ssd_display_out;

    initial begin
        ssd_counter = 0;
        ssd_display = 0; 
    end

    always @(posedge clk ) begin
        case (state)
            playing_game,
            show_results: begin
                ssd_counter <= ssd_counter + 1;
                if (ssd_counter < 13000*1) begin
                    ssd_display <= 4'b1110;
                    ssd_display_value <= (((visual_counter%1000)%100)%10);
                end
                else if (ssd_counter < 13000*2) begin
                    ssd_display <= 4'b1101;
                    ssd_display_value <= (((visual_counter%1000)%100)/10);
                end
                else if (ssd_counter < 13000*3) begin
                    ssd_display <= 4'b1011;
                    ssd_display_value <= (((visual_counter%1000)/100));
                end
                else if (ssd_counter < 13000*4) begin
                    ssd_display <= 4'b0111;
                    ssd_display_value <= (((visual_counter/1000)));
                end
                else begin
                    ssd_counter <= 0;
                end
            end
            
        endcase
    end

// gfedcba format and active low    
    always @(posedge clk ) begin
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
