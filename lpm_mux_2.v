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


module lpm_mux_2(data,sel,result);
input data;
input [1:0] sel;
output [4:0] result;

lpm_mux	lpm_instance(.data(data),.sel(sel),.result(result));
	defparam	lpm_instance.LPM_SIZE = 4;
	defparam	lpm_instance.LPM_WIDTH = 5;
	defparam	lpm_instance.LPM_WIDTHS = 2;

endmodule
