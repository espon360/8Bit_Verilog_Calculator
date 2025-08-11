module IU8 #(
    parameter DIGITS = 4,
    parameter N = 8
	 ) 
(
    input clk,
    input reset,
    input [3:0] row,
	 output [3:0] col,
    output [N-1:0] twosCompOutput,
	 output valid
);

	wire [DIGITS*4-1:0] out_sig; // Adjust DIGITS based on keypad_input instantiation
	wire [3:0] trig, value_sig;
	wire [15:0] BCD_sig; // Adjust width as necessary
	wire [N-1:0] binarySM_sig, signedMagInput_sig;

keypad_input #(.DIGITS(4)) keypad_input_inst
(
	.clk(clk) ,	// input  clk_sig
	.reset(reset) ,	// input  reset_sig
	.row(row) ,	// input [3:0] row_sig
	.col(col) ,	// output [3:0] col_sig
	.out(out_sig) ,	// output [DIGITS*4-1:0] out_sig
	.value(value_sig) ,	// output [3:0] value_sig
	.trig(trig) 	// output  trig_sig
);

validity_checker validity_checker_inst
(
	.BCD(out_sig[11:0]) ,	// input [11:0] BCD_sig
	.validity(valid) 	// output  validity_sig
);

BCD2BinarySM BCD2BinarySM_inst
(
	.BCD(out_sig) ,	// input [15:0] BCD_sig
	.binarySM(binarySM_sig) 	// output [N-1:0] binarySM_sig
);

SignToTwoC SignToTwoC_inst
(
	.signedMagInput(binarySM_sig) ,	// input [N-1:0] signedMagInput_sig
	.twosCompOutput(twosCompOutput) 	// output [7:0] twosCompOutput_sig
);

endmodule
