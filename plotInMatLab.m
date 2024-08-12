clear all

% <https://www.mathworks.com MathWorks> 

x = linspace(0,2*pi); % Returns a row vector of 100 evenly spaced points
y = sin(x);

% Label the axes and add title
xlabel('x');
ylabel('sin(x)');
title('Plot of the Sine function')
plot(x,y,'r--');

% Returns plots in the current axes so that new plots added to the axes do
% not delete existing plots

hold on
y2 = cos(x);
plot(x,y2,'b--');
hold off
