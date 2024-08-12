inputs = [1:6]'; % Input vector (6-dimensional pattern)
outputs = [1 2];

%Define and custome network
net = network(...
1,... %numInputs, number of inputs,
2,... % numLayers , number of layers,
[1;0],... % biasConnect , numLayers - by - 1 Boolean vector,
[1;0],...%biasConnect , numLayers-by-numInputs Boolean matrix,
[0 0; 1 0],... % layerConnect, numLayers-by-numLayers Boolean matrix
[0 1]... % outputConnect, 1-by-numLayers Boolean vector
);

% View network structure
view(net);

% Define topology and transfer function
net.layers{1}.size = 5;% number of hidden layers neurons
net.layers{1}.transferFcn = 'logsig'; % hidden layers transfer function
view(net);

% Configure network
net = configure(net,inputs,outputs);
view(net);

% Calculate neuron output before the training
inital_output = net(inputs);% inital network response without training
% Train net and calculate neuron output
%network training
net.trainFcn = 'trainlm';
net.performFcn = 'mse'; % Mean square Error
net = train(net,inputs,outputs);
% network response after training
final_output = net(inputs);