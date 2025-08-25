-- Bibliotecas IEEE padrão
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 




entity somadois is
    Generic (
        N : integer := 8 -- Largura de bits dos números de entrada
    );
    Port (
        num1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
        num2 : in  STD_LOGIC_VECTOR (N-1 downto 0);
        num3 : in  STD_LOGIC_VECTOR (N-1 downto 0);
        soma_dois_maiores : out STD_LOGIC_VECTOR (N downto 0) -- A soma pode precisar de um bit a mais
    );
    
end somadois;


architecture Behavioral of somadois is

    signal s_num1, s_num2, s_num3 : unsigned(N-1 downto 0);
    signal s_soma : unsigned(N downto 0); -- A soma tem N + 1 bits
    
begin

    -- Converte os inputs std_logic_vector para unsigned para facilitar as operações
    s_num1 <= unsigned(num1);
    s_num2 <= unsigned(num2);
    s_num3 <= unsigned(num3);

    -- Processo para calcular a soma dos dois maiores números
    process(s_num1, s_num2, s_num3)
    begin
        -- Caso 1: num1 é o menor ou igual aos outros
        if s_num1 <= s_num2 and s_num1 <= s_num3 then
            s_soma <= ('0' & s_num2) + ('0' & s_num3);
        -- Caso 2: num2 é o menor ou igual aos outros (e num1 não é o menor)
        elsif s_num2 <= s_num1 and s_num2 <= s_num3 then
            s_soma <= ('0' & s_num1) + ('0' & s_num3);
        -- Caso 3: num3 é o menor (ou todos são iguais, ou os outros dois casos não foram atendidos)
        else
            s_soma <= ('0' & s_num1) + ('0' & s_num2);
        end if;
    end process;

    -- Atribui o resultado da soma (unsigned) para a porta de saída (std_logic_vector)
    soma_dois_maiores <= std_logic_vector(s_soma);

end Behavioral;
