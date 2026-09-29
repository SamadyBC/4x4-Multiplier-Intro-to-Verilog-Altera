`timescale 1ns/1ns

module encoder8_3(
    input a, b, c, d, e, f, g, h,
    output wire[2:0] s
);

    or s0 (s[0], b, d, f, h);
    or s1 (s[1], c, d, g, h);
    or s2 (s[2], e, f, g, h);

endmodule