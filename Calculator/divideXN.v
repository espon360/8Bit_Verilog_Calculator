// Frequency Divider
module divideXN #(parameter N, parameter M)
(
    input CLK,
    input CLEAR,
    output reg [M-1:0] COUNT,
    output reg OUT
);
    always @(negedge CLK or negedge CLEAR) begin
        if (CLEAR == 1'b0)
            COUNT <= 0;
		      else begin
            if (COUNT == N-2'd2) begin
                OUT <= 1'b1; COUNT <= N-1'd1;
                COUNT <= 0;   // Reset the count
					 end else
				if (COUNT == N-1'd1)
					begin
                OUT <= 1'b0; COUNT <= 0;
					end
				else begin
					OUT <= 1'b0; COUNT <= COUNT + 1'b1;
        end
    end
	end
	 endmodule
