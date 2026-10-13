; =====================================================================
; proj.asm - programa de teste de TODAS as instrucoes da CPU (5 bits)
; Monte com:  python3 montador.py proj.asm proj.mif
;
; Formato da instrucao (16 bits):
;   ULA : 0 oo i aa bbbbb 0 0 0 dd   oo: 00 ADD, 01 SUB, 10 MUL, 11 DIV
;                                    i=0: B = registrador bbbbb[1:0]
;                                    i=1: B = imediato bbbbb (-16..15)
;   MOV : 1 0 0 0 00 000ss 0 0 0 dd
;   LDI : 1 0 0 1 00 iiiii 0 0 0 dd
;   NOP : 1 0 1 0 ... (A000)
;   RESET:1 0 1 1 ... (B000)
;   JMP : 1 0 1 0 00 aaaaa a 1 0 00    (A008)  salto incondicional
;   JZ  : 1 0 1 0 rr aaaaa a 1 1 00    (A00C)  salta se Rr == 0
;   CMP : 1 1 1 0 ra 000bb 0 0 0 00    (E000)  flag <- (Ra == Rb)
;   JE  : 1 1 1 0 00 aaaaa a 1 1 00    (E00C)  salta se a flag do ultimo CMP = 1
;         alvo de 6 bits: aaaaa = bits 9..5 (alvo[4:0]), a = bit 4 (alvo[5])
;
; ATENCAO: a ROM tem saida registrada, entao a instrucao logo
; depois de um JMP/JZ/JE tomado ou RESET SEMPRE executa (delay slot).
; =====================================================================

; ---------- 1. LDI: positivo, negativo, todos os registradores -------
        LDI R0, #5          ; R0 = 00101
        LDI R1, #3          ; R1 = 00011
        LDI R2, #-2         ; R2 = 11110
        LDI R3, #-16        ; R3 = 10000

; ---------- 2. MOV: le e escreve cada registrador ---------------------
        MOV R3, R0          ; R3 = 5
        MOV R0, R1          ; R0 = 3
        MOV R1, R2          ; R1 = -2
        MOV R2, R3          ; R2 = 5

; ---------- 3. ULA com registrador ------------------------------------
        ADD R0, R0, R2      ; R0 = 3 + 5    = 8
        SUB R1, R2, R0      ; R1 = 5 - 8    = -3
        MUL R2, R1, R2      ; R2 = -3 * 5   = -15
        DIV R3, R2, R1      ; R3 = -15 / -3 = 5

; ---------- 4. ULA com imediato ---------------------------------------
        ADD R0, R0, #-1     ; R0 = 8 - 1    = 7
        SUB R1, R1, #4      ; R1 = -3 - 4   = -7
        MUL R2, R3, #3      ; R2 = 5 * 3    = 15
        DIV R3, R0, #2      ; R3 = 7 / 2    = 3   (trunca)

; ---------- 5. Casos de borda -----------------------------------------
        DIV R3, R2, #-4     ; R3 = 15 / -4  = -3  (trunca para zero)
        ADD R0, R2, #1      ; R0 = 15 + 1   = 16 -> estoura para -16
        MUL R1, R2, R2      ; R1 = 225 mod 32 = 1
        DIV R2, R2, #0      ; R2 = 0   (divisao por zero da 0)
        SUB R1, R0, #1      ; R1 = -16 - 1 = -17 -> estoura para 15

; ---------- 6. NOP: nada muda -----------------------------------------
        NOP

; ---------- 7. JMP para endereco alto (testa o bit 5 do alvo) ---------
        JMP ALTO
        LDI R0, #9          ; delay slot: EXECUTA (R0 = 9)
        LDI R0, #-1         ; NAO deve executar (R0 = 11111 = erro)

; ---------- 9. volta do salto para tras --------------------------------
BAIXO:  LDI R2, #10         ; R2 = 10
        LDI R3, #-5         ; R3 = -5

; ---------- 10. JZ nao tomado (registrador diferente de zero) ---------
        JZ R2, ERRO         ; R2 = 10 -> NAO salta
; ---------- 11. JZ tomado ---------------------------------------------
        LDI R0, #0          ; R0 = 0
        JZ R0, JZ_OK        ; R0 = 0 -> salta (alvo 0x20, testa o bit 5)
        LDI R1, #7          ; delay slot: EXECUTA (R1 = 7)
        LDI R1, #-1         ; NAO deve executar (R1 = 11111 = erro)
; ---------- 12. CMP diferente + JE nao tomado ---------------------------
JZ_OK:  CMP R2, R3          ; 10 x -5 -> diferentes (flag = 0)
        JE ERRO             ; flag = 0 -> NAO salta
; ---------- 13. CMP igual + JE tomado -----------------------------------
        MOV R3, R2          ; R3 = 10
        CMP R2, R3          ; 10 x 10 -> iguais (flag = 1)
        LDI R0, #3          ; instrucao no meio: a flag continua 1
        JE JE_OK            ; flag = 1 -> salta
        LDI R0, #6          ; delay slot: EXECUTA (R0 = 6)
        LDI R0, #-1         ; NAO deve executar (R0 = 11111 = erro)
; ---------- 14. CMP volta a dar diferente -------------------------------
JE_OK:  CMP R0, R1          ; 6 x 7 -> diferentes (flag = 0)
        JE ERRO             ; NAO salta
; ---------- 15. RESET ----------------------------------------------------
        RESET               ; zera R0..R3, a flag e o PC
        NOP                 ; delay slot
FIM:    JMP FIM             ; so chega aqui se o RESET nao funcionar
        NOP                 ; delay slot

; ---------- 8. destino alto (endereco >= 32) ---------------------------
        .org 0x30
ALTO:   LDI R1, #12         ; R1 = 12
        JMP BAIXO           ; salto para tras, alvo < 32
        NOP                 ; delay slot
        LDI R1, #-1         ; NAO deve executar (R1 = 11111 = erro)

; ---------- destino de erro: R0 = R1 = 11111 e a CPU para --------------
        .org 0x34
ERRO:   LDI R0, #-1
        LDI R1, #-1
PARA:   JMP PARA
        NOP
