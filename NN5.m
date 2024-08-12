% Load the traing data
[input,output] = simplefit_dataset;

%Construct a feedforward network - One layer -10 Nodes
net = feedforwardnet(10);

%Train the network net using the training data.
net = train(net,input,output);
view(net)

%Access the performance using the input and target
TT = perform(net,input,output)

%Estimate the targets using the trained network
Acutal_output = net(input);

%Access the perfomance after training using MSE
perf = perform(net,Acutal_output,output)