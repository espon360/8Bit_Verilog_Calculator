module MUX
(
	input [7:0] IU8, AU8,
	input IUAU, clk,
	output reg OU8
);

	always @(posedge clk)
		case (IUAU)
			0: OU8 <= IU8;
			1: OU8 <= AU8;
		endcase

endmodule
