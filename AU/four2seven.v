// Four-bit binary to seven-segment decoder. Active low output.
module four2seven (
	input [3:0]bin,
	//output reg a,b,c,d,e,f,g
	output reg [0:6]HEX);
	always @ (*) begin
		case (bin[3:0])
			4'b0000: {HEX[0:6]} = 7'b0000001; // 0
			4'b0001: {HEX[0:6]} = 7'b1001111; // 1
			4'b0010: {HEX[0:6]} = 7'b0010010; // 2
			4'b0011: {HEX[0:6]} = 7'b0000110; // 3
			4'b0100: {HEX[0:6]} = 7'b1001100; // 4
			4'b0101: {HEX[0:6]} = 7'b0100100; // 5
			4'b0110: {HEX[0:6]} = 7'b0100000; // 6
			4'b0111: {HEX[0:6]} = 7'b0001111; // 7
			4'b1000: {HEX[0:6]} = 7'b0000000; // 8
			4'b1001: {HEX[0:6]} = 7'b0001100; // 9
			4'b1010: {HEX[0:6]} = 7'b0001000; // A
			4'b1011: {HEX[0:6]} = 7'b1100000; // B
			4'b1100: {HEX[0:6]} = 7'b0110001; // C
			4'b1101: {HEX[0:6]} = 7'b1000010; // D
			4'b1110: {HEX[0:6]} = 7'b0110000; // E
			4'b1111: {HEX[0:6]} = 7'b0111000; // F
		endcase
	end
endmodule
