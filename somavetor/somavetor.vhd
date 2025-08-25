library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;     -- Para ceil e log2 (usado no cálculo da largura da soma)

entity somavetor is
    Generic (
        DATA_WIDTH   : integer := 4  -- Largura de bits de cada dado de entrada
    );
    Port (
        -- 8 portas de entrada individuais, cada uma com DATA_WIDTH bits
        d0 : in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        d1 : in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        d2 : in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        d3 : in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        d4 : in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        d5 : in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        d6 : in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        d7 : in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);

        -- A saída da soma para 8 elementos de DATA_WIDTH bits.
        -- Largura = DATA_WIDTH + ceil(log2(8)) = DATA_WIDTH + 3.
        -- Ex: DATA_WIDTH=4 => 4+3 = 7 bits (índice 6 downto 0).
        sum_out : out STD_LOGIC_VECTOR( (DATA_WIDTH + integer(ceil(log2(real(8)))) -1) downto 0)
    );
end somavetor;

architecture StructuralFlatInputs of somavetor is

    -- Larguras dos estágios da soma
    constant STAGE1_SUM_WIDTH : integer := DATA_WIDTH + 1; -- Soma de 2 números de DATA_WIDTH
    constant STAGE2_SUM_WIDTH : integer := DATA_WIDTH + 2; -- Soma de 2 números de STAGE1_SUM_WIDTH
    constant FINAL_SUM_WIDTH  : integer := DATA_WIDTH + 3; -- Soma de 2 números de STAGE2_SUM_WIDTH (para 8 entradas)

    -- Sinais para as versões 'unsigned' das entradas
    signal s_d0, s_d1, s_d2, s_d3, s_d4, s_d5, s_d6, s_d7 : unsigned(DATA_WIDTH-1 downto 0);

    -- Sinais para os resultados intermediários da árvore de somadores
    signal s1_sum01, s1_sum23, s1_sum45, s1_sum67 : unsigned(STAGE1_SUM_WIDTH-1 downto 0);
    signal s2_sum03, s2_sum47                     : unsigned(STAGE2_SUM_WIDTH-1 downto 0);
    signal final_sum_unsigned                     : unsigned(FINAL_SUM_WIDTH-1 downto 0);

begin

    -- Converter entradas STD_LOGIC_VECTOR para unsigned
    s_d0 <= unsigned(d0);
    s_d1 <= unsigned(d1);
    s_d2 <= unsigned(d2);
    s_d3 <= unsigned(d3);
    s_d4 <= unsigned(d4);
    s_d5 <= unsigned(d5);
    s_d6 <= unsigned(d6);
    s_d7 <= unsigned(d7);

    -- Estágio 1 de Soma: Somando aos pares
    -- ('0' & opA) + opB garante que a adição seja feita com largura suficiente
    s1_sum01 <= ('0' & s_d0) + s_d1; -- Resultado com STAGE1_SUM_WIDTH bits
    s1_sum23 <= ('0' & s_d2) + s_d3; -- Resultado com STAGE1_SUM_WIDTH bits
    s1_sum45 <= ('0' & s_d4) + s_d5; -- Resultado com STAGE1_SUM_WIDTH bits
    s1_sum67 <= ('0' & s_d6) + s_d7; -- Resultado com STAGE1_SUM_WIDTH bits

    -- Estágio 2 de Soma: Somando os resultados do estágio 1 aos pares
    s2_sum03 <= ('0' & s1_sum01) + s1_sum23; -- Resultado com STAGE2_SUM_WIDTH bits
    s2_sum47 <= ('0' & s1_sum45) + s1_sum67; -- Resultado com STAGE2_SUM_WIDTH bits

    -- Estágio 3 de Soma (Soma Final)
    final_sum_unsigned <= ('0' & s2_sum03) + s2_sum47; -- Resultado com FINAL_SUM_WIDTH bits

    -- Atribuir o resultado final (convertido) à porta de saída
    sum_out <= std_logic_vector(final_sum_unsigned);

end StructuralFlatInputs;