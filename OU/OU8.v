module OU8
	(
		input [7:0] X,
		output [0:6] HEX3, HEX2, HEX1, HEX0
	);

		wire [7:0] sign_mag;
		wire sign;
		wire [3:0] one, ten, hun;

	TwoCToSign TwoCToSign_inst
	(
		.A(X) ,	// input [N-1:0] A_sig
		.B(sign_mag) 	// output [N-1:0] B_sig
	);

	binary2bcd binary2bcd_inst
	(
		.A(sign_mag) ,	// input [7:0] A_sig
		.ONES(one) ,	// output [3:0] ONES_sig
		.TENS(ten) ,	// output [3:0] TENS_sig
		.HUNDREDS(hun) 	// output [1:0] HUNDREDS_sig---
	);

	four2seven ONE
	(
		.bin(one) ,	// input [3:0] bin_sig
		.HEX(HEX0) 	// output [0:6] HEX_sig
	);

	
	/*
	four2seven TEN
	(
		.bin(ten) ,	// input [3:0] bin_sig
		.HEX(HEX1) 	// output [0:6] HEX_sig
	);
	*/
	four2sevenTen four2sevenTen_inst
	(
		.bin(ten) ,	// input [3:0] bin_sig
		.x(X) ,	// input [7:0] x_sig
		.HEX(HEX1) 	// output [0:6] HEX_sig
	);


	/*
	four2seven HUNDRED
	(
		.bin(hun) ,	// input [3:0] bin_sig
		.HEX(HEX2) 	// output [0:6] HEX_sig
	);
	*/
	
	four2sevenHun four2sevenHun_inst
	(
		.bin(hun) ,	// input [3:0] bin_sig
		.x(X) ,	// input [7:0] x_sig
		.HEX(HEX2) 	// output [0:6] HEX_sig
	);

	
	displayNegative displayNegative_inst
	(
		.x(X) ,	// input  sign_sig
		.HEX(HEX3) 	// output [0:6] HEX_sig
	);
endmodule
