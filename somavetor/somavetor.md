# Somador de Vetor em VHDL com Arquitetura em Árvore

Este repositório contém um componente VHDL (`somavetor`) que calcula a soma de 8 vetores de entrada de `N` bits cada. O componente é genérico, e a largura dos dados de entrada (`DATA_WIDTH`) pode ser facilmente configurada.

O design implementa uma arquitetura estrutural em árvore para realizar a soma, o que pode ser eficiente para a síntese em FPGAs.

## Funcionalidade e Arquitetura

O circuito é puramente combinacional e implementa uma **árvore de somadores** para otimizar a lógica de soma. Em vez de somar todos os números sequencialmente, a soma é realizada em múltiplos estágios paralelos:

1.  **Estágio 1:** Os 8 vetores de entrada são somados em pares (`d0+d1`, `d2+d3`, etc.), resultando em 4 somas intermediárias.
2.  **Estágio 2:** Os 4 resultados do primeiro estágio são novamente somados em pares, reduzindo o problema para 2 somas.
3.  **Estágio 3:** Os 2 resultados do segundo estágio são somados para produzir o resultado final.

Esta abordagem estrutural pode levar a um melhor desempenho em FPGAs em comparação com uma soma sequencial longa.

## Estrutura do Módulo (`somavetor.vhd`)

### Genérico
* `DATA_WIDTH : integer := 4`: Controla a largura de bits de cada um dos 8 números de entrada.

### Portas

| Porta | Direção | Tipo | Descrição |
| :--- | :--- | :--- | :--- |
| `d0` a `d7` | `in` | `STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)` | 8 portas de entrada para os vetores a serem somados. |
| `sum_out` | `out` | `STD_LOGIC_VECTOR(DATA_WIDTH+2 downto 0)` | A saída com o resultado final da soma de todos os vetores de entrada. |

### Cálculo da Largura da Saída

A largura da porta de saída `sum_out` é calculada genericamente para evitar overflow. [cite_start]A fórmula utilizada no VHDL é `DATA_WIDTH + ceil(log2(8))`, o que resulta em `DATA_WIDTH + 3`.

* **Exemplo:** Se a entrada (`DATA_WIDTH`) for de 4 bits, a saída (`sum_out`) terá `4 + 3 = 7` bits para armazenar a soma máxima possível.

## Como Usar

Para utilizar este componente em um projeto maior, basta instanciá-lo da seguinte forma:

```vhdl
-- Exemplo de instanciação em um design VHDL
u_soma_vetor : entity work.somavetor
    generic map (
        DATA_WIDTH => 4 -- Definindo a largura de bits para 4, por exemplo
    )
    port map (
        d0      => meu_vetor0,
        d1      => meu_vetor1,
        d2      => meu_vetor2,
        d3      => meu_vetor3,
        d4      => meu_vetor4,
        d5      => meu_vetor5,
        d6      => meu_vetor6,
        d7      => meu_vetor7,
        sum_out => meu_resultado_soma
    );
```

## Ferramentas e Bibliotecas

* **Linguagem:** VHDL
* **Bibliotecas Padrão:** `IEEE.STD_LOGIC_1164`, `IEEE.NUMERIC_STD`, `IEEE.MATH_REAL`. A biblioteca `NUMERIC_STD` é usada para as operações com o tipo `unsigned`, e a `MATH_REAL` é usada para o cálculo genérico da largura da porta de saída.
