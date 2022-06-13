// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Apr 21 13:06:32 2021
// Host        : DESKTOP-2NIFRNL running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/Carranza/Documents/Verilog_Projects/COMPE470L_SimonSays_April/COMPE470L_SimonSays_April.sim/sim_1/impl/func/xsim/tb_top_func_impl.v
// Design      : Top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module LFSR
   (Q,
    E,
    CLK);
  output [7:0]Q;
  input [0:0]E;
  input CLK;

  wire CLK;
  wire [0:0]E;
  wire [7:0]Q;
  wire r_XNOR;
  wire r_XNOR_reg_i_1_n_0;

  FDRE #(
    .INIT(1'b0)) 
    \r_LFSR_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(r_XNOR),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_LFSR_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(Q[0]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_LFSR_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(Q[1]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_LFSR_reg[4] 
       (.C(CLK),
        .CE(E),
        .D(Q[2]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_LFSR_reg[5] 
       (.C(CLK),
        .CE(E),
        .D(Q[3]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_LFSR_reg[6] 
       (.C(CLK),
        .CE(E),
        .D(Q[4]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_LFSR_reg[7] 
       (.C(CLK),
        .CE(E),
        .D(Q[5]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_LFSR_reg[8] 
       (.C(CLK),
        .CE(E),
        .D(Q[6]),
        .Q(Q[7]),
        .R(1'b0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    r_XNOR_reg
       (.CLR(1'b0),
        .D(r_XNOR_reg_i_1_n_0),
        .G(E),
        .GE(1'b1),
        .Q(r_XNOR));
  LUT4 #(
    .INIT(16'h9669)) 
    r_XNOR_reg_i_1
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[7]),
        .O(r_XNOR_reg_i_1_n_0));
endmodule

(* ECO_CHECKSUM = "7aae6d94" *) (* NUM_BITS = "8" *) 
(* NotValidForBitStream *)
module Top
   (clk,
    btnC,
    btnU,
    btnR,
    sw,
    an,
    seg,
    led);
  input clk;
  input btnC;
  input btnU;
  input btnR;
  input [15:0]sw;
  output [3:0]an;
  output [6:0]seg;
  output [15:0]led;

  wire [7:0]LSFR_random_jumper;
  wire LSFR_start_jumper;
  wire [3:0]an;
  wire btnC;
  wire btnC_IBUF;
  wire btnU;
  wire btnU_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [15:0]led;
  wire [15:0]led_OBUF;
  wire lopt;
  wire lopt_1;
  wire [6:0]seg;
  wire slower_clk_jumper;
  wire slower_clk_jumper_BUFG;
  wire [15:0]sw;
  wire [15:0]sw_IBUF;
  wire NLW_inst4_lopt_2_UNCONNECTED;

  OBUFT \an_OBUF[0]_inst 
       (.I(1'b0),
        .O(an[0]),
        .T(1'b1));
  OBUFT \an_OBUF[1]_inst 
       (.I(1'b0),
        .O(an[1]),
        .T(1'b1));
  OBUFT \an_OBUF[2]_inst 
       (.I(1'b0),
        .O(an[2]),
        .T(1'b1));
  OBUFT \an_OBUF[3]_inst 
       (.I(1'b0),
        .O(an[3]),
        .T(1'b1));
  IBUF btnC_IBUF_inst
       (.I(btnC),
        .O(btnC_IBUF));
  IBUF btnU_IBUF_inst
       (.I(btnU),
        .O(btnU_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  clk_div inst2
       (.CLK(clk_IBUF_BUFG),
        .slower_clk_jumper(slower_clk_jumper));
  fsm_game inst4
       (.E(LSFR_start_jumper),
        .Q(LSFR_random_jumper),
        .btnC_IBUF(btnC_IBUF),
        .btnU_IBUF(btnU_IBUF),
        .led_OBUF({led_OBUF[15:13],led_OBUF[11],led_OBUF[8:0]}),
        .lopt(lopt),
        .lopt_1(lopt_1),
        .lopt_2(NLW_inst4_lopt_2_UNCONNECTED),
        .slower_clk_jumper_BUFG(slower_clk_jumper_BUFG),
        .sw_IBUF({sw_IBUF[15:14],sw_IBUF[7:0]}));
  LFSR inst5
       (.CLK(clk_IBUF_BUFG),
        .E(LSFR_start_jumper),
        .Q(LSFR_random_jumper));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \led_OBUF[10]_inst 
       (.I(lopt),
        .O(led[10]));
  OBUF \led_OBUF[11]_inst 
       (.I(led_OBUF[11]),
        .O(led[11]));
  OBUF \led_OBUF[12]_inst 
       (.I(1'b0),
        .O(led[12]));
  OBUF \led_OBUF[13]_inst 
       (.I(led_OBUF[13]),
        .O(led[13]));
  OBUF \led_OBUF[14]_inst 
       (.I(led_OBUF[14]),
        .O(led[14]));
  OBUF \led_OBUF[15]_inst 
       (.I(led_OBUF[15]),
        .O(led[15]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
  OBUF \led_OBUF[2]_inst 
       (.I(led_OBUF[2]),
        .O(led[2]));
  OBUF \led_OBUF[3]_inst 
       (.I(led_OBUF[3]),
        .O(led[3]));
  OBUF \led_OBUF[4]_inst 
       (.I(led_OBUF[4]),
        .O(led[4]));
  OBUF \led_OBUF[5]_inst 
       (.I(led_OBUF[5]),
        .O(led[5]));
  OBUF \led_OBUF[6]_inst 
       (.I(led_OBUF[6]),
        .O(led[6]));
  OBUF \led_OBUF[7]_inst 
       (.I(led_OBUF[7]),
        .O(led[7]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \led_OBUF[8]_inst 
       (.I(lopt_1),
        .O(led[8]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \led_OBUF[9]_inst 
       (.I(led_OBUF[8]),
        .O(led[9]));
  OBUFT \seg_OBUF[0]_inst 
       (.I(1'b0),
        .O(seg[0]),
        .T(1'b1));
  OBUFT \seg_OBUF[1]_inst 
       (.I(1'b0),
        .O(seg[1]),
        .T(1'b1));
  OBUFT \seg_OBUF[2]_inst 
       (.I(1'b0),
        .O(seg[2]),
        .T(1'b1));
  OBUFT \seg_OBUF[3]_inst 
       (.I(1'b0),
        .O(seg[3]),
        .T(1'b1));
  OBUFT \seg_OBUF[4]_inst 
       (.I(1'b0),
        .O(seg[4]),
        .T(1'b1));
  OBUFT \seg_OBUF[5]_inst 
       (.I(1'b0),
        .O(seg[5]),
        .T(1'b1));
  OBUFT \seg_OBUF[6]_inst 
       (.I(1'b0),
        .O(seg[6]),
        .T(1'b1));
  BUFG slower_clk_jumper_BUFG_inst
       (.I(slower_clk_jumper),
        .O(slower_clk_jumper_BUFG));
  IBUF \sw_IBUF[0]_inst 
       (.I(sw[0]),
        .O(sw_IBUF[0]));
  IBUF \sw_IBUF[14]_inst 
       (.I(sw[14]),
        .O(sw_IBUF[14]));
  IBUF \sw_IBUF[15]_inst 
       (.I(sw[15]),
        .O(sw_IBUF[15]));
  IBUF \sw_IBUF[1]_inst 
       (.I(sw[1]),
        .O(sw_IBUF[1]));
  IBUF \sw_IBUF[2]_inst 
       (.I(sw[2]),
        .O(sw_IBUF[2]));
  IBUF \sw_IBUF[3]_inst 
       (.I(sw[3]),
        .O(sw_IBUF[3]));
  IBUF \sw_IBUF[4]_inst 
       (.I(sw[4]),
        .O(sw_IBUF[4]));
  IBUF \sw_IBUF[5]_inst 
       (.I(sw[5]),
        .O(sw_IBUF[5]));
  IBUF \sw_IBUF[6]_inst 
       (.I(sw[6]),
        .O(sw_IBUF[6]));
  IBUF \sw_IBUF[7]_inst 
       (.I(sw[7]),
        .O(sw_IBUF[7]));
endmodule

module clk_div
   (slower_clk_jumper,
    CLK);
  output slower_clk_jumper;
  input CLK;

  wire CLK;
  wire clear;
  wire \clk_counter[0]_i_3_n_0 ;
  wire \clk_counter[0]_i_4_n_0 ;
  wire \clk_counter[0]_i_5_n_0 ;
  wire \clk_counter[0]_i_6_n_0 ;
  wire \clk_counter[0]_i_7_n_0 ;
  wire \clk_counter[0]_i_8_n_0 ;
  wire \clk_counter[0]_i_9_n_0 ;
  wire [31:1]clk_counter_reg;
  wire \clk_counter_reg[0]_i_2_n_0 ;
  wire \clk_counter_reg[0]_i_2_n_4 ;
  wire \clk_counter_reg[0]_i_2_n_5 ;
  wire \clk_counter_reg[0]_i_2_n_6 ;
  wire \clk_counter_reg[0]_i_2_n_7 ;
  wire \clk_counter_reg[12]_i_1_n_0 ;
  wire \clk_counter_reg[12]_i_1_n_4 ;
  wire \clk_counter_reg[12]_i_1_n_5 ;
  wire \clk_counter_reg[12]_i_1_n_6 ;
  wire \clk_counter_reg[12]_i_1_n_7 ;
  wire \clk_counter_reg[16]_i_1_n_0 ;
  wire \clk_counter_reg[16]_i_1_n_4 ;
  wire \clk_counter_reg[16]_i_1_n_5 ;
  wire \clk_counter_reg[16]_i_1_n_6 ;
  wire \clk_counter_reg[16]_i_1_n_7 ;
  wire \clk_counter_reg[20]_i_1_n_0 ;
  wire \clk_counter_reg[20]_i_1_n_4 ;
  wire \clk_counter_reg[20]_i_1_n_5 ;
  wire \clk_counter_reg[20]_i_1_n_6 ;
  wire \clk_counter_reg[20]_i_1_n_7 ;
  wire \clk_counter_reg[24]_i_1_n_0 ;
  wire \clk_counter_reg[24]_i_1_n_4 ;
  wire \clk_counter_reg[24]_i_1_n_5 ;
  wire \clk_counter_reg[24]_i_1_n_6 ;
  wire \clk_counter_reg[24]_i_1_n_7 ;
  wire \clk_counter_reg[28]_i_1_n_4 ;
  wire \clk_counter_reg[28]_i_1_n_5 ;
  wire \clk_counter_reg[28]_i_1_n_6 ;
  wire \clk_counter_reg[28]_i_1_n_7 ;
  wire \clk_counter_reg[4]_i_1_n_0 ;
  wire \clk_counter_reg[4]_i_1_n_4 ;
  wire \clk_counter_reg[4]_i_1_n_5 ;
  wire \clk_counter_reg[4]_i_1_n_6 ;
  wire \clk_counter_reg[4]_i_1_n_7 ;
  wire \clk_counter_reg[8]_i_1_n_0 ;
  wire \clk_counter_reg[8]_i_1_n_4 ;
  wire \clk_counter_reg[8]_i_1_n_5 ;
  wire \clk_counter_reg[8]_i_1_n_6 ;
  wire \clk_counter_reg[8]_i_1_n_7 ;
  wire \clk_counter_reg_n_0_[0] ;
  wire new_clk_reg_i_1_n_0;
  wire slower_clk_jumper;
  wire [2:0]\NLW_clk_counter_reg[0]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_clk_counter_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_clk_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_clk_counter_reg[20]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_clk_counter_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_counter_reg[28]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_clk_counter_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_clk_counter_reg[8]_i_1_CO_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \clk_counter[0]_i_1 
       (.I0(\clk_counter[0]_i_3_n_0 ),
        .I1(\clk_counter[0]_i_4_n_0 ),
        .I2(clk_counter_reg[29]),
        .I3(clk_counter_reg[21]),
        .I4(clk_counter_reg[25]),
        .O(clear));
  LUT6 #(
    .INIT(64'hEAAA000000000000)) 
    \clk_counter[0]_i_3 
       (.I0(\clk_counter[0]_i_6_n_0 ),
        .I1(\clk_counter[0]_i_7_n_0 ),
        .I2(clk_counter_reg[11]),
        .I3(clk_counter_reg[12]),
        .I4(clk_counter_reg[19]),
        .I5(clk_counter_reg[20]),
        .O(\clk_counter[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \clk_counter[0]_i_4 
       (.I0(clk_counter_reg[31]),
        .I1(clk_counter_reg[23]),
        .I2(clk_counter_reg[27]),
        .I3(clk_counter_reg[24]),
        .I4(\clk_counter[0]_i_8_n_0 ),
        .O(\clk_counter[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \clk_counter[0]_i_5 
       (.I0(\clk_counter_reg_n_0_[0] ),
        .O(\clk_counter[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \clk_counter[0]_i_6 
       (.I0(clk_counter_reg[13]),
        .I1(clk_counter_reg[15]),
        .I2(clk_counter_reg[18]),
        .I3(clk_counter_reg[17]),
        .I4(clk_counter_reg[16]),
        .I5(clk_counter_reg[14]),
        .O(\clk_counter[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \clk_counter[0]_i_7 
       (.I0(clk_counter_reg[10]),
        .I1(clk_counter_reg[8]),
        .I2(clk_counter_reg[9]),
        .I3(clk_counter_reg[6]),
        .I4(clk_counter_reg[7]),
        .I5(\clk_counter[0]_i_9_n_0 ),
        .O(\clk_counter[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \clk_counter[0]_i_8 
       (.I0(clk_counter_reg[26]),
        .I1(clk_counter_reg[28]),
        .I2(clk_counter_reg[22]),
        .I3(clk_counter_reg[30]),
        .O(\clk_counter[0]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hEAEAEAAA)) 
    \clk_counter[0]_i_9 
       (.I0(clk_counter_reg[5]),
        .I1(clk_counter_reg[4]),
        .I2(clk_counter_reg[3]),
        .I3(clk_counter_reg[1]),
        .I4(clk_counter_reg[2]),
        .O(\clk_counter[0]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[0]_i_2_n_7 ),
        .Q(\clk_counter_reg_n_0_[0] ),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\clk_counter_reg[0]_i_2_n_0 ,\NLW_clk_counter_reg[0]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\clk_counter_reg[0]_i_2_n_4 ,\clk_counter_reg[0]_i_2_n_5 ,\clk_counter_reg[0]_i_2_n_6 ,\clk_counter_reg[0]_i_2_n_7 }),
        .S({clk_counter_reg[3:1],\clk_counter[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[8]_i_1_n_5 ),
        .Q(clk_counter_reg[10]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[8]_i_1_n_4 ),
        .Q(clk_counter_reg[11]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[12]_i_1_n_7 ),
        .Q(clk_counter_reg[12]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_counter_reg[12]_i_1 
       (.CI(\clk_counter_reg[8]_i_1_n_0 ),
        .CO({\clk_counter_reg[12]_i_1_n_0 ,\NLW_clk_counter_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_counter_reg[12]_i_1_n_4 ,\clk_counter_reg[12]_i_1_n_5 ,\clk_counter_reg[12]_i_1_n_6 ,\clk_counter_reg[12]_i_1_n_7 }),
        .S(clk_counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[12]_i_1_n_6 ),
        .Q(clk_counter_reg[13]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[12]_i_1_n_5 ),
        .Q(clk_counter_reg[14]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[12]_i_1_n_4 ),
        .Q(clk_counter_reg[15]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[16]_i_1_n_7 ),
        .Q(clk_counter_reg[16]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_counter_reg[16]_i_1 
       (.CI(\clk_counter_reg[12]_i_1_n_0 ),
        .CO({\clk_counter_reg[16]_i_1_n_0 ,\NLW_clk_counter_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_counter_reg[16]_i_1_n_4 ,\clk_counter_reg[16]_i_1_n_5 ,\clk_counter_reg[16]_i_1_n_6 ,\clk_counter_reg[16]_i_1_n_7 }),
        .S(clk_counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[16]_i_1_n_6 ),
        .Q(clk_counter_reg[17]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[16]_i_1_n_5 ),
        .Q(clk_counter_reg[18]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[16]_i_1_n_4 ),
        .Q(clk_counter_reg[19]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[0]_i_2_n_6 ),
        .Q(clk_counter_reg[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[20]_i_1_n_7 ),
        .Q(clk_counter_reg[20]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_counter_reg[20]_i_1 
       (.CI(\clk_counter_reg[16]_i_1_n_0 ),
        .CO({\clk_counter_reg[20]_i_1_n_0 ,\NLW_clk_counter_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_counter_reg[20]_i_1_n_4 ,\clk_counter_reg[20]_i_1_n_5 ,\clk_counter_reg[20]_i_1_n_6 ,\clk_counter_reg[20]_i_1_n_7 }),
        .S(clk_counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[20]_i_1_n_6 ),
        .Q(clk_counter_reg[21]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[20]_i_1_n_5 ),
        .Q(clk_counter_reg[22]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[20]_i_1_n_4 ),
        .Q(clk_counter_reg[23]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[24]_i_1_n_7 ),
        .Q(clk_counter_reg[24]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_counter_reg[24]_i_1 
       (.CI(\clk_counter_reg[20]_i_1_n_0 ),
        .CO({\clk_counter_reg[24]_i_1_n_0 ,\NLW_clk_counter_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_counter_reg[24]_i_1_n_4 ,\clk_counter_reg[24]_i_1_n_5 ,\clk_counter_reg[24]_i_1_n_6 ,\clk_counter_reg[24]_i_1_n_7 }),
        .S(clk_counter_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[24]_i_1_n_6 ),
        .Q(clk_counter_reg[25]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[24]_i_1_n_5 ),
        .Q(clk_counter_reg[26]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[27] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[24]_i_1_n_4 ),
        .Q(clk_counter_reg[27]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[28] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[28]_i_1_n_7 ),
        .Q(clk_counter_reg[28]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_counter_reg[28]_i_1 
       (.CI(\clk_counter_reg[24]_i_1_n_0 ),
        .CO(\NLW_clk_counter_reg[28]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_counter_reg[28]_i_1_n_4 ,\clk_counter_reg[28]_i_1_n_5 ,\clk_counter_reg[28]_i_1_n_6 ,\clk_counter_reg[28]_i_1_n_7 }),
        .S(clk_counter_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[29] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[28]_i_1_n_6 ),
        .Q(clk_counter_reg[29]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[0]_i_2_n_5 ),
        .Q(clk_counter_reg[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[30] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[28]_i_1_n_5 ),
        .Q(clk_counter_reg[30]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[31] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[28]_i_1_n_4 ),
        .Q(clk_counter_reg[31]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[0]_i_2_n_4 ),
        .Q(clk_counter_reg[3]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[4]_i_1_n_7 ),
        .Q(clk_counter_reg[4]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_counter_reg[4]_i_1 
       (.CI(\clk_counter_reg[0]_i_2_n_0 ),
        .CO({\clk_counter_reg[4]_i_1_n_0 ,\NLW_clk_counter_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_counter_reg[4]_i_1_n_4 ,\clk_counter_reg[4]_i_1_n_5 ,\clk_counter_reg[4]_i_1_n_6 ,\clk_counter_reg[4]_i_1_n_7 }),
        .S(clk_counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[4]_i_1_n_6 ),
        .Q(clk_counter_reg[5]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[4]_i_1_n_5 ),
        .Q(clk_counter_reg[6]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[4]_i_1_n_4 ),
        .Q(clk_counter_reg[7]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[8]_i_1_n_7 ),
        .Q(clk_counter_reg[8]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_counter_reg[8]_i_1 
       (.CI(\clk_counter_reg[4]_i_1_n_0 ),
        .CO({\clk_counter_reg[8]_i_1_n_0 ,\NLW_clk_counter_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_counter_reg[8]_i_1_n_4 ,\clk_counter_reg[8]_i_1_n_5 ,\clk_counter_reg[8]_i_1_n_6 ,\clk_counter_reg[8]_i_1_n_7 }),
        .S(clk_counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_counter_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clk_counter_reg[8]_i_1_n_6 ),
        .Q(clk_counter_reg[9]),
        .R(clear));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFE)) 
    new_clk_reg_i_1
       (.I0(\clk_counter[0]_i_3_n_0 ),
        .I1(\clk_counter[0]_i_4_n_0 ),
        .I2(clk_counter_reg[29]),
        .I3(clk_counter_reg[21]),
        .I4(clk_counter_reg[25]),
        .I5(slower_clk_jumper),
        .O(new_clk_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    new_clk_reg_reg
       (.C(CLK),
        .CE(1'b1),
        .D(new_clk_reg_i_1_n_0),
        .Q(slower_clk_jumper),
        .R(1'b0));
endmodule

module fsm_game
   (E,
    led_OBUF,
    slower_clk_jumper_BUFG,
    btnU_IBUF,
    sw_IBUF,
    btnC_IBUF,
    Q,
    lopt,
    lopt_1,
    lopt_2);
  output [0:0]E;
  output [12:0]led_OBUF;
  input slower_clk_jumper_BUFG;
  input btnU_IBUF;
  input [9:0]sw_IBUF;
  input btnC_IBUF;
  input [7:0]Q;
  output lopt;
  output lopt_1;
  output lopt_2;

  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire \FSM_sequential_state[1]_i_4_n_0 ;
  wire LSFR_start_i_1_n_0;
  wire [7:0]Q;
  wire btnC_IBUF;
  wire btnU_IBUF;
  wire difficulty_chosen;
  wire difficulty_chosen_i_1_n_0;
  wire difficulty_chosen_i_2_n_0;
  wire [31:1]easy_counter0;
  wire easy_counter0_carry__0_n_0;
  wire easy_counter0_carry__1_n_0;
  wire easy_counter0_carry__2_n_0;
  wire easy_counter0_carry__3_n_0;
  wire easy_counter0_carry__4_n_0;
  wire easy_counter0_carry__5_n_0;
  wire easy_counter0_carry_n_0;
  wire \easy_counter[0]_i_1_n_0 ;
  wire \easy_counter[31]_i_10_n_0 ;
  wire \easy_counter[31]_i_11_n_0 ;
  wire \easy_counter[31]_i_1_n_0 ;
  wire \easy_counter[31]_i_2_n_0 ;
  wire \easy_counter[31]_i_3_n_0 ;
  wire \easy_counter[31]_i_4_n_0 ;
  wire \easy_counter[31]_i_5_n_0 ;
  wire \easy_counter[31]_i_6_n_0 ;
  wire \easy_counter[31]_i_7_n_0 ;
  wire \easy_counter[31]_i_8_n_0 ;
  wire \easy_counter[31]_i_9_n_0 ;
  wire \easy_counter_reg_n_0_[0] ;
  wire \easy_counter_reg_n_0_[10] ;
  wire \easy_counter_reg_n_0_[11] ;
  wire \easy_counter_reg_n_0_[12] ;
  wire \easy_counter_reg_n_0_[13] ;
  wire \easy_counter_reg_n_0_[14] ;
  wire \easy_counter_reg_n_0_[15] ;
  wire \easy_counter_reg_n_0_[16] ;
  wire \easy_counter_reg_n_0_[17] ;
  wire \easy_counter_reg_n_0_[18] ;
  wire \easy_counter_reg_n_0_[19] ;
  wire \easy_counter_reg_n_0_[1] ;
  wire \easy_counter_reg_n_0_[20] ;
  wire \easy_counter_reg_n_0_[21] ;
  wire \easy_counter_reg_n_0_[22] ;
  wire \easy_counter_reg_n_0_[23] ;
  wire \easy_counter_reg_n_0_[24] ;
  wire \easy_counter_reg_n_0_[25] ;
  wire \easy_counter_reg_n_0_[26] ;
  wire \easy_counter_reg_n_0_[27] ;
  wire \easy_counter_reg_n_0_[28] ;
  wire \easy_counter_reg_n_0_[29] ;
  wire \easy_counter_reg_n_0_[2] ;
  wire \easy_counter_reg_n_0_[30] ;
  wire \easy_counter_reg_n_0_[31] ;
  wire \easy_counter_reg_n_0_[3] ;
  wire \easy_counter_reg_n_0_[4] ;
  wire \easy_counter_reg_n_0_[5] ;
  wire \easy_counter_reg_n_0_[6] ;
  wire \easy_counter_reg_n_0_[7] ;
  wire \easy_counter_reg_n_0_[8] ;
  wire \easy_counter_reg_n_0_[9] ;
  wire easy_decrement;
  wire easy_decrement_i_1_n_0;
  wire easy_decrement_i_2_n_0;
  wire easy_decrement_reg_n_0;
  wire \fsm_led[0]_i_1_n_0 ;
  wire \fsm_led[10]_i_1_n_0 ;
  wire \fsm_led[10]_i_3_n_0 ;
  wire \fsm_led[11]_i_10_n_0 ;
  wire \fsm_led[11]_i_11_n_0 ;
  wire \fsm_led[11]_i_12_n_0 ;
  wire \fsm_led[11]_i_13_n_0 ;
  wire \fsm_led[11]_i_1_n_0 ;
  wire \fsm_led[11]_i_2_n_0 ;
  wire \fsm_led[11]_i_3_n_0 ;
  wire \fsm_led[11]_i_4_n_0 ;
  wire \fsm_led[11]_i_5_n_0 ;
  wire \fsm_led[11]_i_6_n_0 ;
  wire \fsm_led[11]_i_7_n_0 ;
  wire \fsm_led[11]_i_8_n_0 ;
  wire \fsm_led[11]_i_9_n_0 ;
  wire \fsm_led[13]_i_1_n_0 ;
  wire \fsm_led[13]_i_2_n_0 ;
  wire \fsm_led[13]_i_4_n_0 ;
  wire \fsm_led[13]_i_5_n_0 ;
  wire \fsm_led[13]_i_6_n_0 ;
  wire \fsm_led[14]_i_1_n_0 ;
  wire \fsm_led[15]_i_1_n_0 ;
  wire \fsm_led[1]_i_1_n_0 ;
  wire \fsm_led[2]_i_1_n_0 ;
  wire \fsm_led[3]_i_1_n_0 ;
  wire \fsm_led[4]_i_1_n_0 ;
  wire \fsm_led[5]_i_1_n_0 ;
  wire \fsm_led[6]_i_1_n_0 ;
  wire \fsm_led[7]_i_1_n_0 ;
  wire \fsm_led[7]_i_2_n_0 ;
  wire \fsm_led[7]_i_3_n_0 ;
  wire \fsm_led[7]_i_4_n_0 ;
  wire \fsm_led_reg[10]_lopt_replica_1 ;
  wire \fsm_led_reg[10]_lopt_replica_2_1 ;
  wire \game_difficulty[0]_i_1_n_0 ;
  wire \game_difficulty[1]_i_1_n_0 ;
  wire \game_difficulty[1]_i_2_n_0 ;
  wire \game_difficulty_reg_n_0_[0] ;
  wire \game_difficulty_reg_n_0_[1] ;
  wire in190;
  wire [31:0]in9;
  wire [12:0]led_OBUF;
  wire [7:0]led_sequence;
  wire led_sequence_0;
  wire round_finished_i_1_n_0;
  wire round_finished_i_2_n_0;
  wire round_finished_reg_n_0;
  wire [1:0]sequence_on_counter;
  wire \sequence_on_counter[2]_i_1_n_0 ;
  wire \sequence_on_counter[3]_i_1_n_0 ;
  wire \sequence_on_counter[4]_i_1_n_0 ;
  wire \sequence_on_counter[4]_i_2_n_0 ;
  wire \sequence_on_counter[4]_i_3_n_0 ;
  wire \sequence_on_counter_reg_n_0_[0] ;
  wire \sequence_on_counter_reg_n_0_[1] ;
  wire \sequence_on_counter_reg_n_0_[2] ;
  wire \sequence_on_counter_reg_n_0_[3] ;
  wire \sequence_on_counter_reg_n_0_[4] ;
  wire \show_led_delay_counter[0]_i_1_n_0 ;
  wire \show_led_delay_counter[1]_i_1_n_0 ;
  wire \show_led_delay_counter[2]_i_1_n_0 ;
  wire \show_led_delay_counter[3]_i_1_n_0 ;
  wire \show_led_delay_counter[4]_i_1_n_0 ;
  wire \show_led_delay_counter[4]_i_2_n_0 ;
  wire \show_led_delay_counter[4]_i_3_n_0 ;
  wire \show_led_delay_counter[4]_i_4_n_0 ;
  wire \show_led_delay_counter_reg_n_0_[0] ;
  wire \show_led_delay_counter_reg_n_0_[1] ;
  wire \show_led_delay_counter_reg_n_0_[2] ;
  wire \show_led_delay_counter_reg_n_0_[3] ;
  wire \show_led_delay_counter_reg_n_0_[4] ;
  wire slower_clk_jumper_BUFG;
  wire [1:0]state__0;
  wire [9:0]sw_IBUF;
  wire timer_counter0_carry__0_i_1_n_0;
  wire timer_counter0_carry__0_i_2_n_0;
  wire timer_counter0_carry__0_i_3_n_0;
  wire timer_counter0_carry__0_i_4_n_0;
  wire timer_counter0_carry__0_n_0;
  wire timer_counter0_carry__1_i_1_n_0;
  wire timer_counter0_carry__1_i_2_n_0;
  wire timer_counter0_carry__1_i_3_n_0;
  wire timer_counter0_carry__1_i_4_n_0;
  wire timer_counter0_carry__1_n_0;
  wire timer_counter0_carry__2_i_1_n_0;
  wire timer_counter0_carry__2_i_2_n_0;
  wire timer_counter0_carry__2_i_3_n_0;
  wire timer_counter0_carry__2_i_4_n_0;
  wire timer_counter0_carry__2_n_0;
  wire timer_counter0_carry__3_i_1_n_0;
  wire timer_counter0_carry__3_i_2_n_0;
  wire timer_counter0_carry__3_i_3_n_0;
  wire timer_counter0_carry__3_i_4_n_0;
  wire timer_counter0_carry__3_n_0;
  wire timer_counter0_carry__4_i_1_n_0;
  wire timer_counter0_carry__4_i_2_n_0;
  wire timer_counter0_carry__4_i_3_n_0;
  wire timer_counter0_carry__4_i_4_n_0;
  wire timer_counter0_carry__4_n_0;
  wire timer_counter0_carry__5_i_1_n_0;
  wire timer_counter0_carry__5_i_2_n_0;
  wire timer_counter0_carry__5_i_3_n_0;
  wire timer_counter0_carry__5_i_4_n_0;
  wire timer_counter0_carry__5_n_0;
  wire timer_counter0_carry__6_i_1_n_0;
  wire timer_counter0_carry__6_i_2_n_0;
  wire timer_counter0_carry__6_i_3_n_0;
  wire timer_counter0_carry__6_i_4_n_0;
  wire timer_counter0_carry_i_1_n_0;
  wire timer_counter0_carry_i_2_n_0;
  wire timer_counter0_carry_i_3_n_0;
  wire timer_counter0_carry_i_4_n_0;
  wire timer_counter0_carry_i_5_n_0;
  wire timer_counter0_carry_n_0;
  wire \timer_counter[31]_i_1_n_0 ;
  wire \timer_counter[3]_i_1_n_0 ;
  wire \timer_counter[6]_i_1_n_0 ;
  wire \timer_counter[7]_i_1_n_0 ;
  wire \timer_counter_reg_n_0_[0] ;
  wire \timer_counter_reg_n_0_[10] ;
  wire \timer_counter_reg_n_0_[11] ;
  wire \timer_counter_reg_n_0_[12] ;
  wire \timer_counter_reg_n_0_[13] ;
  wire \timer_counter_reg_n_0_[14] ;
  wire \timer_counter_reg_n_0_[15] ;
  wire \timer_counter_reg_n_0_[16] ;
  wire \timer_counter_reg_n_0_[17] ;
  wire \timer_counter_reg_n_0_[18] ;
  wire \timer_counter_reg_n_0_[19] ;
  wire \timer_counter_reg_n_0_[1] ;
  wire \timer_counter_reg_n_0_[20] ;
  wire \timer_counter_reg_n_0_[21] ;
  wire \timer_counter_reg_n_0_[22] ;
  wire \timer_counter_reg_n_0_[23] ;
  wire \timer_counter_reg_n_0_[24] ;
  wire \timer_counter_reg_n_0_[25] ;
  wire \timer_counter_reg_n_0_[26] ;
  wire \timer_counter_reg_n_0_[27] ;
  wire \timer_counter_reg_n_0_[28] ;
  wire \timer_counter_reg_n_0_[29] ;
  wire \timer_counter_reg_n_0_[2] ;
  wire \timer_counter_reg_n_0_[30] ;
  wire \timer_counter_reg_n_0_[31] ;
  wire \timer_counter_reg_n_0_[3] ;
  wire \timer_counter_reg_n_0_[4] ;
  wire \timer_counter_reg_n_0_[5] ;
  wire \timer_counter_reg_n_0_[6] ;
  wire \timer_counter_reg_n_0_[7] ;
  wire \timer_counter_reg_n_0_[8] ;
  wire \timer_counter_reg_n_0_[9] ;
  wire user_lost_i_1_n_0;
  wire user_lost_reg_n_0;
  wire user_won_i_1_n_0;
  wire user_won_reg_n_0;
  wire [2:0]NLW_easy_counter0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_easy_counter0_carry__0_CO_UNCONNECTED;
  wire [2:0]NLW_easy_counter0_carry__1_CO_UNCONNECTED;
  wire [2:0]NLW_easy_counter0_carry__2_CO_UNCONNECTED;
  wire [2:0]NLW_easy_counter0_carry__3_CO_UNCONNECTED;
  wire [2:0]NLW_easy_counter0_carry__4_CO_UNCONNECTED;
  wire [2:0]NLW_easy_counter0_carry__5_CO_UNCONNECTED;
  wire [3:0]NLW_easy_counter0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_easy_counter0_carry__6_O_UNCONNECTED;
  wire [2:0]NLW_timer_counter0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_timer_counter0_carry__0_CO_UNCONNECTED;
  wire [2:0]NLW_timer_counter0_carry__1_CO_UNCONNECTED;
  wire [2:0]NLW_timer_counter0_carry__2_CO_UNCONNECTED;
  wire [2:0]NLW_timer_counter0_carry__3_CO_UNCONNECTED;
  wire [2:0]NLW_timer_counter0_carry__4_CO_UNCONNECTED;
  wire [2:0]NLW_timer_counter0_carry__5_CO_UNCONNECTED;
  wire [3:0]NLW_timer_counter0_carry__6_CO_UNCONNECTED;

  assign lopt = \fsm_led_reg[10]_lopt_replica_1 ;
  assign lopt_1 = \fsm_led_reg[10]_lopt_replica_2_1 ;
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hACFFFF00)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(user_won_reg_n_0),
        .I1(\FSM_sequential_state[1]_i_2_n_0 ),
        .I2(state__0[1]),
        .I3(\FSM_sequential_state[1]_i_3_n_0 ),
        .I4(state__0[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h3F40)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(state__0[0]),
        .I2(\FSM_sequential_state[1]_i_3_n_0 ),
        .I3(state__0[1]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0007FFFF)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(\sequence_on_counter_reg_n_0_[0] ),
        .I1(\sequence_on_counter_reg_n_0_[1] ),
        .I2(\sequence_on_counter_reg_n_0_[2] ),
        .I3(\sequence_on_counter_reg_n_0_[3] ),
        .I4(\sequence_on_counter_reg_n_0_[4] ),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFF08)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(\show_led_delay_counter[4]_i_4_n_0 ),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(\sequence_on_counter[4]_i_3_n_0 ),
        .I4(\FSM_sequential_state[1]_i_4_n_0 ),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h04040400)) 
    \FSM_sequential_state[1]_i_4 
       (.I0(difficulty_chosen),
        .I1(btnC_IBUF),
        .I2(state__0[1]),
        .I3(sw_IBUF[8]),
        .I4(sw_IBUF[9]),
        .O(\FSM_sequential_state[1]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "playing_game:11,simon_shows:10,choosing_diff:00,getting_rand_sequence:01" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state__0[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "playing_game:11,simon_shows:10,choosing_diff:00,getting_rand_sequence:01" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state__0[1]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFB08)) 
    LSFR_start_i_1
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(E),
        .O(LSFR_start_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    LSFR_start_reg
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(LSFR_start_i_1_n_0),
        .Q(E),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h222F2220)) 
    difficulty_chosen_i_1
       (.I0(btnC_IBUF),
        .I1(state__0[1]),
        .I2(\game_difficulty[1]_i_2_n_0 ),
        .I3(difficulty_chosen_i_2_n_0),
        .I4(difficulty_chosen),
        .O(difficulty_chosen_i_1_n_0));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    difficulty_chosen_i_2
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(round_finished_reg_n_0),
        .I3(user_won_reg_n_0),
        .I4(btnU_IBUF),
        .I5(user_lost_reg_n_0),
        .O(difficulty_chosen_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    difficulty_chosen_reg
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(difficulty_chosen_i_1_n_0),
        .Q(difficulty_chosen),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 easy_counter0_carry
       (.CI(1'b0),
        .CO({easy_counter0_carry_n_0,NLW_easy_counter0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(\easy_counter_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(easy_counter0[4:1]),
        .S({\easy_counter_reg_n_0_[4] ,\easy_counter_reg_n_0_[3] ,\easy_counter_reg_n_0_[2] ,\easy_counter_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 easy_counter0_carry__0
       (.CI(easy_counter0_carry_n_0),
        .CO({easy_counter0_carry__0_n_0,NLW_easy_counter0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(easy_counter0[8:5]),
        .S({\easy_counter_reg_n_0_[8] ,\easy_counter_reg_n_0_[7] ,\easy_counter_reg_n_0_[6] ,\easy_counter_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 easy_counter0_carry__1
       (.CI(easy_counter0_carry__0_n_0),
        .CO({easy_counter0_carry__1_n_0,NLW_easy_counter0_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(easy_counter0[12:9]),
        .S({\easy_counter_reg_n_0_[12] ,\easy_counter_reg_n_0_[11] ,\easy_counter_reg_n_0_[10] ,\easy_counter_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 easy_counter0_carry__2
       (.CI(easy_counter0_carry__1_n_0),
        .CO({easy_counter0_carry__2_n_0,NLW_easy_counter0_carry__2_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(easy_counter0[16:13]),
        .S({\easy_counter_reg_n_0_[16] ,\easy_counter_reg_n_0_[15] ,\easy_counter_reg_n_0_[14] ,\easy_counter_reg_n_0_[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 easy_counter0_carry__3
       (.CI(easy_counter0_carry__2_n_0),
        .CO({easy_counter0_carry__3_n_0,NLW_easy_counter0_carry__3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(easy_counter0[20:17]),
        .S({\easy_counter_reg_n_0_[20] ,\easy_counter_reg_n_0_[19] ,\easy_counter_reg_n_0_[18] ,\easy_counter_reg_n_0_[17] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 easy_counter0_carry__4
       (.CI(easy_counter0_carry__3_n_0),
        .CO({easy_counter0_carry__4_n_0,NLW_easy_counter0_carry__4_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(easy_counter0[24:21]),
        .S({\easy_counter_reg_n_0_[24] ,\easy_counter_reg_n_0_[23] ,\easy_counter_reg_n_0_[22] ,\easy_counter_reg_n_0_[21] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 easy_counter0_carry__5
       (.CI(easy_counter0_carry__4_n_0),
        .CO({easy_counter0_carry__5_n_0,NLW_easy_counter0_carry__5_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(easy_counter0[28:25]),
        .S({\easy_counter_reg_n_0_[28] ,\easy_counter_reg_n_0_[27] ,\easy_counter_reg_n_0_[26] ,\easy_counter_reg_n_0_[25] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 easy_counter0_carry__6
       (.CI(easy_counter0_carry__5_n_0),
        .CO(NLW_easy_counter0_carry__6_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_easy_counter0_carry__6_O_UNCONNECTED[3],easy_counter0[31:29]}),
        .S({1'b0,\easy_counter_reg_n_0_[31] ,\easy_counter_reg_n_0_[30] ,\easy_counter_reg_n_0_[29] }));
  LUT1 #(
    .INIT(2'h1)) 
    \easy_counter[0]_i_1 
       (.I0(\easy_counter_reg_n_0_[0] ),
        .O(\easy_counter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFDFF00)) 
    \easy_counter[31]_i_1 
       (.I0(\easy_counter[31]_i_3_n_0 ),
        .I1(\easy_counter[31]_i_4_n_0 ),
        .I2(\easy_counter[31]_i_5_n_0 ),
        .I3(\easy_counter[31]_i_6_n_0 ),
        .I4(easy_decrement_reg_n_0),
        .O(\easy_counter[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \easy_counter[31]_i_10 
       (.I0(\easy_counter_reg_n_0_[3] ),
        .I1(\easy_counter_reg_n_0_[18] ),
        .I2(\easy_counter_reg_n_0_[13] ),
        .I3(\easy_counter_reg_n_0_[21] ),
        .O(\easy_counter[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFF8)) 
    \easy_counter[31]_i_11 
       (.I0(\easy_counter_reg_n_0_[2] ),
        .I1(\easy_counter_reg_n_0_[1] ),
        .I2(\easy_counter_reg_n_0_[26] ),
        .I3(\easy_counter_reg_n_0_[28] ),
        .O(\easy_counter[31]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \easy_counter[31]_i_2 
       (.I0(easy_decrement_reg_n_0),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(round_finished_reg_n_0),
        .I4(btnU_IBUF),
        .I5(user_won_reg_n_0),
        .O(\easy_counter[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \easy_counter[31]_i_3 
       (.I0(\easy_counter[31]_i_7_n_0 ),
        .I1(\easy_counter[31]_i_8_n_0 ),
        .I2(\easy_counter[31]_i_9_n_0 ),
        .I3(\easy_counter_reg_n_0_[9] ),
        .I4(\easy_counter_reg_n_0_[17] ),
        .I5(\easy_counter_reg_n_0_[29] ),
        .O(\easy_counter[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \easy_counter[31]_i_4 
       (.I0(\easy_counter_reg_n_0_[15] ),
        .I1(\easy_counter_reg_n_0_[12] ),
        .I2(\easy_counter_reg_n_0_[27] ),
        .I3(\easy_counter_reg_n_0_[23] ),
        .I4(\easy_counter[31]_i_10_n_0 ),
        .O(\easy_counter[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \easy_counter[31]_i_5 
       (.I0(\easy_counter_reg_n_0_[20] ),
        .I1(\easy_counter_reg_n_0_[14] ),
        .I2(\easy_counter_reg_n_0_[5] ),
        .I3(\easy_counter_reg_n_0_[4] ),
        .I4(\easy_counter[31]_i_11_n_0 ),
        .O(\easy_counter[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \easy_counter[31]_i_6 
       (.I0(user_won_reg_n_0),
        .I1(btnU_IBUF),
        .I2(round_finished_reg_n_0),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .O(\easy_counter[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \easy_counter[31]_i_7 
       (.I0(\easy_counter_reg_n_0_[7] ),
        .I1(\easy_counter_reg_n_0_[19] ),
        .I2(\easy_counter_reg_n_0_[8] ),
        .I3(\easy_counter_reg_n_0_[16] ),
        .O(\easy_counter[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \easy_counter[31]_i_8 
       (.I0(\easy_counter_reg_n_0_[22] ),
        .I1(\easy_counter_reg_n_0_[25] ),
        .I2(\easy_counter_reg_n_0_[10] ),
        .I3(\easy_counter_reg_n_0_[30] ),
        .O(\easy_counter[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \easy_counter[31]_i_9 
       (.I0(\easy_counter_reg_n_0_[11] ),
        .I1(\easy_counter_reg_n_0_[31] ),
        .I2(\easy_counter_reg_n_0_[6] ),
        .I3(\easy_counter_reg_n_0_[24] ),
        .O(\easy_counter[31]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[0] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(\easy_counter[0]_i_1_n_0 ),
        .Q(\easy_counter_reg_n_0_[0] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[10] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[10]),
        .Q(\easy_counter_reg_n_0_[10] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[11] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[11]),
        .Q(\easy_counter_reg_n_0_[11] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[12] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[12]),
        .Q(\easy_counter_reg_n_0_[12] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[13] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[13]),
        .Q(\easy_counter_reg_n_0_[13] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[14] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[14]),
        .Q(\easy_counter_reg_n_0_[14] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[15] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[15]),
        .Q(\easy_counter_reg_n_0_[15] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[16] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[16]),
        .Q(\easy_counter_reg_n_0_[16] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[17] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[17]),
        .Q(\easy_counter_reg_n_0_[17] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[18] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[18]),
        .Q(\easy_counter_reg_n_0_[18] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[19] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[19]),
        .Q(\easy_counter_reg_n_0_[19] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[1] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[1]),
        .Q(\easy_counter_reg_n_0_[1] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[20] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[20]),
        .Q(\easy_counter_reg_n_0_[20] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[21] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[21]),
        .Q(\easy_counter_reg_n_0_[21] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[22] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[22]),
        .Q(\easy_counter_reg_n_0_[22] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[23] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[23]),
        .Q(\easy_counter_reg_n_0_[23] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[24] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[24]),
        .Q(\easy_counter_reg_n_0_[24] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[25] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[25]),
        .Q(\easy_counter_reg_n_0_[25] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[26] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[26]),
        .Q(\easy_counter_reg_n_0_[26] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[27] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[27]),
        .Q(\easy_counter_reg_n_0_[27] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[28] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[28]),
        .Q(\easy_counter_reg_n_0_[28] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[29] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[29]),
        .Q(\easy_counter_reg_n_0_[29] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[2] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[2]),
        .Q(\easy_counter_reg_n_0_[2] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[30] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[30]),
        .Q(\easy_counter_reg_n_0_[30] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[31] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[31]),
        .Q(\easy_counter_reg_n_0_[31] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[3] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[3]),
        .Q(\easy_counter_reg_n_0_[3] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[4] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[4]),
        .Q(\easy_counter_reg_n_0_[4] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[5] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[5]),
        .Q(\easy_counter_reg_n_0_[5] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[6] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[6]),
        .Q(\easy_counter_reg_n_0_[6] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[7] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[7]),
        .Q(\easy_counter_reg_n_0_[7] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[8] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[8]),
        .Q(\easy_counter_reg_n_0_[8] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \easy_counter_reg[9] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\easy_counter[31]_i_2_n_0 ),
        .D(easy_counter0[9]),
        .Q(\easy_counter_reg_n_0_[9] ),
        .R(\easy_counter[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAFBAAAA)) 
    easy_decrement_i_1
       (.I0(easy_decrement),
        .I1(easy_decrement_i_2_n_0),
        .I2(timer_counter0_carry_i_1_n_0),
        .I3(\easy_counter[31]_i_6_n_0 ),
        .I4(easy_decrement_reg_n_0),
        .O(easy_decrement_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    easy_decrement_i_2
       (.I0(\fsm_led[11]_i_6_n_0 ),
        .I1(\fsm_led[11]_i_7_n_0 ),
        .I2(\timer_counter_reg_n_0_[0] ),
        .I3(\timer_counter_reg_n_0_[10] ),
        .I4(\timer_counter_reg_n_0_[11] ),
        .I5(\fsm_led[11]_i_8_n_0 ),
        .O(easy_decrement_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    easy_decrement_reg
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(easy_decrement_i_1_n_0),
        .Q(easy_decrement_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \fsm_led[0]_i_1 
       (.I0(state__0[0]),
        .I1(\show_led_delay_counter[4]_i_4_n_0 ),
        .I2(Q[0]),
        .O(\fsm_led[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF08000000)) 
    \fsm_led[10]_i_1 
       (.I0(user_lost_reg_n_0),
        .I1(btnU_IBUF),
        .I2(user_won_reg_n_0),
        .I3(round_finished_reg_n_0),
        .I4(\fsm_led[10]_i_3_n_0 ),
        .I5(\fsm_led[11]_i_1_n_0 ),
        .O(\fsm_led[10]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \fsm_led[10]_i_2 
       (.I0(round_finished_reg_n_0),
        .O(in190));
  LUT2 #(
    .INIT(4'h8)) 
    \fsm_led[10]_i_3 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .O(\fsm_led[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000000B000000)) 
    \fsm_led[11]_i_1 
       (.I0(\fsm_led[11]_i_2_n_0 ),
        .I1(\fsm_led[11]_i_3_n_0 ),
        .I2(\fsm_led[11]_i_4_n_0 ),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .I5(\fsm_led[11]_i_5_n_0 ),
        .O(\fsm_led[11]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \fsm_led[11]_i_10 
       (.I0(\timer_counter_reg_n_0_[27] ),
        .I1(\timer_counter_reg_n_0_[8] ),
        .I2(\timer_counter_reg_n_0_[26] ),
        .I3(\timer_counter_reg_n_0_[25] ),
        .O(\fsm_led[11]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \fsm_led[11]_i_11 
       (.I0(\timer_counter_reg_n_0_[17] ),
        .I1(\timer_counter_reg_n_0_[15] ),
        .I2(\timer_counter_reg_n_0_[13] ),
        .I3(\timer_counter_reg_n_0_[9] ),
        .O(\fsm_led[11]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \fsm_led[11]_i_12 
       (.I0(\timer_counter_reg_n_0_[7] ),
        .I1(\timer_counter_reg_n_0_[6] ),
        .I2(\timer_counter_reg_n_0_[18] ),
        .I3(\timer_counter_reg_n_0_[5] ),
        .O(\fsm_led[11]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \fsm_led[11]_i_13 
       (.I0(\timer_counter_reg_n_0_[31] ),
        .I1(\timer_counter_reg_n_0_[30] ),
        .I2(\timer_counter_reg_n_0_[19] ),
        .I3(\timer_counter_reg_n_0_[29] ),
        .I4(\timer_counter_reg_n_0_[12] ),
        .I5(\timer_counter_reg_n_0_[14] ),
        .O(\fsm_led[11]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA0200AAAA)) 
    \fsm_led[11]_i_2 
       (.I0(\timer_counter_reg_n_0_[0] ),
        .I1(\easy_counter[31]_i_5_n_0 ),
        .I2(\easy_counter[31]_i_4_n_0 ),
        .I3(\easy_counter[31]_i_3_n_0 ),
        .I4(easy_decrement_reg_n_0),
        .I5(\timer_counter_reg_n_0_[16] ),
        .O(\fsm_led[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \fsm_led[11]_i_3 
       (.I0(\fsm_led[11]_i_6_n_0 ),
        .I1(\timer_counter_reg_n_0_[11] ),
        .I2(\timer_counter_reg_n_0_[10] ),
        .I3(\fsm_led[11]_i_7_n_0 ),
        .I4(\fsm_led[11]_i_8_n_0 ),
        .O(\fsm_led[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hFB)) 
    \fsm_led[11]_i_4 
       (.I0(round_finished_reg_n_0),
        .I1(\game_difficulty_reg_n_0_[0] ),
        .I2(\game_difficulty_reg_n_0_[1] ),
        .O(\fsm_led[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \fsm_led[11]_i_5 
       (.I0(\fsm_led[13]_i_2_n_0 ),
        .I1(btnC_IBUF),
        .O(\fsm_led[11]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \fsm_led[11]_i_6 
       (.I0(\fsm_led[11]_i_9_n_0 ),
        .I1(\fsm_led[11]_i_10_n_0 ),
        .I2(\fsm_led[11]_i_11_n_0 ),
        .I3(\fsm_led[11]_i_12_n_0 ),
        .I4(\fsm_led[11]_i_13_n_0 ),
        .O(\fsm_led[11]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \fsm_led[11]_i_7 
       (.I0(\timer_counter_reg_n_0_[1] ),
        .I1(\timer_counter_reg_n_0_[4] ),
        .I2(\timer_counter_reg_n_0_[22] ),
        .I3(\timer_counter_reg_n_0_[16] ),
        .O(\fsm_led[11]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \fsm_led[11]_i_8 
       (.I0(\timer_counter_reg_n_0_[3] ),
        .I1(\timer_counter_reg_n_0_[2] ),
        .I2(\timer_counter_reg_n_0_[21] ),
        .I3(\timer_counter_reg_n_0_[20] ),
        .O(\fsm_led[11]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \fsm_led[11]_i_9 
       (.I0(\timer_counter_reg_n_0_[23] ),
        .I1(\timer_counter_reg_n_0_[28] ),
        .I2(\timer_counter_reg_n_0_[24] ),
        .O(\fsm_led[11]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hCCFF8C00)) 
    \fsm_led[13]_i_1 
       (.I0(\fsm_led[13]_i_2_n_0 ),
        .I1(btnC_IBUF),
        .I2(easy_decrement),
        .I3(\fsm_led[13]_i_4_n_0 ),
        .I4(led_OBUF[10]),
        .O(\fsm_led[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF6FF6)) 
    \fsm_led[13]_i_2 
       (.I0(sw_IBUF[6]),
        .I1(led_sequence[6]),
        .I2(sw_IBUF[7]),
        .I3(led_sequence[7]),
        .I4(\fsm_led[13]_i_5_n_0 ),
        .I5(\fsm_led[13]_i_6_n_0 ),
        .O(\fsm_led[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2222220202020202)) 
    \fsm_led[13]_i_3 
       (.I0(\fsm_led[10]_i_3_n_0 ),
        .I1(\fsm_led[11]_i_4_n_0 ),
        .I2(\fsm_led[11]_i_3_n_0 ),
        .I3(\timer_counter_reg_n_0_[16] ),
        .I4(timer_counter0_carry_i_1_n_0),
        .I5(\timer_counter_reg_n_0_[0] ),
        .O(easy_decrement));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \fsm_led[13]_i_4 
       (.I0(difficulty_chosen),
        .I1(btnC_IBUF),
        .I2(state__0[1]),
        .I3(sw_IBUF[9]),
        .I4(sw_IBUF[8]),
        .I5(state__0[0]),
        .O(\fsm_led[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \fsm_led[13]_i_5 
       (.I0(led_sequence[0]),
        .I1(sw_IBUF[0]),
        .I2(sw_IBUF[2]),
        .I3(led_sequence[2]),
        .I4(sw_IBUF[1]),
        .I5(led_sequence[1]),
        .O(\fsm_led[13]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \fsm_led[13]_i_6 
       (.I0(led_sequence[3]),
        .I1(sw_IBUF[3]),
        .I2(sw_IBUF[4]),
        .I3(led_sequence[4]),
        .I4(sw_IBUF[5]),
        .I5(led_sequence[5]),
        .O(\fsm_led[13]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBBFFBA0088008A)) 
    \fsm_led[14]_i_1 
       (.I0(sw_IBUF[8]),
        .I1(\fsm_led[11]_i_1_n_0 ),
        .I2(difficulty_chosen),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .I5(led_OBUF[11]),
        .O(\fsm_led[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBBFFBA0088008A)) 
    \fsm_led[15]_i_1 
       (.I0(sw_IBUF[9]),
        .I1(\fsm_led[11]_i_1_n_0 ),
        .I2(difficulty_chosen),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .I5(led_OBUF[12]),
        .O(\fsm_led[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h5530)) 
    \fsm_led[1]_i_1 
       (.I0(round_finished_reg_n_0),
        .I1(\show_led_delay_counter[4]_i_4_n_0 ),
        .I2(Q[1]),
        .I3(state__0[0]),
        .O(\fsm_led[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h5530)) 
    \fsm_led[2]_i_1 
       (.I0(round_finished_reg_n_0),
        .I1(\show_led_delay_counter[4]_i_4_n_0 ),
        .I2(Q[2]),
        .I3(state__0[0]),
        .O(\fsm_led[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h5530)) 
    \fsm_led[3]_i_1 
       (.I0(round_finished_reg_n_0),
        .I1(\show_led_delay_counter[4]_i_4_n_0 ),
        .I2(Q[3]),
        .I3(state__0[0]),
        .O(\fsm_led[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h44440F00)) 
    \fsm_led[4]_i_1 
       (.I0(round_finished_reg_n_0),
        .I1(led_OBUF[4]),
        .I2(\show_led_delay_counter[4]_i_4_n_0 ),
        .I3(Q[4]),
        .I4(state__0[0]),
        .O(\fsm_led[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h44440F00)) 
    \fsm_led[5]_i_1 
       (.I0(round_finished_reg_n_0),
        .I1(led_OBUF[5]),
        .I2(\show_led_delay_counter[4]_i_4_n_0 ),
        .I3(Q[5]),
        .I4(state__0[0]),
        .O(\fsm_led[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h44440F00)) 
    \fsm_led[6]_i_1 
       (.I0(round_finished_reg_n_0),
        .I1(led_OBUF[6]),
        .I2(\show_led_delay_counter[4]_i_4_n_0 ),
        .I3(Q[6]),
        .I4(state__0[0]),
        .O(\fsm_led[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2A2A2AAA)) 
    \fsm_led[7]_i_1 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(\fsm_led[7]_i_3_n_0 ),
        .I3(\fsm_led[7]_i_4_n_0 ),
        .I4(\fsm_led[11]_i_5_n_0 ),
        .O(\fsm_led[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h44440F00)) 
    \fsm_led[7]_i_2 
       (.I0(round_finished_reg_n_0),
        .I1(led_OBUF[7]),
        .I2(\show_led_delay_counter[4]_i_4_n_0 ),
        .I3(Q[7]),
        .I4(state__0[0]),
        .O(\fsm_led[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF7FF)) 
    \fsm_led[7]_i_3 
       (.I0(user_lost_reg_n_0),
        .I1(btnU_IBUF),
        .I2(user_won_reg_n_0),
        .I3(round_finished_reg_n_0),
        .O(\fsm_led[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF5700)) 
    \fsm_led[7]_i_4 
       (.I0(\timer_counter_reg_n_0_[0] ),
        .I1(timer_counter0_carry_i_1_n_0),
        .I2(\timer_counter_reg_n_0_[16] ),
        .I3(\fsm_led[11]_i_3_n_0 ),
        .I4(\fsm_led[11]_i_4_n_0 ),
        .O(\fsm_led[7]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[0] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[7]_i_1_n_0 ),
        .D(\fsm_led[0]_i_1_n_0 ),
        .Q(led_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[10] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[10]_i_1_n_0 ),
        .D(in190),
        .Q(led_OBUF[8]),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[10]_lopt_replica 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[10]_i_1_n_0 ),
        .D(in190),
        .Q(\fsm_led_reg[10]_lopt_replica_1 ),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[10]_lopt_replica_2 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[10]_i_1_n_0 ),
        .D(in190),
        .Q(\fsm_led_reg[10]_lopt_replica_2_1 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[11] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[11]_i_1_n_0 ),
        .D(1'b1),
        .Q(led_OBUF[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[13] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\fsm_led[13]_i_1_n_0 ),
        .Q(led_OBUF[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[14] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\fsm_led[14]_i_1_n_0 ),
        .Q(led_OBUF[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[15] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\fsm_led[15]_i_1_n_0 ),
        .Q(led_OBUF[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[1] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[7]_i_1_n_0 ),
        .D(\fsm_led[1]_i_1_n_0 ),
        .Q(led_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[2] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[7]_i_1_n_0 ),
        .D(\fsm_led[2]_i_1_n_0 ),
        .Q(led_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[3] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[7]_i_1_n_0 ),
        .D(\fsm_led[3]_i_1_n_0 ),
        .Q(led_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[4] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[7]_i_1_n_0 ),
        .D(\fsm_led[4]_i_1_n_0 ),
        .Q(led_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[5] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[7]_i_1_n_0 ),
        .D(\fsm_led[5]_i_1_n_0 ),
        .Q(led_OBUF[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[6] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[7]_i_1_n_0 ),
        .D(\fsm_led[6]_i_1_n_0 ),
        .Q(led_OBUF[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_led_reg[7] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\fsm_led[7]_i_1_n_0 ),
        .D(\fsm_led[7]_i_2_n_0 ),
        .Q(led_OBUF[7]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h8AFF8A00)) 
    \game_difficulty[0]_i_1 
       (.I0(sw_IBUF[8]),
        .I1(btnC_IBUF),
        .I2(sw_IBUF[9]),
        .I3(\game_difficulty[1]_i_2_n_0 ),
        .I4(\game_difficulty_reg_n_0_[0] ),
        .O(\game_difficulty[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8AFF8A00)) 
    \game_difficulty[1]_i_1 
       (.I0(sw_IBUF[9]),
        .I1(btnC_IBUF),
        .I2(sw_IBUF[8]),
        .I3(\game_difficulty[1]_i_2_n_0 ),
        .I4(\game_difficulty_reg_n_0_[1] ),
        .O(\game_difficulty[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000E00)) 
    \game_difficulty[1]_i_2 
       (.I0(sw_IBUF[9]),
        .I1(sw_IBUF[8]),
        .I2(state__0[1]),
        .I3(btnC_IBUF),
        .I4(difficulty_chosen),
        .I5(state__0[0]),
        .O(\game_difficulty[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \game_difficulty_reg[0] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\game_difficulty[0]_i_1_n_0 ),
        .Q(\game_difficulty_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \game_difficulty_reg[1] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\game_difficulty[1]_i_1_n_0 ),
        .Q(\game_difficulty_reg_n_0_[1] ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h04)) 
    \led_sequence[7]_i_1 
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(\show_led_delay_counter[4]_i_4_n_0 ),
        .O(led_sequence_0));
  FDRE #(
    .INIT(1'b0)) 
    \led_sequence_reg[0] 
       (.C(slower_clk_jumper_BUFG),
        .CE(led_sequence_0),
        .D(Q[0]),
        .Q(led_sequence[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_sequence_reg[1] 
       (.C(slower_clk_jumper_BUFG),
        .CE(led_sequence_0),
        .D(Q[1]),
        .Q(led_sequence[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_sequence_reg[2] 
       (.C(slower_clk_jumper_BUFG),
        .CE(led_sequence_0),
        .D(Q[2]),
        .Q(led_sequence[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_sequence_reg[3] 
       (.C(slower_clk_jumper_BUFG),
        .CE(led_sequence_0),
        .D(Q[3]),
        .Q(led_sequence[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_sequence_reg[4] 
       (.C(slower_clk_jumper_BUFG),
        .CE(led_sequence_0),
        .D(Q[4]),
        .Q(led_sequence[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_sequence_reg[5] 
       (.C(slower_clk_jumper_BUFG),
        .CE(led_sequence_0),
        .D(Q[5]),
        .Q(led_sequence[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_sequence_reg[6] 
       (.C(slower_clk_jumper_BUFG),
        .CE(led_sequence_0),
        .D(Q[6]),
        .Q(led_sequence[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_sequence_reg[7] 
       (.C(slower_clk_jumper_BUFG),
        .CE(led_sequence_0),
        .D(Q[7]),
        .Q(led_sequence[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h3C7C7C7C80808080)) 
    round_finished_i_1
       (.I0(round_finished_i_2_n_0),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(user_won_reg_n_0),
        .I4(btnU_IBUF),
        .I5(round_finished_reg_n_0),
        .O(round_finished_i_1_n_0));
  LUT5 #(
    .INIT(32'h00005700)) 
    round_finished_i_2
       (.I0(\timer_counter_reg_n_0_[0] ),
        .I1(timer_counter0_carry_i_1_n_0),
        .I2(\timer_counter_reg_n_0_[16] ),
        .I3(\fsm_led[11]_i_3_n_0 ),
        .I4(\fsm_led[11]_i_4_n_0 ),
        .O(round_finished_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    round_finished_reg
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(round_finished_i_1_n_0),
        .Q(round_finished_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \sequence_on_counter[0]_i_1 
       (.I0(state__0[1]),
        .I1(\sequence_on_counter_reg_n_0_[0] ),
        .O(sequence_on_counter[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \sequence_on_counter[1]_i_1 
       (.I0(\sequence_on_counter_reg_n_0_[1] ),
        .I1(\sequence_on_counter_reg_n_0_[0] ),
        .I2(state__0[1]),
        .O(sequence_on_counter[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \sequence_on_counter[2]_i_1 
       (.I0(state__0[1]),
        .I1(\sequence_on_counter_reg_n_0_[0] ),
        .I2(\sequence_on_counter_reg_n_0_[1] ),
        .I3(\sequence_on_counter_reg_n_0_[2] ),
        .O(\sequence_on_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \sequence_on_counter[3]_i_1 
       (.I0(state__0[1]),
        .I1(\sequence_on_counter_reg_n_0_[1] ),
        .I2(\sequence_on_counter_reg_n_0_[0] ),
        .I3(\sequence_on_counter_reg_n_0_[2] ),
        .I4(\sequence_on_counter_reg_n_0_[3] ),
        .O(\sequence_on_counter[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hA8)) 
    \sequence_on_counter[4]_i_1 
       (.I0(\sequence_on_counter[4]_i_3_n_0 ),
        .I1(\FSM_sequential_state[1]_i_2_n_0 ),
        .I2(state__0[1]),
        .O(\sequence_on_counter[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1555555540000000)) 
    \sequence_on_counter[4]_i_2 
       (.I0(state__0[1]),
        .I1(\sequence_on_counter_reg_n_0_[2] ),
        .I2(\sequence_on_counter_reg_n_0_[0] ),
        .I3(\sequence_on_counter_reg_n_0_[1] ),
        .I4(\sequence_on_counter_reg_n_0_[3] ),
        .I5(\sequence_on_counter_reg_n_0_[4] ),
        .O(\sequence_on_counter[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFD55555500000000)) 
    \sequence_on_counter[4]_i_3 
       (.I0(state__0[1]),
        .I1(user_won_reg_n_0),
        .I2(user_lost_reg_n_0),
        .I3(btnU_IBUF),
        .I4(round_finished_reg_n_0),
        .I5(state__0[0]),
        .O(\sequence_on_counter[4]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sequence_on_counter_reg[0] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\sequence_on_counter[4]_i_1_n_0 ),
        .D(sequence_on_counter[0]),
        .Q(\sequence_on_counter_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sequence_on_counter_reg[1] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\sequence_on_counter[4]_i_1_n_0 ),
        .D(sequence_on_counter[1]),
        .Q(\sequence_on_counter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sequence_on_counter_reg[2] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\sequence_on_counter[4]_i_1_n_0 ),
        .D(\sequence_on_counter[2]_i_1_n_0 ),
        .Q(\sequence_on_counter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sequence_on_counter_reg[3] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\sequence_on_counter[4]_i_1_n_0 ),
        .D(\sequence_on_counter[3]_i_1_n_0 ),
        .Q(\sequence_on_counter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sequence_on_counter_reg[4] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\sequence_on_counter[4]_i_1_n_0 ),
        .D(\sequence_on_counter[4]_i_2_n_0 ),
        .Q(\sequence_on_counter_reg_n_0_[4] ),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \show_led_delay_counter[0]_i_1 
       (.I0(\show_led_delay_counter_reg_n_0_[0] ),
        .O(\show_led_delay_counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF15FF00002A00)) 
    \show_led_delay_counter[1]_i_1 
       (.I0(\show_led_delay_counter_reg_n_0_[0] ),
        .I1(\show_led_delay_counter_reg_n_0_[4] ),
        .I2(\show_led_delay_counter_reg_n_0_[3] ),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .I5(\show_led_delay_counter_reg_n_0_[1] ),
        .O(\show_led_delay_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \show_led_delay_counter[2]_i_1 
       (.I0(\show_led_delay_counter_reg_n_0_[2] ),
        .I1(\show_led_delay_counter_reg_n_0_[0] ),
        .I2(\show_led_delay_counter_reg_n_0_[1] ),
        .O(\show_led_delay_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \show_led_delay_counter[3]_i_1 
       (.I0(\show_led_delay_counter_reg_n_0_[3] ),
        .I1(\show_led_delay_counter_reg_n_0_[2] ),
        .I2(\show_led_delay_counter_reg_n_0_[1] ),
        .I3(\show_led_delay_counter_reg_n_0_[0] ),
        .O(\show_led_delay_counter[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \show_led_delay_counter[4]_i_1 
       (.I0(\show_led_delay_counter[4]_i_4_n_0 ),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .O(\show_led_delay_counter[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \show_led_delay_counter[4]_i_2 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .O(\show_led_delay_counter[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \show_led_delay_counter[4]_i_3 
       (.I0(\show_led_delay_counter_reg_n_0_[4] ),
        .I1(\show_led_delay_counter_reg_n_0_[0] ),
        .I2(\show_led_delay_counter_reg_n_0_[1] ),
        .I3(\show_led_delay_counter_reg_n_0_[2] ),
        .I4(\show_led_delay_counter_reg_n_0_[3] ),
        .O(\show_led_delay_counter[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h88888880)) 
    \show_led_delay_counter[4]_i_4 
       (.I0(\show_led_delay_counter_reg_n_0_[3] ),
        .I1(\show_led_delay_counter_reg_n_0_[4] ),
        .I2(\show_led_delay_counter_reg_n_0_[2] ),
        .I3(\show_led_delay_counter_reg_n_0_[1] ),
        .I4(\show_led_delay_counter_reg_n_0_[0] ),
        .O(\show_led_delay_counter[4]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \show_led_delay_counter_reg[0] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\show_led_delay_counter[4]_i_2_n_0 ),
        .D(\show_led_delay_counter[0]_i_1_n_0 ),
        .Q(\show_led_delay_counter_reg_n_0_[0] ),
        .R(\show_led_delay_counter[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \show_led_delay_counter_reg[1] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\show_led_delay_counter[1]_i_1_n_0 ),
        .Q(\show_led_delay_counter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \show_led_delay_counter_reg[2] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\show_led_delay_counter[4]_i_2_n_0 ),
        .D(\show_led_delay_counter[2]_i_1_n_0 ),
        .Q(\show_led_delay_counter_reg_n_0_[2] ),
        .R(\show_led_delay_counter[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \show_led_delay_counter_reg[3] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\show_led_delay_counter[4]_i_2_n_0 ),
        .D(\show_led_delay_counter[3]_i_1_n_0 ),
        .Q(\show_led_delay_counter_reg_n_0_[3] ),
        .R(\show_led_delay_counter[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \show_led_delay_counter_reg[4] 
       (.C(slower_clk_jumper_BUFG),
        .CE(\show_led_delay_counter[4]_i_2_n_0 ),
        .D(\show_led_delay_counter[4]_i_3_n_0 ),
        .Q(\show_led_delay_counter_reg_n_0_[4] ),
        .R(\show_led_delay_counter[4]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 timer_counter0_carry
       (.CI(1'b0),
        .CO({timer_counter0_carry_n_0,NLW_timer_counter0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\timer_counter_reg_n_0_[2] ,timer_counter0_carry_i_1_n_0,\timer_counter_reg_n_0_[1] ,\timer_counter_reg_n_0_[0] }),
        .O(in9[3:0]),
        .S({timer_counter0_carry_i_2_n_0,timer_counter0_carry_i_3_n_0,timer_counter0_carry_i_4_n_0,timer_counter0_carry_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 timer_counter0_carry__0
       (.CI(timer_counter0_carry_n_0),
        .CO({timer_counter0_carry__0_n_0,NLW_timer_counter0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\timer_counter_reg_n_0_[6] ,\timer_counter_reg_n_0_[5] ,\timer_counter_reg_n_0_[4] ,\timer_counter_reg_n_0_[3] }),
        .O(in9[7:4]),
        .S({timer_counter0_carry__0_i_1_n_0,timer_counter0_carry__0_i_2_n_0,timer_counter0_carry__0_i_3_n_0,timer_counter0_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__0_i_1
       (.I0(\timer_counter_reg_n_0_[6] ),
        .I1(\timer_counter_reg_n_0_[7] ),
        .O(timer_counter0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__0_i_2
       (.I0(\timer_counter_reg_n_0_[5] ),
        .I1(\timer_counter_reg_n_0_[6] ),
        .O(timer_counter0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__0_i_3
       (.I0(\timer_counter_reg_n_0_[4] ),
        .I1(\timer_counter_reg_n_0_[5] ),
        .O(timer_counter0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__0_i_4
       (.I0(\timer_counter_reg_n_0_[3] ),
        .I1(\timer_counter_reg_n_0_[4] ),
        .O(timer_counter0_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 timer_counter0_carry__1
       (.CI(timer_counter0_carry__0_n_0),
        .CO({timer_counter0_carry__1_n_0,NLW_timer_counter0_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\timer_counter_reg_n_0_[10] ,\timer_counter_reg_n_0_[9] ,\timer_counter_reg_n_0_[8] ,\timer_counter_reg_n_0_[7] }),
        .O(in9[11:8]),
        .S({timer_counter0_carry__1_i_1_n_0,timer_counter0_carry__1_i_2_n_0,timer_counter0_carry__1_i_3_n_0,timer_counter0_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__1_i_1
       (.I0(\timer_counter_reg_n_0_[10] ),
        .I1(\timer_counter_reg_n_0_[11] ),
        .O(timer_counter0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__1_i_2
       (.I0(\timer_counter_reg_n_0_[9] ),
        .I1(\timer_counter_reg_n_0_[10] ),
        .O(timer_counter0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__1_i_3
       (.I0(\timer_counter_reg_n_0_[8] ),
        .I1(\timer_counter_reg_n_0_[9] ),
        .O(timer_counter0_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__1_i_4
       (.I0(\timer_counter_reg_n_0_[7] ),
        .I1(\timer_counter_reg_n_0_[8] ),
        .O(timer_counter0_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 timer_counter0_carry__2
       (.CI(timer_counter0_carry__1_n_0),
        .CO({timer_counter0_carry__2_n_0,NLW_timer_counter0_carry__2_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\timer_counter_reg_n_0_[14] ,\timer_counter_reg_n_0_[13] ,\timer_counter_reg_n_0_[12] ,\timer_counter_reg_n_0_[11] }),
        .O(in9[15:12]),
        .S({timer_counter0_carry__2_i_1_n_0,timer_counter0_carry__2_i_2_n_0,timer_counter0_carry__2_i_3_n_0,timer_counter0_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__2_i_1
       (.I0(\timer_counter_reg_n_0_[14] ),
        .I1(\timer_counter_reg_n_0_[15] ),
        .O(timer_counter0_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__2_i_2
       (.I0(\timer_counter_reg_n_0_[13] ),
        .I1(\timer_counter_reg_n_0_[14] ),
        .O(timer_counter0_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__2_i_3
       (.I0(\timer_counter_reg_n_0_[12] ),
        .I1(\timer_counter_reg_n_0_[13] ),
        .O(timer_counter0_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__2_i_4
       (.I0(\timer_counter_reg_n_0_[11] ),
        .I1(\timer_counter_reg_n_0_[12] ),
        .O(timer_counter0_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 timer_counter0_carry__3
       (.CI(timer_counter0_carry__2_n_0),
        .CO({timer_counter0_carry__3_n_0,NLW_timer_counter0_carry__3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\timer_counter_reg_n_0_[18] ,\timer_counter_reg_n_0_[17] ,\timer_counter_reg_n_0_[16] ,\timer_counter_reg_n_0_[15] }),
        .O(in9[19:16]),
        .S({timer_counter0_carry__3_i_1_n_0,timer_counter0_carry__3_i_2_n_0,timer_counter0_carry__3_i_3_n_0,timer_counter0_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__3_i_1
       (.I0(\timer_counter_reg_n_0_[18] ),
        .I1(\timer_counter_reg_n_0_[19] ),
        .O(timer_counter0_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__3_i_2
       (.I0(\timer_counter_reg_n_0_[17] ),
        .I1(\timer_counter_reg_n_0_[18] ),
        .O(timer_counter0_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__3_i_3
       (.I0(\timer_counter_reg_n_0_[16] ),
        .I1(\timer_counter_reg_n_0_[17] ),
        .O(timer_counter0_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__3_i_4
       (.I0(\timer_counter_reg_n_0_[15] ),
        .I1(\timer_counter_reg_n_0_[16] ),
        .O(timer_counter0_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 timer_counter0_carry__4
       (.CI(timer_counter0_carry__3_n_0),
        .CO({timer_counter0_carry__4_n_0,NLW_timer_counter0_carry__4_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\timer_counter_reg_n_0_[22] ,\timer_counter_reg_n_0_[21] ,\timer_counter_reg_n_0_[20] ,\timer_counter_reg_n_0_[19] }),
        .O(in9[23:20]),
        .S({timer_counter0_carry__4_i_1_n_0,timer_counter0_carry__4_i_2_n_0,timer_counter0_carry__4_i_3_n_0,timer_counter0_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__4_i_1
       (.I0(\timer_counter_reg_n_0_[22] ),
        .I1(\timer_counter_reg_n_0_[23] ),
        .O(timer_counter0_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__4_i_2
       (.I0(\timer_counter_reg_n_0_[21] ),
        .I1(\timer_counter_reg_n_0_[22] ),
        .O(timer_counter0_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__4_i_3
       (.I0(\timer_counter_reg_n_0_[20] ),
        .I1(\timer_counter_reg_n_0_[21] ),
        .O(timer_counter0_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__4_i_4
       (.I0(\timer_counter_reg_n_0_[19] ),
        .I1(\timer_counter_reg_n_0_[20] ),
        .O(timer_counter0_carry__4_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 timer_counter0_carry__5
       (.CI(timer_counter0_carry__4_n_0),
        .CO({timer_counter0_carry__5_n_0,NLW_timer_counter0_carry__5_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\timer_counter_reg_n_0_[26] ,\timer_counter_reg_n_0_[25] ,\timer_counter_reg_n_0_[24] ,\timer_counter_reg_n_0_[23] }),
        .O(in9[27:24]),
        .S({timer_counter0_carry__5_i_1_n_0,timer_counter0_carry__5_i_2_n_0,timer_counter0_carry__5_i_3_n_0,timer_counter0_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__5_i_1
       (.I0(\timer_counter_reg_n_0_[26] ),
        .I1(\timer_counter_reg_n_0_[27] ),
        .O(timer_counter0_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__5_i_2
       (.I0(\timer_counter_reg_n_0_[25] ),
        .I1(\timer_counter_reg_n_0_[26] ),
        .O(timer_counter0_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__5_i_3
       (.I0(\timer_counter_reg_n_0_[24] ),
        .I1(\timer_counter_reg_n_0_[25] ),
        .O(timer_counter0_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__5_i_4
       (.I0(\timer_counter_reg_n_0_[23] ),
        .I1(\timer_counter_reg_n_0_[24] ),
        .O(timer_counter0_carry__5_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 timer_counter0_carry__6
       (.CI(timer_counter0_carry__5_n_0),
        .CO(NLW_timer_counter0_carry__6_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,\timer_counter_reg_n_0_[29] ,\timer_counter_reg_n_0_[28] ,\timer_counter_reg_n_0_[27] }),
        .O(in9[31:28]),
        .S({timer_counter0_carry__6_i_1_n_0,timer_counter0_carry__6_i_2_n_0,timer_counter0_carry__6_i_3_n_0,timer_counter0_carry__6_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__6_i_1
       (.I0(\timer_counter_reg_n_0_[30] ),
        .I1(\timer_counter_reg_n_0_[31] ),
        .O(timer_counter0_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__6_i_2
       (.I0(\timer_counter_reg_n_0_[29] ),
        .I1(\timer_counter_reg_n_0_[30] ),
        .O(timer_counter0_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__6_i_3
       (.I0(\timer_counter_reg_n_0_[28] ),
        .I1(\timer_counter_reg_n_0_[29] ),
        .O(timer_counter0_carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry__6_i_4
       (.I0(\timer_counter_reg_n_0_[27] ),
        .I1(\timer_counter_reg_n_0_[28] ),
        .O(timer_counter0_carry__6_i_4_n_0));
  LUT4 #(
    .INIT(16'h10FF)) 
    timer_counter0_carry_i_1
       (.I0(\easy_counter[31]_i_5_n_0 ),
        .I1(\easy_counter[31]_i_4_n_0 ),
        .I2(\easy_counter[31]_i_3_n_0 ),
        .I3(easy_decrement_reg_n_0),
        .O(timer_counter0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry_i_2
       (.I0(\timer_counter_reg_n_0_[2] ),
        .I1(\timer_counter_reg_n_0_[3] ),
        .O(timer_counter0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry_i_3
       (.I0(timer_counter0_carry_i_1_n_0),
        .I1(\timer_counter_reg_n_0_[2] ),
        .O(timer_counter0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry_i_4
       (.I0(timer_counter0_carry_i_1_n_0),
        .I1(\timer_counter_reg_n_0_[1] ),
        .O(timer_counter0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    timer_counter0_carry_i_5
       (.I0(\timer_counter_reg_n_0_[0] ),
        .I1(timer_counter0_carry_i_1_n_0),
        .O(timer_counter0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h8000800080000000)) 
    \timer_counter[31]_i_1 
       (.I0(round_finished_reg_n_0),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(btnU_IBUF),
        .I4(user_lost_reg_n_0),
        .I5(user_won_reg_n_0),
        .O(\timer_counter[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \timer_counter[3]_i_1 
       (.I0(in9[3]),
        .I1(\timer_counter[31]_i_1_n_0 ),
        .O(\timer_counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \timer_counter[6]_i_1 
       (.I0(in9[6]),
        .I1(\timer_counter[31]_i_1_n_0 ),
        .O(\timer_counter[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \timer_counter[7]_i_1 
       (.I0(in9[7]),
        .I1(\timer_counter[31]_i_1_n_0 ),
        .O(\timer_counter[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[0] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[0]),
        .Q(\timer_counter_reg_n_0_[0] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[10] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[10]),
        .Q(\timer_counter_reg_n_0_[10] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[11] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[11]),
        .Q(\timer_counter_reg_n_0_[11] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[12] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[12]),
        .Q(\timer_counter_reg_n_0_[12] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[13] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[13]),
        .Q(\timer_counter_reg_n_0_[13] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[14] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[14]),
        .Q(\timer_counter_reg_n_0_[14] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[15] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[15]),
        .Q(\timer_counter_reg_n_0_[15] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[16] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[16]),
        .Q(\timer_counter_reg_n_0_[16] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[17] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[17]),
        .Q(\timer_counter_reg_n_0_[17] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[18] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[18]),
        .Q(\timer_counter_reg_n_0_[18] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[19] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[19]),
        .Q(\timer_counter_reg_n_0_[19] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[1] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[1]),
        .Q(\timer_counter_reg_n_0_[1] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[20] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[20]),
        .Q(\timer_counter_reg_n_0_[20] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[21] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[21]),
        .Q(\timer_counter_reg_n_0_[21] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[22] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[22]),
        .Q(\timer_counter_reg_n_0_[22] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[23] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[23]),
        .Q(\timer_counter_reg_n_0_[23] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[24] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[24]),
        .Q(\timer_counter_reg_n_0_[24] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[25] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[25]),
        .Q(\timer_counter_reg_n_0_[25] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[26] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[26]),
        .Q(\timer_counter_reg_n_0_[26] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[27] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[27]),
        .Q(\timer_counter_reg_n_0_[27] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[28] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[28]),
        .Q(\timer_counter_reg_n_0_[28] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[29] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[29]),
        .Q(\timer_counter_reg_n_0_[29] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[2] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[2]),
        .Q(\timer_counter_reg_n_0_[2] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[30] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[30]),
        .Q(\timer_counter_reg_n_0_[30] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[31] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[31]),
        .Q(\timer_counter_reg_n_0_[31] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \timer_counter_reg[3] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\timer_counter[3]_i_1_n_0 ),
        .Q(\timer_counter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[4] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[4]),
        .Q(\timer_counter_reg_n_0_[4] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[5] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[5]),
        .Q(\timer_counter_reg_n_0_[5] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \timer_counter_reg[6] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\timer_counter[6]_i_1_n_0 ),
        .Q(\timer_counter_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \timer_counter_reg[7] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(\timer_counter[7]_i_1_n_0 ),
        .Q(\timer_counter_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[8] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[8]),
        .Q(\timer_counter_reg_n_0_[8] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timer_counter_reg[9] 
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(in9[9]),
        .Q(\timer_counter_reg_n_0_[9] ),
        .R(\timer_counter[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2A0FAAAA2A2AAAAA)) 
    user_lost_i_1
       (.I0(user_lost_reg_n_0),
        .I1(btnU_IBUF),
        .I2(round_finished_reg_n_0),
        .I3(user_won_reg_n_0),
        .I4(\fsm_led[10]_i_3_n_0 ),
        .I5(round_finished_i_2_n_0),
        .O(user_lost_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    user_lost_reg
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(user_lost_i_1_n_0),
        .Q(user_lost_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h2F222F2F20222020)) 
    user_won_i_1
       (.I0(btnC_IBUF),
        .I1(round_finished_reg_n_0),
        .I2(\easy_counter[31]_i_6_n_0 ),
        .I3(\fsm_led[11]_i_5_n_0 ),
        .I4(easy_decrement),
        .I5(user_won_reg_n_0),
        .O(user_won_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    user_won_reg
       (.C(slower_clk_jumper_BUFG),
        .CE(1'b1),
        .D(user_won_i_1_n_0),
        .Q(user_won_reg_n_0),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
