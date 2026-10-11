LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ula_5bits IS
    PORT (
        a   : IN  std_logic_vector(4 DOWNTO 0);
        b   : IN  std_logic_vector(4 DOWNTO 0);
        sel : IN  std_logic_vector(1 DOWNTO 0);
        res : OUT std_logic_vector(4 DOWNTO 0)
    );
END ula_5bits;

ARCHITECTURE rtl OF ula_5bits IS
BEGIN
    PROCESS(a, b, sel)
        -- Conversão para signed para garantir operações matemáticas com sinal corretas
        VARIABLE signed_a   : signed(4 DOWNTO 0);
        VARIABLE signed_b   : signed(4 DOWNTO 0);
        VARIABLE temp_add   : signed(4 DOWNTO 0);
        VARIABLE temp_sub   : signed(4 DOWNTO 0);
        VARIABLE temp_mult  : signed(9 DOWNTO 0);
        VARIABLE temp_div   : signed(4 DOWNTO 0);
    BEGIN
        signed_a := signed(a);
        signed_b := signed(b);
        
        -- Inicialização padrão
        temp_add  := (OTHERS => '0');
        temp_sub  := (OTHERS => '0');
        temp_mult := (OTHERS => '0');
        temp_div  := (OTHERS => '0');

        -- Operações
        temp_add  := signed_a + signed_b;
        temp_sub  := signed_a - signed_b;
        temp_mult := signed_a * signed_b;
        
        IF signed_b /= 0 THEN
            temp_div := signed_a / signed_b;
        END IF;

        -- Seleção da ULA (Multiplexador)
        CASE sel IS
            WHEN "00" => res <= std_logic_vector(temp_add);
            WHEN "01" => res <= std_logic_vector(temp_sub);
            WHEN "10" => res <= std_logic_vector(temp_mult(4 DOWNTO 0)); -- Truncado para 5 bits
            WHEN "11" => res <= std_logic_vector(temp_div);
            WHEN OTHERS => res <= (OTHERS => '0');
        END CASE;
    END PROCESS;
END rtl;