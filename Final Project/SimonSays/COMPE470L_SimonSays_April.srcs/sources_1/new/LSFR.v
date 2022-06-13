`timescale 1ns / 1ps
/*********************************************************************************
    Company: 
    Engineer: 

    Create Date: 03/15/2021 11:17:42 AM
    Design Name: 
    Module Name: LSFR
    Project Name: 
    Target Devices: 
    Tool Versions: 
    Description: 

    Dependencies: 

    Revision:
    Revision 0.01 - File Created
    Additional Comments:
*********************************************************************************/


module LFSR #(
    parameter NUM_BITS = 8
) (
    input clk,
    input LSFR_start, // will start and stop functionality of module
    input LSFR_enable,
    input seed,
    input [NUM_BITS-1:0] seed_data,
    output [NUM_BITS-1:0] LSFR_random_out,
    output LFSR_Done //
);

    reg [NUM_BITS:1] r_LFSR;
    reg r_XNOR;

    initial begin
        r_LFSR = 0;
    end

    assign LSFR_random_out = r_LFSR[NUM_BITS:1];
    assign LFSR_Done = (r_LFSR[NUM_BITS:1] == seed_data) ? 1'b1 : 1'b0;

    always @(posedge clk) begin
        if (LSFR_start) begin
            if (LSFR_enable == 1'b1) begin
                if (seed == 1'b1) begin
                    r_LFSR <= seed_data;
                end
                else begin
                    r_LFSR <= {r_LFSR[NUM_BITS-1:1], r_XNOR};
                end
            end
        end 
    end

    always @(*) begin
        if (LSFR_start) begin
            case (NUM_BITS)
                3: begin
                    r_XNOR = r_LFSR[3] ^~ r_LFSR[2];
                end
                4: begin
                    r_XNOR = r_LFSR[4] ^~ r_LFSR[3];
                end
                5: begin
                    r_XNOR = r_LFSR[5] ^~ r_LFSR[3];
                end
                6: begin
                    r_XNOR = r_LFSR[6] ^~ r_LFSR[5];
                end
                7: begin
                    r_XNOR = r_LFSR[7] ^~ r_LFSR[6];
                end
                8: begin
                    r_XNOR = r_LFSR[8] ^~ r_LFSR[6] ^~ r_LFSR[5] ^~ r_LFSR[4];
                end
                9: begin
                    r_XNOR = r_LFSR[9] ^~ r_LFSR[5];
                end
                10: begin
                    r_XNOR = r_LFSR[10] ^~ r_LFSR[7];
                end
                11: begin
                    r_XNOR = r_LFSR[11] ^~ r_LFSR[9];
                end
                12: begin
                    r_XNOR = r_LFSR[12] ^~ r_LFSR[6] ^~ r_LFSR[4] ^~ r_LFSR[1];
                end
                13: begin
                    r_XNOR = r_LFSR[13] ^~ r_LFSR[4] ^~ r_LFSR[3] ^~ r_LFSR[1];
                end
                14: begin
                    r_XNOR = r_LFSR[14] ^~ r_LFSR[5] ^~ r_LFSR[3] ^~ r_LFSR[1];
                end
                15: begin
                    r_XNOR = r_LFSR[15] ^~ r_LFSR[14];
                end
                16: begin
                    r_XNOR = r_LFSR[16] ^~ r_LFSR[15] ^~ r_LFSR[13] ^~ r_LFSR[4];
                end
            endcase
        end
    end
endmodule
