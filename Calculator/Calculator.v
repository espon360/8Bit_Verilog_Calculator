module Calculator
(
	input clk, // clock
	input reset, // reset
	input reset_entry, // clear just the current register
	input [3:0] row, // button values
	output [0:6] HEX3, HEX2, HEX1, HEX0, // 7 segment displays
	output [3:0] Ccout, column, // flags
	output validity
);

	wire loadA_sig, loadB_sig, loadR_sig, operation_sig, IUAU_sig, reset_sig, valid_sig;
	wire [7:0] twosCompOutput_sig, Rout_sig, OU8_sig;
	wire [3:0] value_sig, col_sig;
	wire [15:0] out_sig;
	
	keypad_input keypad_input_inst
	(
		.clk(clk) ,	// input  clk_sig
		.reset(reset_sig) ,	// input  reset_sig
		.row(row) ,	// input [3:0] row_sig
		.col(col_sig) ,	// output [3:0] col_sig
		.out(out_sig) ,	// output [DIGITS*4-1:0] out_sig
		.value(value_sig) ,	// output [3:0] value_sig
		.trig(valid_sig) 	// output  trig_sig
	);

	CU8 CU8_inst
	(
		.value(value_sig) ,	// input [3:0] value_sig
		.clk(clk) ,	// input  clk_sig
		.clearAll(reset) ,	// input  clearAll_sig
		.reset(reset_sig) ,	// output  reset_sig
		.loadA(loadA_sig) ,	// output  loadA_sig
		.loadB(loadB_sig) ,	// output  loadB_sig
		.operation(operation_sig) ,	// output  operation_sig
		.loadR(loadR_sig) ,	// output  loadR_sig
		.IUAU(IUAU_sig) 	// output  IUAU_sig
	);
	
	IU8 IU8_inst
	(
		.clk(clk) ,	// input  clk_sig
		.reset(reset_entry && reset_sig) ,	// input  reset_sig
		.row(row) ,	// input [3:0] row_sig
		.col(column) ,	// output [3:0] col_sig
		.twosCompOutput(twosCompOutput_sig) ,	// output [N-1:0] twosCompOutput_sig
		.valid(validity) 	// output  valid_sig
	);
	
	AU8 AU8_inst
	(
		.X(twosCompOutput_sig) ,	// input [7:0] X_sig
		.InA(~loadA_sig) ,	// input  InA_sig
		.InB(~loadB_sig) ,	// input  InB_sig
		.Out(~loadR_sig) ,	// input  Out_sig
		.Clear(reset_sig) ,	// input  Clear_sig
		.Add_Subtract(operation_sig) ,	// input  Add_Subtract_sig
		.Rout(Rout_sig) ,	// output [7:0] Rout_sig
		.Ccout(Ccout) 	// output [3:0] Ccout_sig
	);
	
	assign OU8_sig = IUAU_sig?Rout_sig:twosCompOutput_sig;
	
	/*
	always (*) begin
		case (mux_sel[1:0])
			2'b00:
			2'b01:
			2'b10:
			default: 
		endcase
	end
	*/
	
	OU8 OU8_inst
	(
		.X(OU8_sig) ,	// input [7:0] X_sig
		.HEX3(HEX3) ,	// output [0:6] HEX3_sig
		.HEX2(HEX2) ,	// output [0:6] HEX2_sig
		.HEX1(HEX1) ,	// output [0:6] HEX1_sig
		.HEX0(HEX0) 	// output [0:6] HEX0_sig
	);
	
endmodule
