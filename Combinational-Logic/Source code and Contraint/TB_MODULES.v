`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2021 01:46:58 AM
// Design Name: 
// Module Name: stimmy
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

module stimmy (
     input [9:0] sw, // switches 
     input btnC, // center button
     input clk, // clk from basys3
     output [3:0] led, // leds
     output [6:0] seg, // seven segment display
     output [3:0] an //anodes
);
     reg [3:0] display_hex; // register to store value to be displayed in seven seg
     wire [3:0]temp0; // output from using switches as hexvalue on seven seg (async)
     wire [3:0]temp1; // output from xor is zero because asingnment reequested the use of LEDS
     wire [3:0]temp2; // output from addition of two 4-bit unsigned numbers after button press 
     wire [3:0]temp3; // output hexadecmial from F to 0 using clock divider
     wire tmp_clk; // result of clock divider

     /*
     using always switch on two switches on basys because assignment requested different functions
     to be used in correspondence to two switches on board

     Visually we are only seeing one output on the seven seg because of the case statements. 
     But every other function is in action in the background
     */
     always @(sw[9:8]) begin
          case (sw[9:8])
               2'b00: begin
                    display_hex <= temp0; // switches to hex
               end
               2'b01: begin
                    display_hex <= temp1; // zero, leds are the spotlight
               end
               2'b10: begin
                    display_hex <= temp2; // LSB of addition two two binary numbers in hex
               end
               2'b11: begin 
                    display_hex <= temp3; // synchronous hex
               end
               default: begin
                    display_hex <= temp0;
               end
          endcase
     end

     hex_display inst1 (
          .value(display_hex),
          .seven_segment(seg),
          .anodes(an)
     );
     switches_to_hex inst2 (
          .switches(sw),
          .value(temp0)
     );
     switches_xor inst3 (
          .switches(sw),
          .led(led),
          .clear(temp1)
     );
     switches_addition inst4(
          .switches(sw),
          .btn_center(btnC),
          .value(temp2)
     );
     switches_auto_counter inst5(
          .switches(sw),
          .clk(tmp_clk),
          .value(temp3)
     );
     clock_divider inst6 (
          .clk(clk),
          .clk_new(tmp_clk)
     );
endmodule