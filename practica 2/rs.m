clear
close all
clc 

f = @(x,y) x.*exp(-x.^2-y.^2); % funcion objetivo

x0=[-2 -2]';
xu=[2 2]';
xl=[-2 -2]';
D=2;
for i=1:10000
    
    y=xl+(xu-xl).*rand(D,1);
    if f(y(1,1), y(2,1))< f(x0(1,1), x0(2,1) )
        x0=y;
    end
end
