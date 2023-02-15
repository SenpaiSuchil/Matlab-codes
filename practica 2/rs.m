clear
close all
clc 

f = @(x,y) x.*exp(-x.^2-y.^2); % funcion objetivo
%f = @(x,y) (x-2).^2+(y-2).^2; % funcion objetivo 2

x_lim = linspace(-5,5,50); % límites para eje x, -5 es inferior, 5 es superior, con 50 puntos
y_lim = linspace(-5,5,50); % límites para eje y, -5 es inferior, 5 es superior, con 50 puntos
[x1,y1] = meshgrid(x_lim,y_lim); % creamos una rejilla de puntos (x,y) para crear el plot

x0=[-2 -2]';%posicion inicial
xu=[2 2]';%limite superior
xl=[-2 -2]';%limite inferior
D=2;%dimension
N=10000;%numero de iteraciones
conv=zeros([1 N]);% paso uno para convergencia
for i=1:N
    
    y=xl+(xu-xl).*rand(D,1);
    %y(1)en matlab==y[1] en c++
    if f(y(1), y(2)) < f(x0(1), x0(2))
        x0=y;
    end
    conv(i)=f(x0(1),x0(2));%cambiamos los valores evaluando la funcion
end
z=f(x1,y1);

figure
hold on
grid on

surf(x1,y1,z) % plot de la rejilla en 3D
plot3(x0(1),x0(2),f(x0(1),x0(2)),'r*','LineWidth',2,'MarkerSize',10)% plot del minimo encontrado
%la solucion se plotea en las coordenadas que resulten de la iteracion en
%el vector x0
legend({'función','óptimo'},'FontSize',15)

title('Gráfica en 3D','FontSize',15)
xlabel('x','FontSize',15)
ylabel('y','FontSize',15)
zlabel('f(x,y)','FontSize',15)
view([-20,60]) % estos valores definen la vista 3D del plot


figure
hold on
grid on

contour(x1,y1,z,20) % plot de la rejilla en 2D
plot(x0(1),x0(2),'r*','LineWidth',2,'MarkerSize',10) % % plot del minimo encontrado
%la solucion se plotea en las coordenadas que resulten de la iteracion en
%el vector x0 pero ahora en 2D
legend({'función','óptimo'},'FontSize',15)

title('Gráfica en 2D','FontSize',15)
xlabel('x','FontSize',15)
ylabel('y','FontSize',15)


%grafica de convergencia
figure
hold on
grid on
plot(conv,'LineWidth',1);
xlim([0 N]);
title("convergencia")
