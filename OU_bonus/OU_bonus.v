module OU_bonus
(
	input clock, reset, switch,
	output [0:6] HEX3, HEX2, HEX1, HEX0
);

wire FiveSwitch;
wire [7:0] count;

FiveHzClockOnOff FiveHzClockOnOff_inst
(
	.clock(clock) ,	// input  clock_sig
	.reset(reset) ,	// input  reset_sig
	.on_off_switch(switch) ,	// input  on_off_switch_sig
	.FiveHz_out(FiveSwitch) 	// output  FiveHz_out_sig
);

Counter8Bit Counter8Bit_inst
(
	.clk(FiveSwitch) ,	// input  clk_sig
	.reset(reset) ,	// input  reset_sig
	.out(count) 	// output [7:0] out_sig
);

OU8 OU8_inst
(
	.X(count) ,	// input [7:0] X_sig
	.HEX3(HEX3) ,	// output [0:6] HEX3_sig
	.HEX2(HEX2) ,	// output [0:6] HEX2_sig
	.HEX1(HEX1) ,	// output [0:6] HEX1_sig
	.HEX0(HEX0) 	// output [0:6] HEX0_sig
);

endmodule
