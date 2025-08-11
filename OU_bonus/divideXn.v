// Divide by 1000 counter
module divideXn #(parameter N=1000, parameter M=10)
	(
		input CLK, CLEAR,
		output reg [M-1:0] COUNT, // COUNT is defined as a M-bit register
		output reg OUT
	);
		always @ (negedge CLK, negedge CLEAR)
		if (CLEAR==1'b0) COUNT <= 0; // COUNT is loaded with all 0's
			else
			begin
				if (COUNT == N-2'd2) begin OUT <= 1'b1; COUNT <= N-1'd1; end // Once COUNT = N-2 OUT = 1
				else
					if (COUNT == N-1'd1) begin OUT <=1'b0; COUNT <= 0; end //Once COUNT = N-1 OUT=0
						else begin OUT <= 1'b0; COUNT <= COUNT + 1'b1; end // COUNT is incremented
		end
endmodule
