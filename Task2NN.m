% Load Fisher Iris dataset
load fisheriris;

% Getting random data
trainFraction = 0.6;

% Find how many data samples should be in the training and testing
numberOfSamples = size(meas, 1);
NumberOfTrain = round(trainFraction * numberOfSamples);
NumberOfTesting = numberOfSamples - NumberOfTrain;

% Shuffle data set randomly
shuffledIndices = randperm(numberOfSamples);
shuffledData = meas(shuffledIndices, :);
shuffledSpecies = species(shuffledIndices);

% Create Training data and target
trainingData = shuffledData(1:NumberOfTrain, :);
trainingTarget = categorical(shuffledSpecies(1:NumberOfTrain));

% Create Testing data and target
testingData = shuffledData(NumberOfTrain + 1:end, :);
testingTarget = categorical(shuffledSpecies(NumberOfTrain + 1:end));

% Number of iterations for experiments
experimentTime = 3;

% Hidden layer sizes
hiddenLayerSizes = [10, 15, 20];

% Creating array to store accuracies
accuracies = zeros(experimentTime, length(hiddenLayerSizes));

for h = 1:length(hiddenLayerSizes)
    hiddenLayerSize = hiddenLayerSizes(h);

    for i = 1:experimentTime
        fprintf('Hidden layer size: %d, Experiment Time: %d\n', hiddenLayerSize, i);

        % Select feedforwardnet for neural network
        net = feedforwardnet(hiddenLayerSize);

        % Train the neural network
        net = train(net, trainingData', ind2vec(double(trainingTarget)')); 

        % View trained network 
        view(net);

        % Prediction for testing set
        predictions = net(testingData');

         % Convert predicted labels to categorical
         predictedLabels = vec2ind(predictions);
         
        % Checking the accuracy
        accuracy = sum(predictedLabels == double(testingTarget')) / length(testingTarget);
        fprintf('Accuracy: %.2f%%\n', accuracy * 100);

        % Store accuracy for averaging
        accuracies(i, h) = accuracy;
    end
end

% Calculate and display average accuracy for each hidden layer size
averageAccuracies = mean(accuracies);
for h = 1:length(hiddenLayerSizes)
    fprintf('Average Accuracy for Hidden Layer Size %d: %.2f%%\n', hiddenLayerSizes(h), averageAccuracies(h) * 100);
end
