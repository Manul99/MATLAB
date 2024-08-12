% Create and train
N = 20;

offset = 5;
x = [randn(2, N), randn(2, N) + offset];
y = [ones(1,N), -1*ones(1, N)];

% Plot inputs samples with PLOTPV(plot perceptron input / target vectors)
figure(1);
plotpv(x',y);

%Create and train perceptron
net = perceptron;
net = train(net, x',y);
view(net);

%plot decision boundary
figure(1);
plotpc(net.IW{1}, net.b{1});
