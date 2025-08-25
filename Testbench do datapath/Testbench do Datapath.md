# Testbench para Datapath de Processador em VHDL

Este repositório contém o código-fonte e os resultados da simulação de um testbench em VHDL, desenvolvido para verificar a funcionalidade do datapath de um processador didático. O objetivo é validar operações fundamentais, incluindo cálculos aritméticos, acesso à memória e movimentação de dados entre registradores e memória.

O projeto foi dividido em quatro testes principais, cada um focado em um conjunto específico de operações do datapath.

## Funcionalidades Testadas

Cada item abaixo corresponde a um cenário de teste específico para validar uma parte da funcionalidade do datapath. Os resultados de cada teste são documentados nos arquivos de imagem (`.png`) e de texto (`.txt`) correspondentes.

### a) Soma de Dois Valores e Armazenamento na Memória
* **Descrição:** Este teste verifica o fluxo de dados para uma operação aritmética básica. Dois valores são lidos de posições distintas da memória, enviados para a ULA (Unidade Lógica e Aritmética) para serem somados, e o resultado é então escrito de volta em uma terceira posição da memória.
* **Verifica:** Endereçamento de memória para leitura, operação de soma da ULA, e endereçamento de memória para escrita.
* **Resultados:** `item_a.png`, `item_a.txt`

### b) Teste Completo das Operações da ULA
* **Descrição:** Este cenário executa um teste exaustivo de todas as operações implementadas na ULA. O testbench envia dois operandos e cicla através de cada código de operação (ex: ADD, SUB, AND, OR, XOR, etc.), verificando se o resultado de cada cálculo está correto.
* **Verifica:** A correção funcional de todas as operações da ULA e a integridade do barramento de dados de e para a ULA.
* **Resultados:** `item_b.png`, `item_b.txt`

### c) Cópia de Memória para Registradores
* **Descrição:** Este teste valida a capacidade do datapath de carregar múltiplos dados da memória para o banco de registradores. Três valores de posições sequenciais ou distintas da memória são lidos e copiados para três registradores diferentes (ex: R1, R2, R3).
* **Verifica:** O processo de leitura da memória e a escrita correta em múltiplos endereços do banco de registradores.
* **Resultados:** `item_c.png`, `item_c.txt`

### d) Cópia entre Posições de Memória
* **Descrição:** Este teste verifica a capacidade de mover um bloco de dados de uma área da memória para outra. O processo envolve ler um valor da memória, armazená-lo temporariamente em um registrador, e depois escrevê-lo em uma nova posição de memória. Isso é repetido para três valores.
* **Verifica:** A correta coordenação entre as operações de leitura e escrita na memória, utilizando o banco de registradores como intermediário.
* **Resultados:** `item_d.png`, `item_d.txt`

## Estrutura do Projeto

* **`tb_datapath.vhd`**: Arquivo VHDL principal que contém a arquitetura do testbench, com a lógica para gerar os estímulos e verificar as saídas para todos os quatro cenários de teste.
* **`/resultados`** (sugestão):
    * `item_a.png`, `item_a.txt`: Forma de onda e log para o teste de soma e armazenamento.
    * `item_b.png`, `item_b.txt`: Forma de onda e log para o teste completo da ULA.
    * `item_c.png`, `item_c.txt`: Forma de onda e log para o teste de cópia de memória para registradores.
    * `item_d.png`, `item_d.txt`: Forma de onda e log para o teste de cópia entre posições da memória.

## Como Executar a Simulação

Para executar o testbench, é necessário um simulador VHDL como o XSim (incluído no Xilinx Vivado) ou ModelSim.

1.  Crie um novo projeto na ferramenta de sua escolha.
2.  Adicione o arquivo `tb_datapath.vhd` e todos os arquivos VHDL do seu datapath ao projeto como fontes de simulação.
3.  Defina `tb_datapath` como o top-level da simulação.
4.  Execute a simulação comportamental e observe as formas de onda e as mensagens no console do simulador.

## Autores

* [Ana Alicy Ribeiro]
