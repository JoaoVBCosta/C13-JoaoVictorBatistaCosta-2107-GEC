% Respostas do primeiro Relatorio

clc;
clear all;
close all;

%% Exercicio 1 - Analise de tres medicoes

medicoes = zeros(1,3);

medicoes(1) = input('Entre com a primeira medicao: ');
medicoes(2) = input('Entre com a segunda medicao: ');
medicoes(3) = input('Entre com a terceira medicao: ');

media = mean(medicoes);
maior = max(medicoes);
menor = min(medicoes);

fprintf('Media: %.2f \n', media);
fprintf('Maior valor: %.2f \n', maior);
fprintf('Menor valor: %.2f \n', menor);

if media >= 8
    disp('Resultado alto');
elseif media >= 5 && media < 8
    disp('Resultado intermediario');
else
    disp('Resultado baixo');
end


%% Exercicio 2 - Processamento de um vetor com for

A = [3 8 2 10 5 7 1 6];

B = zeros(size(A));

for i = 1:1:8

    if A(i) >= 6
        B(i) = A(i) * 2;
    else
        B(i) = A(i) + 3;
    end

end

disp('Vetor A:');
disp(A);

disp('Vetor B:');
disp(B);

soma_B = sum(B);
media_B = mean(B);
maior_B = max(B);
menor_B = min(B);

fprintf('Soma de B: %.2f \n', soma_B);
fprintf('Media de B: %.2f \n', media_B);
fprintf('Maior valor de B: %.2f \n', maior_B);
fprintf('Menor valor de B: %.2f \n', menor_B);


%% Exercicio 3 - Identificacao de numeros pares

A = [14 7 20 9 6 11 18 5];

B = zeros(size(A));
contador = 0;

for i = 1:1:8

    if rem(A(i),2) == 0
        B(i) = A(i);
        contador = contador + 1;
    else
        B(i) = 0;
    end

end

disp('Vetor B:');
disp(B);

fprintf('Quantidade de numeros pares: %d \n', contador);


%% Exercicio 4 - Calculadora com menu usando switch

A = input('Entre com o primeiro valor: ');
B = input('Entre com o segundo valor: ');

disp('1 - Soma');
disp('2 - Subtracao');
disp('3 - Multiplicacao');
disp('4 - Divisao');

opcao = input('Qual a opcao desejada: ');

switch opcao

    case 1
        resultado = A + B;
        fprintf('Resultado: %.2f \n', resultado);

    case 2
        resultado = A - B;
        fprintf('Resultado: %.2f \n', resultado);

    case 3
        resultado = A * B;
        fprintf('Resultado: %.2f \n', resultado);

    case 4

        if B == 0
            disp('A operacao nao pode ser realizada');
        else
            resultado = A / B;
            fprintf('Resultado: %.2f \n', resultado);
        end

    otherwise
        disp('Opcao invalida');

end

%% Exercicio 5 - Acumulador com while

soma = 0;
contador = 0;

while soma <= 4

    valor = rand;
    soma = soma + valor;
    contador = contador + 1;

    fprintf('Valor sorteado: %.4f \n', valor);
    fprintf('Soma atual: %.4f \n', soma);

end

if contador > 8
    disp('Muitas repeticoes');
else
    disp('Poucas repeticoes');
end

fprintf('Numero total de repeticoes: %d \n', contador);


%% Exercicio 6 - Processamento de uma matriz com dois for

A = [2 7 4 9;
     6 1 8 3];

B = zeros(size(A));

for i = 1:1:4

    for j = 1:1:2

        if A(j,i) > 5
            B(j,i) = A(j,i) * 2;
        else
            B(j,i) = A(j,i) + 5;
        end

    end

end

disp('Matriz A:');
disp(A);

disp('Matriz B:');
disp(B);

disp('Transposta de B:');
disp(B');

disp('Primeira linha de B:');
disp(B(1,:));

disp('Terceira coluna de B:');
disp(B(:,3));


%% Exercicio 7 - Funcao com duas saidas

A = [5 12 7 3 9 14];

[soma_A, media_A] = analisa_vetor(A);

if media_A >= 8
    disp('Media elevada');
else
    disp('Media abaixo de 8');
end

fprintf('Soma: %.2f \n', soma_A);
fprintf('Media: %.2f \n', media_A);


%% Exercicio 8 - Funcao para transformar uma matriz

A = [1 5 3 8;
     6 2 7 4];

B = zeros(size(A));

B = transforma_matriz(A,B);

disp('Matriz resultante:');
disp(B);


%% Exercicio 9 - Entrada como texto e conversao numerica

y = input('Entre com o primeiro valor: ', 's');
z = input('Entre com o segundo valor: ', 's');

disp(y);
disp(z);

y = str2num(y);
z = str2num(z);

soma = y + z;
multiplicacao = y * z;

fprintf('Soma: %.2f \n', soma);
fprintf('Multiplicacao: %.2f \n', multiplicacao);

if soma > 20
    disp('Soma alta');
elseif soma == 20
    disp('Soma igual a 20');
else
    disp('Soma baixa');
end


%% Exercicio 10 - Analise de dados e escolha de grafico

dados = [12 18 10 25 15];

soma_dados = sum(dados);
media_dados = mean(dados);
maior_dados = max(dados);
menor_dados = min(dados);

fprintf('Soma: %.2f \n', soma_dados);
fprintf('Media: %.2f \n', media_dados);
fprintf('Maior valor: %.2f \n', maior_dados);
fprintf('Menor valor: %.2f \n', menor_dados);

contador = 0;

for i = 1:1:5

    if dados(i) >= media_dados
        contador = contador + 1;
    end

end

fprintf('Quantidade de valores maiores ou iguais a media: %d \n', contador);

disp('1 - Grafico de barras');
disp('2 - Grafico de pizza');

opcao = input('Qual a opcao desejada: ');

switch opcao

    case 1
        bar(dados);
        title('Grafico de Barras');

    case 2
        pie3(dados);
        title('Grafico de Pizza');

    otherwise
        warning('Nenhum grafico criado. Tipo invalido.');

end

if contador > length(dados)/2
    disp('Maioria dos valores acima ou igual a media');
else
    disp('Menos da metade dos valores acima ou igual a media');
end


%% Funcoes

function [soma, media] = analisa_vetor(A)

    soma = sum(A);
    media = mean(A);

end


function [B] = transforma_matriz(A,B)

    for i = 1:1:4

        for j = 1:1:2

            if A(j,i) >= 5
                B(j,i) = A(j,i) * 2 * exp(1);
            else
                B(j,i) = A(j,i) * 2;
            end

        end

    end

end

