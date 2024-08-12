clc;
clear all;

x = linspace(0,2 * pi);
y = sin(x);

xlabel("x");
ylabel("sin(X)")
title("Plot the Sine Function")
plot(x,y,"r--")

hold on
y2 = cos(x);
plot(x,y,"b--")
hold off