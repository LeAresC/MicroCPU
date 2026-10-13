// Mux 2:1 de 5 bits: y = s ? b : a
module mux2_5 (
    input  [4:0] a,
    input  [4:0] b,
    input        s,
    output [4:0] y
);
    assign y = s ? b : a;
endmodule
