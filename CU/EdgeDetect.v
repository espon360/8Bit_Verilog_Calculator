/*
module EdgeDetect(
    input wire clk,    // Clock input
    input wire in,     // Active-low button input
    output reg out     // Output, active low for one clock cycle
);

// Internal register to hold the previous state of 'in'
reg in_prev;

always @(posedge clk) begin
    // Update the previous state of 'in' at each clock edge
    in_prev <= in;

    // Check for falling edge of 'in' (1->0 transition)
    if (in_prev == 1 && in == 0)
        out <= 0;    // Set 'out' to 0 if a falling edge is detected
    else
        out <= 1;    // Otherwise, set 'out' to 1
end

endmodule

*/

module EdgeDetect
( 
	input in, clk,
	output out
);
	reg in_delay;
	always @ (posedge clk)
		in_delay <= in;
	assign out = in & ~in_delay;
endmodule
