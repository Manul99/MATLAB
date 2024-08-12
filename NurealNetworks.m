% Neuron weight
w = [4 -2];

% Neuron Bias
b = -3;

% Activation function
func = 'tansig'; % You can explore other functions such as 'purelin' 'hardlim' or 'logsig'

% Define input vector
v = [2,3];
% Calculate the neuron output
% feval ---> Evaluate function
activation_potential = v*w'+b;

neuron_output = feval(func, activation_potenial)

