# Somador dos Dois Maiores Números em VHDL

Este repositório contém um componente VHDL (`somadois`) que recebe três números de entrada como `STD_LOGIC_VECTOR` e calcula a soma dos dois maiores entre eles. O circuito é puramente combinacional e parametrizável pela largura de bits das entradas.

## Funcionalidade

O circuito implementa a seguinte lógica:
* Recebe três números de entrada de `N` bits cada (`num1`, `num2`, `num3`).
* Compara os três números para identificar qual deles é o menor ou igual aos outros.
* Realiza a soma aritmética dos dois números restantes (os maiores).
* Fornece o resultado em uma saída de `N+1` bits para acomodar um possível bit de carry da soma. 

A lógica de comparação trata corretamente os casos em que dois ou todos os três números são iguais.

## Estrutura do Módulo (`somadois.vhd`)

### Genérico
* N : integer := 8: Controla a largura de bits dos números de entrada, permitindo que o componente seja facilmente reconfigurado para outras larguras (ex: 16, 32 bits). 

### Portas

| Porta | Direção | Tipo | Descrição |
| :--- | :--- | :--- | :--- |
| `num1` | `in` | `STD_LOGIC_VECTOR(N-1 downto 0)` | O primeiro número de entrada.  |
| `num2` | `in` | `STD_LOGIC_VECTOR(N-1 downto 0)` | O segundo número de entrada.  |
| `num3` | `in` | `STD_LOGIC_VECTOR(N-1 downto 0)` | O terceiro número de entrada. |
| `soma_dois_maiores`| `out` | `STD_LOGIC_VECTOR(N downto 0)` | A saída com a soma dos dois maiores números.  |

## Implementação

O componente utiliza a biblioteca `IEEE.NUMERIC_STD` para realizar as comparações e a soma de forma segura, convertendo as entradas do tipo `STD_LOGIC_VECTOR` para `unsigned`. 

A lógica principal está contida em um único processo combinacional que utiliza uma estrutura `if-elsif-else` para determinar o menor número e, consequentemente, quais dos outros dois devem ser somados. 

## Como Usar

Para utilizar este componente em um projeto maior, basta instanciá-lo da seguinte forma:

```vhdl
-- Exemplo de instanciação em um design VHDL
u_somador_maiores : entity work.somadois
    generic map (
        N => 8 -- Definindo a largura de bits para 8
    )
    port map (
        num1              => meu_sinal_1,
        num2              => meu_sinal_2,
        num3              => meu_sinal_3,
        soma_dois_maiores => minha_soma_resultante
    );
```

## Ferramentas

* **Linguagem:** VHDL
* **Bibliotecas Padrão:** `IEEE.STD_LOGIC_1164`, `IEEE.NUMERIC_STD` 
