clc;
clear all;
close all;

%% 1. Sistema massa-mola-amortecedor

M = 2;
B = 3;
K = 8;

num = 1;
den = [M B K];

G1 = tf(num, den);

G1

figure
step(G1,15)

grid on

xlabel("Tempo (s)")
ylabel("Posicao")
title("Sistema massa-mola-amortecedor")


%% 2. Circuito RC

R = 1000;
tau = 2;

C = tau/R;

fprintf('Capacitancia: %.4f F \n', C);

num = 1;
den = [R*C 1];

G1 = tf(num, den);

G1

figure
step(G1,10)

grid on

xlabel("Tempo (s)")
ylabel("Tensao de saida (V)")
title("Circuito RC")


%% 3. Sistema massa-atrito

M = 4;
F = 1;
velocidade = 0.5;

B = F/velocidade;

fprintf('Coeficiente de atrito B: %.2f \n', B);

num = 1;
den = [M B];

G1 = tf(num, den);

G1

figure
step(G1,10)

hold on

plot([0 0 10], [0 1 1], "r--", "LineWidth", 1)

grid on

xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
title("Sistema massa-atrito")
legend("Velocidade do corpo", "Forca aplicada", "Location", "southeast")

hold off