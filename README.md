# Projetos de Sistemas Digitais em VHDL

Este repositório agrupa uma coleção de trabalhos e atividades práticas desenvolvidas em VHDL para a disciplina de **Sistemas Digitais para Computadores (QXD0146)** da Universidade Federal do Ceará (UFC), Campus Quixadá.

O foco dos projetos varia desde a implementação de componentes combinacionais específicos até a verificação funcional do datapath de um processador.

## Estrutura do Repositório

O repositório está organizado em pastas, onde cada uma contém um projeto ou atividade específica, com sua própria documentação.

* **`Testbench_Datapath/`**: Esta pasta é dedicada à verificação funcional do datapath de um processador. Ela contém o código VHDL do testbench (`tb_datapath.vhd`), arquivos de resultados (como imagens `.png` e textos `.txt` para cada item de teste), e um `README.md` com a documentação específica dos cenários de teste.

* **`Componente_SomadorMaiores/`**: Esta pasta abriga o componente VHDL `somadois.vhd`, um circuito que soma os dois maiores de três números. Inclui também um `README.md` que detalha a funcionalidade e o uso deste componente.

* **`Componente_SomaVetor/`**: Esta pasta contém o componente VHDL `somavetor.vhd`, projetado para somar um vetor de oito números. Possui um `README.md` com a documentação específica deste somador em árvore.

## Descrição dos Projetos

### 1. Testbench para Datapath
**(Ver detalhes em `/Testbench_Datapath/README.md`)**

Um testbench em VHDL criado para realizar uma verificação funcional detalhada do datapath de um processador. O teste é dividido em quatro cenários principais para validar a correta execução das operações:
* a) Soma de dois valores com armazenamento na memória.
* b) Teste de todas as operações da ULA.
* c) Cópia de múltiplos valores da memória para registradores.
* d) Cópia de um bloco de dados entre diferentes posições da memória.

### 2. Componentes Individuais

Esta seção agrupa componentes VHDL menores desenvolvidos como atividades práticas.

* **`Componente_SomadorMaiores`**
    * **Arquivo:** `somadois.vhd`
    * **Descrição:** Um circuito combinacional genérico que recebe três números de `N` bits e calcula a soma dos dois maiores entre eles.

* **`Componente_SomaVetor`**
    * **Arquivo:** `somavetor.vhd`
    * **Descrição:** Um circuito que soma 8 vetores de entrada de `N` bits. A implementação utiliza uma arquitetura em árvore de somadores para otimizar a lógica.

## Ferramentas Comuns

* **Software:** Xilinx Vivado
* **Linguagem:** VHDL

## Autor

* Ana Alicy Ribeiro
```
