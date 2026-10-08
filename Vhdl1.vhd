library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparador is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        A_maior : out STD_LOGIC;
        A_igual : out STD_LOGIC;
        A_menor : out STD_LOGIC
    );
end comparador;

architecture Behavioral of comparador is
begin
    A_maior <= '1' when A > B else '0';
    A_igual <= '1' when A = B else '0';
    A_menor <= '1' when A < B else '0';
end Behavioral;
