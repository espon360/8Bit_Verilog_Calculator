module CU8 #(
    parameter enter = 4'b1111,
    parameter add = 4'b1010,
    parameter subtract = 4'b1011
)
(
    input [3:0] value,
    input clk, clearAll,
    // output [2:0] z, 
	 // Output for debugging state transitions
    output reg reset, loadA, loadB, operation, loadR, IUAU
);

    // State definition
    reg [2:0] state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
	
    // State transition logic
    always @(posedge clk or negedge clearAll) 
	 begin
		if(clearAll == 0) begin
			state = S0; end
		else begin
			case(state)
				S0: 
					state = S1;
				S1: 
				if (value == add)
					begin state = S2; operation = 0; end
				else if (value == subtract)
					begin state = S2; operation = 1; end
				S2: 
				if (value == enter)
					state = S3;
				S3:
					state = S4;
					
			endcase
		end
	end
    
	 always @(state)
	 begin
		case(state)
			S0: {reset,loadA,loadB,loadR,IUAU} = 5'b00000;
			S1: {reset,loadA,loadB,loadR,IUAU} = 5'b01110;
			S2: {reset,loadA,loadB,loadR,IUAU} = 5'b10110;
			S3: {reset,loadA,loadB,loadR,IUAU} = 5'b11010;
			S4: {reset,loadA,loadB,loadR,IUAU} = 5'b11101;
			
		endcase
	 end
	 
    // Output state to z and edgedetect for debugging
    // assign z = state;
    // assign edgedetect = clearAll;
	 
	 
endmodule
