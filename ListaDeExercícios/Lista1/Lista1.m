% Respostas da primeira lista de exercícios

clc;
clear;

%% 1. Operacoes basicas

a = 12;
b = 5;

soma = a + b
subtracao = a - b
multiplicacao = a * b
divisao = a / b
potencia = a^b

%% 2. Raiz, arredondamento e resto

raiz = sqrt(144)
arredondamento = round(7.6)
arredondamento_cima = ceil(4.01)
resto = rem(250,17)

%% 3. MDC e MMC

mdc = gcd(24,36)
mmc = lcm(12,18)

%% 4. Exponencial e trigonometria

exponencial = exp(2)

seno = sin(30*pi/180)
cosseno = cos(60*pi/180)
tangente = tan(45*pi/180)

%% 5. Criando vetores

v1 = 1:10
v2 = 10:-1:1
v3 = 0:2:20
v4 = linspace(0,100,5)

%% 6. Acessando posicoes de um vetor

v = [4 8 15 16 23 42];

primeiro = v(1)
ultimo = v(end)
posicoes_2_ate_4 = v(2:4)
posicoes_1_3_6 = v([1 3 6])

%% 7. Informacoes sobre um vetor

v = [5 10 15 20 25];

quantidade = length(v)
dimensoes = size(v)
soma = sum(v)
media = mean(v)
maior = max(v)
menor = min(v)

%% 8. Vetor linha e vetor coluna

v = [10 20 30 40];

dimensao_linha = size(v)

v_coluna = v'

dimensao_coluna = size(v_coluna)

%% 9. Criando e acessando uma matriz

A = [3 6 9;
    2 4 8;
    1 5 7];

elemento = A(2,3)
primeira_linha = A(1,:)
segunda_coluna = A(:,2)
dimensoes = size(A)

%% 10. Operacoes com matrizes

A = [1 2;
    3 4];

B = [2 0;
    1 5];

soma = A + B
multiplicacao = A * B
transposta = A'

zeros_3x3 = zeros(3)
ones_2x4 = ones(2,4)
identidade_4x4 = eye(4)
aleatoria_3x3 = rand(3)