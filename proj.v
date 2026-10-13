// Copyright (C) 2025  Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Altera and sold by Altera or its authorized distributors.  Please
// refer to the Altera Software License Subscription Agreements 
// on the Quartus Prime software download page.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 24.1std.0 Build 1077 03/04/2025 SC Lite Edition"
// CREATED		"Tue Oct 13 14:48:07 2026"

module proj(
	PIN_U13,
	PIN_V13,
	PIN_M9,
	PIN_U7,
	PIN_AA2,
	PIN_AA1,
	PIN_W2,
	PIN_Y3,
	PIN_N2
);


input wire	PIN_U13;
input wire	PIN_V13;
input wire	PIN_M9;
input wire	PIN_U7;
output wire	PIN_AA2;
output wire	PIN_AA1;
output wire	PIN_W2;
output wire	PIN_Y3;
output wire	PIN_N2;

wire	[5:0] Alvo;
wire	B2;
wire	[4:0] D;
wire	R;
wire	[1:0] reg3;
wire	[1:0] S;
wire	use_reg2;
wire	W;
wire	SYNTHESIZED_WIRE_35;
wire	[5:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_6;
wire	[4:0] SYNTHESIZED_WIRE_38;
wire	[1:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	[4:0] SYNTHESIZED_WIRE_20;
wire	[1:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[15:0] SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;

assign	SYNTHESIZED_WIRE_22 = 1;




lpm_rom_0	b2v_inst(
	.outclock(SYNTHESIZED_WIRE_35),
	.address(SYNTHESIZED_WIRE_1),
	.q(SYNTHESIZED_WIRE_27));


contador	b2v_inst1(
	.jump(SYNTHESIZED_WIRE_2),
	.clock(SYNTHESIZED_WIRE_35),
	.rst(SYNTHESIZED_WIRE_36),
	.alvo(Alvo),
	.C(SYNTHESIZED_WIRE_1));

assign	SYNTHESIZED_WIRE_23 = reg3[0] & SYNTHESIZED_WIRE_37 & reg3[1];


reg	b2v_inst13(
	.Control(SYNTHESIZED_WIRE_6),
	.Reset(SYNTHESIZED_WIRE_36),
	.clock(SYNTHESIZED_WIRE_35),
	.Din(SYNTHESIZED_WIRE_38),
	.Dout(R[0:0][4:0]));


lpm_mux_1	b2v_inst14(
	
	
	
	.data(R),
	.sel(SYNTHESIZED_WIRE_10),
	.result(SYNTHESIZED_WIRE_20));


lpm_mux_2	b2v_inst15(
	
	
	
	.data(R),
	.sel(B2[1:1][1:0]),
	.result(B2[0:0][4:0]));


reg	b2v_inst16(
	.Control(SYNTHESIZED_WIRE_11),
	.Reset(SYNTHESIZED_WIRE_36),
	.clock(SYNTHESIZED_WIRE_35),
	.Din(SYNTHESIZED_WIRE_38),
	.Dout(R[1:1][4:0]));


lpm_mux_3	b2v_inst17(
	
	
	
	.data(B2),
	.sel(use_reg2),
	.result(W[0:0][4:0]));


lpm_mux_4	b2v_inst18(
	
	
	
	.data(W),
	.sel(SYNTHESIZED_WIRE_15),
	.result(SYNTHESIZED_WIRE_38));


reg	b2v_inst19(
	.Control(SYNTHESIZED_WIRE_16),
	.Reset(SYNTHESIZED_WIRE_36),
	.clock(SYNTHESIZED_WIRE_35),
	.Din(SYNTHESIZED_WIRE_38),
	.Dout(R[2:2][4:0]));


ula_5bits	b2v_inst2(
	.a(SYNTHESIZED_WIRE_20),
	.b(W[0:0][4:0]),
	.sel(SYNTHESIZED_WIRE_21),
	.res(W[1:1][4:0]));


debouncer	b2v_inst20(
	.rst_n(SYNTHESIZED_WIRE_22),
	.inb(PIN_U7),
	.clk(PIN_M9),
	.outb(SYNTHESIZED_WIRE_35));
	defparam	b2v_inst20.DELAY_BITS = 16;


reg	b2v_inst21(
	.Control(SYNTHESIZED_WIRE_23),
	.Reset(SYNTHESIZED_WIRE_36),
	.clock(SYNTHESIZED_WIRE_35),
	.Din(SYNTHESIZED_WIRE_38),
	.Dout(R[3:3][4:0]));

assign	SYNTHESIZED_WIRE_28 =  ~reg3[0];

assign	SYNTHESIZED_WIRE_30 =  ~reg3[1];


uc	b2v_inst27(
	.Instrucao(SYNTHESIZED_WIRE_27),
	.flag_ula(SYNTHESIZED_WIRE_15),
	.use_reg2(use_reg2),
	.Write(SYNTHESIZED_WIRE_37),
	.Reset(SYNTHESIZED_WIRE_36),
	.res_jump(Alvo[5]),
	.jump(SYNTHESIZED_WIRE_2),
	.reg1(SYNTHESIZED_WIRE_10),
	.reg2_imm(Alvo[4:0]),
	.reg3(reg3),
	.sel_ula(SYNTHESIZED_WIRE_21));

assign	SYNTHESIZED_WIRE_33 =  ~reg3[0];

assign	SYNTHESIZED_WIRE_32 =  ~reg3[1];


lpm_mux_5	b2v_inst4(
	
	
	
	.data(R),
	.sel(S),
	.result(D));


assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_28 & SYNTHESIZED_WIRE_37 & SYNTHESIZED_WIRE_30;

assign	SYNTHESIZED_WIRE_11 = reg3[0] & SYNTHESIZED_WIRE_37 & SYNTHESIZED_WIRE_32;

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_33 & SYNTHESIZED_WIRE_37 & reg3[1];

assign	PIN_AA2 = D[0];
assign	PIN_AA1 = D[1];
assign	PIN_W2 = D[2];
assign	PIN_Y3 = D[3];
assign	PIN_N2 = D[4];
assign	S[0] = PIN_U13;
assign	S[1] = PIN_V13;

endmodule

module lpm_mux_1(data,sel,result);
/* synthesis black_box */

input data;
input [1:0] sel;
output [4:0] result;

endmodule

module lpm_mux_2(data,sel,result);
/* synthesis black_box */

input data;
input [1:0] sel;
output [4:0] result;

endmodule

module lpm_mux_3(data,sel,result);
/* synthesis black_box */

input data;
input [0:0] sel;
output [4:0] result;

endmodule

module lpm_mux_4(data,sel,result);
/* synthesis black_box */

input data;
input [0:0] sel;
output [4:0] result;

endmodule

module lpm_mux_5(data,sel,result);
/* synthesis black_box */

input data;
input [1:0] sel;
output [4:0] result;

endmodule

module lpm_rom_0(outclock,address,q);
/* synthesis black_box */

input outclock;
input [5:0] address;
output [15:0] q;

endmodule
