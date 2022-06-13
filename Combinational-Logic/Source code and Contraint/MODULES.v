`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2021 01:06:12 AM
// Design Name: 
// Module Name: switches_to_sevenseg
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

module hex_display (
    input [3:0] value, // value will decide hex on 7 seg
    output reg [6:0] seven_segment, // output of seven seg
    output [3:0] anodes // far right seven seg will only be used
);
/*
    From MSB to LSB
    GFEDCBA is the order of bits corresponding to seven seg display
    the following comment is from diligent 

    //////////////gfedcba////////////////////////////////////////////              a
    0:a_to_g = 7'b1000000;////0000												   __					
    1:a_to_g = 7'b1111001;////0001												f/	  /b
    2:a_to_g = 7'b0100100;////0010												  g
    //                                                                           __	
    3:a_to_g = 7'b0110000;////0011										 	 e /   /c
    4:a_to_g = 7'b0011001;////0100												 __
    5:a_to_g = 7'b0010010;////0101                                               d  
*/
    assign anodes = 4'b1110; //FAR RIGHT SEV SEG DISPLAY
    always @(*) begin
        case (value)
            4'b0000: seven_segment = 7'b100_0000; // "0"     
            4'b0001: seven_segment = 7'b111_1001; // "1" 
            4'b0010: seven_segment = 7'b010_0100; // "2" 
            4'b0011: seven_segment = 7'b011_0000; // "3" 
            4'b0100: seven_segment = 7'b001_1001; // "4" 
            4'b0101: seven_segment = 7'b001_0010; // "5" 
            4'b0110: seven_segment = 7'b000_0010; // "6" 
            4'b0111: seven_segment = 7'b111_1000; // "7" 
            4'b1000: seven_segment = 7'b000_0000; // "8"     
            4'b1001: seven_segment = 7'b001_0000; // "9"
            4'b1010: seven_segment = 7'b000_1000; // "A"
            4'b1011: seven_segment = 7'b000_0011; // "b"
            4'b1100: seven_segment = 7'b100_0110; // "c"
            4'b1101: seven_segment = 7'b010_0001; // "d"
            4'b1110: seven_segment = 7'b000_0110; // "e"
            4'b1111: seven_segment = 7'b000_1110; // "f"
            default: seven_segment = 7'b000_0000; // "0"
        endcase
    end
endmodule

module switches_to_hex (
    input [9:0] switches,
    output reg [3:0] value
);
    always @(*) begin
        if (switches[9:8] == 2'b00) begin
            value = switches[3:0]; // far right switches outputted
        end
    end    
endmodule

module switches_xor (
    input [9:0] switches,
    output reg [3:0] led,
    output reg [3:0] clear // only purpose is to send zero to display_hex
);
    reg [3:0] xor_value;
    wire [3:0] a = switches [3:0];
    wire [7:4] b = switches [7:4];
    always @(*) begin
        if (switches[9:8] == 2'b01) begin
            xor_value = a ^ b;
            led = xor_value;
            clear = 4'b0000;
        end
        else begin
            led = 4'b0000;
        end 
    end
endmodule 


module switches_addition (
    input [9:0] switches,
    input btn_center,
    output reg [3:0] value
);
    reg [5:0] sum;
    wire [3:0] a = switches [3:0];
    wire [7:4] b = switches [7:4];
    always @(*) begin
        if (switches[9:8] == 2'b10) begin
            if (btn_center == 1'b1) begin
                sum = a + b;
                value = sum[3:0];
            end
        end
    end
endmodule

module switches_auto_counter (
    input clk,
    input [9:0] switches,
    output reg [3:0] value
);
    reg [3:0]counter = 4'b1111; //counter to decrement each posedge
    always @(posedge clk) begin
        if(counter > 0) begin
            value <= counter;
            counter <= counter - 4'b0001;
        end
        else begin
            counter <= 4'b1111;
            value <= counter;
        end
    end
endmodule

module clock_divider(
        input clk,
        output reg clk_new
    );
    reg [31:0] counter = 0;
    always @(posedge clk) begin
        if(counter == 50_000_000) begin
            counter <= 0;
            clk_new = ~clk_new;
        end
        else begin
            counter <= counter + 1;
        end
    end
endmodule
