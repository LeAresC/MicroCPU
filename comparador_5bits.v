// Comparador de 5 bits usado por JZ e CMP
//   zero  = 1 quando a == 0       (JZ: registrador escolhido vale zero)
//   igual = 1 quando a == b       (CMP: regA == regB)
module comparador_5bits (
    input  [4:0] a,
    input  [4:0] b,
    output       zero,
    output       igual
);
    assign zero  = (a == 5'b00000);
    assign igual = (a == b);
endmodule
