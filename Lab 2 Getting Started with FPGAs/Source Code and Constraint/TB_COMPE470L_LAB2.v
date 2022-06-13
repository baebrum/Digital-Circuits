`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2021 01:46:58 AM
// Design Name: 
// Module Name: tb_switches_to_sevenseg
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

module tb_switches_to_sevenseg(	 
// switches
	 input [3:0] sw, 
// Seven Segment Display Outputs
     output [6:0] seg,
     output [3:0] an
);

switches_to_sevenseg in1(
.switches(sw),
.seven_segment(seg),
.anodes(an)
);
endmodule