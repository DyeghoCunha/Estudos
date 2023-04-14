<p align="center"> <img src="https://imgur.com/mIBmcEL.png" alt="Javascript: validando formulários"> </p>

<hr>

<p align="center"> <img src="https://github.com/MonicaHillman/aluraplay-requisicoes/blob/main/img/logo.png" alt="Logo da Alura"> </p>
<p align="center">Formulário de criação de contas para o banco virtual MoniBank.</p>

## Tecnologias utilizadas durante o curso
* JavaScript

## Tecnologias utilizadas no projeto
* HTML
* CSS


## Expreção Regular

A expressão regular "\d{3}.?\d{3}.?\d{3}-?\d{2}" é usada para encontrar números de CPF brasileiros, que são compostos por 11 dígitos no formato XXX.XXX.XXX-XX, onde X é um dígito de 0 a 9.

A expressão regular pode ser interpretada da seguinte forma:

"\d{3}" corresponde a três dígitos.
".?" corresponde a nenhum ou um caractere de ponto (escapado com uma barra invertida).
"\d{3}" corresponde a mais três dígitos.
".?" corresponde a nenhum ou um caractere de ponto.
"\d{3}" corresponde a mais três dígitos.
"-?" corresponde a nenhum ou um caractere de hífen.
"\d{2}" corresponde a dois dígitos.

## Blur em eventListner

A expressão ("blur",()=> verificaCampo()) em JavaScript é um listener de evento que escuta pelo evento "blur" em um elemento HTML e, quando ocorre esse evento, executa a função verificaCampo().

O evento "blur" é acionado quando um elemento perde o foco, ou seja, quando o usuário clica em outro lugar da página ou pressiona a tecla Tab para mudar o foco para outro elemento.


## Valida o Primeiro Digito do CPF

A validação dos dígitos de um CPF é feita utilizando um algoritmo específico que utiliza os primeiros 9 dígitos do CPF para gerar os dois últimos dígitos, conhecidos como dígitos verificadores. Esses dígitos verificadores são utilizados para verificar se o número do CPF é válido ou não.

O algoritmo de validação funciona da seguinte maneira:

Multiplica-se cada um dos primeiros 9 dígitos do CPF por um peso, começando com o valor 10 e decrescendo até 2. O décimo dígito é multiplicado por 2, e o décimo primeiro é multiplicado por 1.

Soma-se o resultado das multiplicações.

Divide-se a soma por 11 e guarda-se o resto da divisão.

Se o resto for menor que 2, o primeiro dígito verificador é zero. Se o resto for maior ou igual a 2, subtrai-se o valor 11 pelo resto e o resultado é o primeiro dígito verificador.

Para calcular o segundo dígito verificador, repete-se o processo, mas multiplicando os primeiros 10 dígitos do CPF pelos pesos de 11 a 2, e somando o resultado. O segundo dígito verificador é calculado da mesma maneira que o primeiro.

Para validar o CPF, verifica-se se os dois dígitos verificadores calculados são iguais aos dois últimos dígitos do CPF. Se forem iguais, o CPF é considerado válido.

Por exemplo, para validar o CPF 123.456.789-09, seguimos os seguintes passos:

Multiplica-se cada dígito pelos pesos, na ordem 10, 9, 8, 7, 6, 5, 4, 3, 2, 2 e 1:
110 + 29 + 38 + 47 + 56 + 65 + 74 + 83 + 92 + 02 + 9*1 = 285

Divide-se 285 por 11 e guarda-se o resto: 285 % 11 = 3

Subtrai-se o resto de 11: 11 - 3 = 8. O primeiro dígito verificador é 8.

Repete-se o processo, agora com os primeiros 10 dígitos, multiplicados pelos pesos de 11 a 2:
111 + 210 + 39 + 48 + 57 + 66 + 75 + 84 + 93 + 02 = 340

Divide-se 340 por 11 e guarda-se o resto: 340 % 11 = 8

Subtrai-se o resto de 11: 11 - 8 = 3. O segundo dígito verificador é 3.

O CPF é válido se os dígitos verificadores calculados (8 e 3) são iguais aos dois últimos dígitos do CPF (09). Como os dígitos verificadores são iguais, o CPF 123.456.789-09 é considerado válido.

## Valida Idade

Define uma constante dataAtual que armazena a data e hora atuais usando o construtor new Date().

Calcula a data que representa 18 anos após a data fornecida como parâmetro, utilizando o método getUTCFullYear() para obter o ano, getUTCMonth() para obter o mês, e getUTCDate() para obter o dia. Esses valores são passados para o construtor new Date() como argumentos.

Compara a data atual (dataAtual) com a data de 18 anos após a data fornecida (dataMais18), usando o operador de comparação maior ou igual (>=).

Se a data atual for maior ou igual a 18 anos após a data fornecida, a função retorna true, caso contrário, retorna false.

Em resumo, a função verifica se a pessoa representada pela data fornecida tem pelo menos 18 anos de idade.