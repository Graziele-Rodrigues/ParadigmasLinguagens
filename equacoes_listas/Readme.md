## Solucionador de Equações em Haskell - equacoes_listas.hs

Este programa, escrito em Haskell, encontra todas as equações matemáticas válidas que podem ser formadas a partir de uma lista de números fornecida pelo usuário. Ele gera todas as combinações possíveis de expressões e operadores para encontrar igualdades, considerando apenas divisão inteira.

-----

### Como Usar

Para executar o programa, você precisará ter o **GHCi (Glasgow Haskell Compiler Interactive)** instalado.

1.  Salve o código-fonte em um arquivo chamado `nome.hs`.

2.  Abra o terminal ou prompt de comando e navegue até a pasta onde o arquivo foi salvo.

3.  Inicie o GHCi digitando o seguinte comando:

    ```bash
    ghci nome.hs
    ```

4.  Uma vez dentro do GHCi, chame a função principal `main` para iniciar o programa:

    ```bash
    main
    ```

5.  O programa irá pedir para você **digitar uma lista de números separados por espaço**. Por exemplo:

    ```
    Digite a lista de números separados por espaço:
    1 2 3 4
    ```

6.  Após pressionar **Enter**, o programa irá processar os números e exibir todas as equações válidas encontradas, como nos exemplos abaixo:

    ```
    (1+2) = 3
    4 = (2+2)
    ```

## Solucionador de Expressões Lógicas e Aritméticas em Haskell - equacoes_listas2.hs

Este programa, escrito em Haskell, encontra todas as expressões lógicas válidas que resultam em **`True`**, formadas a partir de uma lista de números fornecida pelo usuário. Ele gera todas as combinações possíveis de expressões e operadores, incluindo aritmética (`+`, `-`, `*`, `/`), comparação (`>`, `<`, `==`), e lógica (`&&`, `||`). O programa considera apenas a divisão inteira.


### Como Usar

Para executar o programa, você precisará ter o **GHCi (Glasgow Haskell Compiler Interactive)** instalado.

1.  Salve o código-fonte em um arquivo chamado `nome.hs`.

2.  Abra o terminal ou prompt de comando e navegue até a pasta onde o arquivo foi salvo.

3.  Inicie o GHCi digitando o seguinte comando:

    ```bash
    ghci nome.hs
    ```

4.  Uma vez dentro do GHCi, chame a função principal `main` para iniciar o programa:

    ```bash
    main
    ```

5.  O programa irá pedir para você **digitar uma lista de números separados por espaço**. Por exemplo:

    ```
    Digite a lista de números separados por espaço:
    1 2 3 4
    ```

6.  Após pressionar **Enter**, o programa irá processar os números e exibir todas as expressões que avaliam como `True`. Os resultados podem incluir equações de igualdade ou outras expressões lógicas, como nos exemplos abaixo:

    ```
    (1+2) == 3
    (4 > 1) && (2 < 3)
    ```
