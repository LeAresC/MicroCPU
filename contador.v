// Contador de programa (PC) de 6 bits.
// Mesmas portas do contador.bdf: alvo[5..0], jump, clock, rst, C[5..0].
// jump e rst agora são SÍNCRONOS (agem na borda de subida do clock).
// rst é ativo em nível alto (igual ao pino rst do contador.bdf).
// Prioridade: rst > jump > incremento.
module contador (
    input  [5:0] alvo,
    input        jump,
    input        clock,
    input        rst,
    output reg [5:0] C
);
    initial C = 6'd0;

    always @(posedge clock) begin
        if (rst)       C <= 6'd0;
        else if (jump) C <= alvo;
        else           C <= C + 6'd1;
    end
endmodule
