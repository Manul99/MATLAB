% Create tiled chart layout
t = tiledlayout(2,2);
title('Trigonmetric Function')
x = linspace(0,30);

% Create axes in titles chart layout
nexttile
plot(x,sin(x))
title('Sine')

nexttile
plot(x,cos(x))
title('Cosine')

nexttile
plot(x,tan(x))
title('Tangent')

nexttile
plot(x,sec(x))
title('Secant')
