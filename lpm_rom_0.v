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


module lpm_rom_0(outclock,address,q);
input outclock;
input [5:0] address;
output [15:0] q;

lpm_rom	lpm_instance(.outclock(outclock),.address(address),.q(q));
	defparam	lpm_instance.LPM_ADDRESS_CONTROL = "UNREGISTERED";
	defparam	lpm_instance.LPM_FILE = "proj.mif";
	defparam	lpm_instance.LPM_OUTDATA = "REGISTERED";
	defparam	lpm_instance.LPM_WIDTH = 16;
	defparam	lpm_instance.LPM_WIDTHAD = 6;

endmodule
