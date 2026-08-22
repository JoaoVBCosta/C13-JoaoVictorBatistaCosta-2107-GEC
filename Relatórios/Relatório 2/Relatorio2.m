clc;
clear all;
close all;


%% 1. Sistema massa-atrito e comparacao grafica - Caixa Branca

M1 = 2;
B1 = 3;

num1 = 1;
den1 = [M1 B1];

G1 = tf(num1,den1);


M2 = 4;
B2 = 6;

num2 = 1;
den2 = [M2 B2];

G2 = tf(num2,den2);


G1
G2


% Respostas dos dois sistemas na mesma figura

figure

step(G1,20)

hold on

step(G2,20)

plot([0 0 20],[0 1 1],"r--","LineWidth",1)

grid on

xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
title("Comparacao dos sistemas massa-atrito")
legend("Sistema 1","Sistema 2","Forca aplicada","Location","southeast")

hold off


% Respostas separadas

figure

subplot(2,1,1)

step(G1,20)

grid on

xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
title("Sistema 1")


subplot(2,1,2)

step(G2,20)

grid on

xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
title("Sistema 2")


% Janela ampliada dos primeiros 5 segundos

figure

step(G1,20)

hold on

step(G2,20)

plot([0 0 20],[0 1 1],"r--","LineWidth",1)

grid on

xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
title("Comparacao dos sistemas massa-atrito")
legend("Sistema 1","Sistema 2","Forca aplicada","Location","southeast")

axes("Position",[0.55 0.5 0.3 0.3])

box on

step(G1,5)

hold on

step(G2,5)

xlim([0 5])

hold off


%% 2. Circuito RC e comparacao de escalas - Caixa Cinza

R = 2000;
tau = 2.5;

C = tau/R;

fprintf("Capacitancia: %.5f F \n",C);

num = 1;
den = [R*C 1];

G2 = tf(num,den);

G2


% Resposta ao degrau

figure

step(G2,15)

grid on

xlabel("Tempo (s)")
ylabel("Tensao de saida (V)")
title("Circuito RC")


% Vetor de resistencias

Rteste = 100:100:10000;

tau_teste = Rteste*C;


% Comparacao das escalas

figure

subplot(2,2,1)

plot(Rteste,tau_teste)

grid on

xlabel("Resistencia (Ohm)")
ylabel("Constante de tempo (s)")
title("Escala normal")


subplot(2,2,2)

semilogy(Rteste,tau_teste)

grid on

xlabel("Resistencia (Ohm)")
ylabel("Constante de tempo (s)")
title("Escala logaritmica em Y")


subplot(2,2,3)

semilogx(Rteste,tau_teste)

grid on

xlabel("Resistencia (Ohm)")
ylabel("Constante de tempo (s)")
title("Escala logaritmica em X")


subplot(2,2,4)

loglog(Rteste,tau_teste)

grid on

xlabel("Resistencia (Ohm)")
ylabel("Constante de tempo (s)")
title("Escala logaritmica em X e Y")


%% 3. Identificacao e visualizacao de dados experimentais - Caixa Preta

t3 = (0:25)';

u3 = [0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

y3 = [0.008 0.012 0.006 0.010 0.020 0.382 0.671 0.903 1.082 1.226 1.335 1.425 ...
      1.492 1.547 1.587 1.618 1.642 1.660 1.674 1.684 1.692 1.698 1.702 1.706 1.709 1.711];

u3 = u3(:);
y3 = y3(:);


% Visualizacao dos dados

figure

subplot(2,1,1)

plot(t3,u3)

grid on

ylabel("Entrada u")
title("Dados do experimento")


subplot(2,1,2)

plot(t3,y3)

grid on

xlabel("Tempo (s)")
ylabel("Saida y")


% Grafico 3D

figure

plot3(t3,u3,y3)

grid on

xlabel("Tempo (s)")
ylabel("Entrada u")
zlabel("Saida y")
title("Dados experimentais em 3D")


% Identificacao do sistema

Ts3 = 1;

dados3 = iddata(y3,u3,Ts3);

G3 = tfest(dados3,1,0);

G3


% Comparacao entre dados e modelo

figure

compare(dados3,G3)

grid on


% Resposta ao degrau

figure

step(G3,25)

grid on

xlabel("Tempo (s)")
ylabel("Saida")
title("Modelo identificado - Caixa preta")


%% 4. Analise de diferentes circuitos RC - Caixa Cinza

R1 = 1000;
tau1 = 1.2;

R2 = 2000;
tau2 = 2.8;

R3 = 3000;
tau3 = 3.9;

R4 = 5000;
tau4 = 7.0;


C1 = tau1/R1;
C2 = tau2/R2;
C3 = tau3/R3;
C4 = tau4/R4;


fprintf("C1 = %.4f F \n",C1);
fprintf("C2 = %.4f F \n",C2);
fprintf("C3 = %.4f F \n",C3);
fprintf("C4 = %.4f F \n",C4);


R = [R1 R2 R3 R4];

tau = [tau1 tau2 tau3 tau4];

C = [C1 C2 C3 C4];


% Grafico 3D

figure

plot3(R,tau,C,"o")

grid on

xlabel("Resistencia (Ohm)")
ylabel("Constante de tempo (s)")
zlabel("Capacitancia (F)")
title("Experimentos com circuitos RC")


% Experimento 3

R_exp3 = R3;
tau_exp3 = tau3;
C_exp3 = C3;

num4 = 1;
den4 = [R_exp3*C_exp3 1];

G4 = tf(num4,den4);

G4


% Resposta ao degrau

figure

step(G4,20)

grid on

xlabel("Tempo (s)")
ylabel("Tensao de saida (V)")
title("Experimento 3 - Circuito RC")


% Janela ampliada

axes("Position",[0.55 0.5 0.3 0.3])

box on

step(G4,5)

xlim([0 5])


%% 5. Analise completa de tres tipos de modelagem


% Sistema A - Caixa Branca

M_A = 3;
B_A = 5;

numA = 1;
denA = [M_A B_A];

GA = tf(numA,denA);


% Sistema B - Caixa Cinza

R_B = 1500;
tau_B = 3;

C_B = tau_B/R_B;

numB = 1;
denB = [R_B*C_B 1];

GB = tf(numB,denB);


% Sistema C - Caixa Preta

tC = (0:20)';

uC = [0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

yC = [0.010 0.006 0.012 0.018 0.408 0.706 0.934 1.103 1.229 1.322 1.391 1.441 ...
      1.479 1.505 1.526 1.540 1.551 1.558 1.564 1.568 1.571];

uC = uC(:);
yC = yC(:);

TsC = 1;

dadosC = iddata(yC,uC,TsC);

GC = tfest(dadosC,1,0);


% Resultados no Command Window

GA

fprintf("Capacitancia do Sistema B: %.4f F \n",C_B);

GB

GC


% Respostas dos tres sistemas

figure

subplot(3,1,1)

step(GA,20)

grid on

xlabel("Tempo (s)")
ylabel("Saida")
title("Sistema A - Caixa Branca")


subplot(3,1,2)

step(GB,20)

grid on

xlabel("Tempo (s)")
ylabel("Saida")
title("Sistema B - Caixa Cinza")


subplot(3,1,3)

step(GC,20)

grid on

xlabel("Tempo (s)")
ylabel("Saida")
title("Sistema C - Caixa Preta")


% Dados de entrada e saida do Sistema C

figure

subplot(2,1,1)

plot(tC,uC)

grid on

ylabel("Entrada u")
title("Sistema C - Dados experimentais")


subplot(2,1,2)

plot(tC,yC)

grid on

xlabel("Tempo (s)")
ylabel("Saida y")


% Comparacao dos dados experimentais com o modelo

figure

compare(dadosC,GC)

grid on


% Sistema A e caixa branca porque o modelo matematico do sistema e conhecido.
% Sistema B e caixa cinza porque parte do modelo e conhecida e um parametro e obtido experimentalmente.
% Sistema C e caixa preta porque o modelo e identificado a partir dos dados experimentais.