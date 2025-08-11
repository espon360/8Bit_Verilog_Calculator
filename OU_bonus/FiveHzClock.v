module FiveHzClock (
    input clock,
    input reset,
    output FiveHz
);
    wire FiveMHz, FiveKHz;
    wire [3:0] count1, count2, count3; // Separate count signals for each divider

    // Divide 50 MHz by 10 to get 5 MHz
    divideXn #(10, 4) div10 (
        .CLK(clock),
        .CLEAR(reset),
        .OUT(FiveMHz),
        .COUNT(count1)
    );

    // Divide 5 MHz by 1000 to get 5 kHz
    divideXn #(1000, 10) div1000L (
        .CLK(FiveMHz),
        .CLEAR(reset),
        .OUT(FiveKHz),
        .COUNT(count2)
    );

    // Divide 5 kHz by 1000 to get 5 Hz
    divideXn #(1000, 10) div1000H (
        .CLK(FiveKHz),
        .CLEAR(reset),
        .OUT(FiveHz),
        .COUNT(count3)
    );
endmodule
