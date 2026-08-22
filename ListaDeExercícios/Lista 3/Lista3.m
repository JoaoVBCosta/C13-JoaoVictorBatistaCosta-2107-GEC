clc;
clear all;
close all;

%% 1. Funcoes e graficos 2D

t = 0:0.1:10;

y = 2*sin(3*t);
z = 2*cos(3*t);

figure
plot(t,y)

hold on
plot(t,z)

hold off

xlabel('Tempo (s)')
ylabel('Amplitude')
title('Senoide e Cossenoide')
legend('Senoide','Cossenoide')
grid on

quantidade = length(t)


%% 2. Entrada de dados, condicao e grafico

a = input('Entre com o valor de a: ');

if a > 0
    disp('Coeficiente positivo');
elseif a < 0
    disp('Coeficiente negativo');
else
    disp('Coeficiente igual a zero');
end

x = -10:0.1:10;

y = a*x + 2;

figure
plot(x,y)

grid on
xlabel('x')
ylabel('y')
title('Funcao de primeiro grau')

axes('Position',[0.2 0.3 0.2 0.4])

box on

plot(x,y)

xlim([-2 2])


%% 3. Repeticao e organizacao de graficos

A = zeros(1,5);

for i = 1:1:5
    A(i) = i * 3;
end

B = A * 2;

figure

subplot(2,1,1)
plot(A)
xlabel('Posicao')
ylabel('Valor')
title('Multiplos de 3')
grid on

subplot(2,1,2)
plot(B)
xlabel('Posicao')
ylabel('Valor')
title('Dobro dos multiplos de 3')
grid on


%% 4. Comparacao de escalas

t = 0.1:0.1:1000;

y = 50000*exp(-0.05*t);

figure

subplot(2,1,1)
plot(t,y)
grid on
xlabel('Tempo (s)')
ylabel('Amplitude')
title('Escala normal')

subplot(2,1,2)
semilogy(t,y)
grid on
xlabel('Tempo (s)')
ylabel('Amplitude')
title('Escala logaritmica em Y')


%% 5. Graficos 3D

[x,y] = meshgrid(1:0.5:10,1:20);

z = sin(x) + cos(y);

figure

surf(x,y,z)

colormap("summer")
shading interp

xlabel('x')
ylabel('y')
zlabel('z')
title('Superficie z = sen(x) + cos(y)')


figure

contour(z,5)

xlabel('x')
ylabel('y')
title('Curvas de nivel')