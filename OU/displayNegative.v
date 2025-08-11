// Display negative sign
module displayNegative
(
	input [7:0]x,
	output reg [0:6]HEX
);

	always @ (*) begin
		if (x > 8'b01111111 && x < 8'b10011101)
			HEX = 7'b1111110;
		else
			HEX = 7'b1111111;
	end
endmodule
