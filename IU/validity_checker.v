//Test validity of input
module validity_checker
(
	input [11:0] BCD,
	output validity
);

	assign validity = BCD < 12'b000100101000;

endmodule