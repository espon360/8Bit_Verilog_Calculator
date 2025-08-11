module SignToTwoC #(parameter N = 8) (
    input [N-1:0] signedMagInput,
    output [7:0] twosCompOutput
);
    wire isNegative = signedMagInput[N-1];
    wire [N-1:0] absInput = {1'b0, signedMagInput[N-2:0]}; // Include zero bit for full N-bit representation
    wire [N-1:0] invertedInput;
    wire [N-1:0] tempOutput;

    // Invert the bits if the number is negative
    assign invertedInput = isNegative ? ~absInput : absInput;

    // Add 1 if negative to complete two's complement
    assign tempOutput = invertedInput + isNegative;

    // Assign output, zero-padding or truncating as necessary
    generate
        genvar i;
        for (i = 0; i < 8; i = i + 1) begin: output_assignment
            assign twosCompOutput[i] = (i < N) ? tempOutput[i] : isNegative;
        end
    endgenerate
endmodule
