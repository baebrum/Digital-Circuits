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


module switches_to_sevenseg(
    input  [3:0] switches, // BOTTOM RIGHT SWITCHES OF BASYS3
    output reg [6:0] seven_segment,
    output [3:0] anodes

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
    case (switches)
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
        default: seven_segment = 7'b100_0000; // "0"
    endcase
end
endmodule
