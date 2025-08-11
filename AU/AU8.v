// Arithmetic Unit 8-bit
module AU8(
	input[7:0] X,
	input InA, InB, Out, Clear, Add_Subtract,
	output [7:0] Rout,
	output [3:0] Ccout//,
	//output [0:6] HEX1, HEX0,
	//output testA, testB, testOut
	);
	
	// Internal nodes
	wire [7:0] Aout, Bout, R;
	wire [3:0] Cout;
	
	// Internal node assignments
	
	// Instantiate Registers
	NBitRegister Register_A(
		.D(X),
		.CLK(InA),
		.CLR(Clear),
		.Q(Aout)
	);
	
	NBitRegister Register_B(
		.D(X),
		.CLK(InB),
		.CLR(Clear),
		.Q(Bout)
	);
	
	RippleCarryAdderStructural RippleCarryAdderStructural_inst
	(
	.A(Aout) ,	// input [7:0] A_sig
	.B(Bout) ,	// input [7:0] B_sig
	.add_subtract(Add_Subtract) ,	// input  add_subtract_sig
	.S(R) ,	// output [7:0] S_sig
	.Cout(Ccout[3]) ,	// output  Cout
	.Ovr(Ccout[2]) ,	// output  Ovr
	.Zero(Ccout[1]) ,	// output  Zero
	.Neg(Ccout[0]) 	// output  Neg
	); 
	
	/*
	NBitRegister #(2'd4) Register_Ccout(
		.D(Cout),
		.CLK(Out),
		.CLR(Clear),
		.Q(Ccout)
	);
	*/
	
	NBitRegister Register_R(
		.D(R),
		.CLK(Out),
		.CLR(Clear),
		.Q(Rout)
	);
	
	four2seven MSB
	(
	.bin(Rout[7:4]) ,	// input [3:0] bin_sig
	.HEX(HEX1) 	// output [0:6] HEX_sig
	);
	
	four2seven LSB
	(
	.bin(Rout[3:0]) ,	// input [3:0] bin_sig
	.HEX(HEX0) 	// output [0:6] HEX_sig
	);
	/*
	assign testA = InA;
	assign testB = InB;
	assign testOut = Out;
	*/
endmodule

	
	