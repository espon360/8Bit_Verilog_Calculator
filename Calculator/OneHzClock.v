// One Hz Clock, Input clock is 50MHz.
module OneHzClock
(
    input clock,
    input reset,
    output OneHz
);
    // Wires for interconnections between the dividers
   // wire [2:0] count_first_stage; // 3-bit count for the first stage (div5)
   // wire [3:0] count_second_stage; // 4-bit count for the second stage (div10)
   // wire [9:0] count_third_stage; // 10-bit count for the third stage (div1000L)
   // wire [9:0] count_fourth_stage; // 10-bit count for the fourth stage (div1000H)
    wire TenMHz, OneMHz, OneKHz;

    // Instantiate the divideXn module for the first division
    divideXN #(5, 3) div5
    (
        .CLK(clock),
        .CLEAR(reset),
        .COUNT(count),
        .OUT(TenMHz) // 10 MHz output
    );

    // Instantiate the divideXn module for the second division
    divideXN #(10, 4) div10
    (
        .CLK(TenMHz),
        .CLEAR(reset),
        .COUNT(count),
        .OUT(OneMHz) // 1 MHz output
    );

    // Instantiate the divideXn module for the third division
    divideXN #(1000, 10) div1000L
    (
        .CLK(OneMHz),
        .CLEAR(reset),
        .COUNT(count),
        .OUT(OneKHz) // 1 kHz output
    );

    // Instantiate the divideXn module for the fourth (final) division
    divideXN #(100, 10) div1000H
    (
        .CLK(OneKHz),
        .CLEAR(reset),
        .COUNT(count),
        .OUT(OneHz) // 10 Hz output
    );
endmodule