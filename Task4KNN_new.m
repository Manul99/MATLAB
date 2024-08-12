load fisheriris.mat;

% Allocating data for training
trainFraction = 0.6;

% Find how many data samples should be in the training and testing
numberOfSamples = size(meas,1);
NumberOfTrain = round(trainFraction * numberOfSamples);
NumberOfTesting = numberOfSamples - NumberOfTrain;

% Shuffle data set randomly
shuffledIndices = randperm(numberOfSamples);
shuffledData = meas(shuffledIndices,:);
shuffledSpecies = species(shuffledIndices);

% Create Training data and target
trainingData = shuffledData(1:NumberOfTrain,:);
trainingTarget = shuffledSpecies(1:NumberOfTrain);

% Create Testing data and target
testingData = shuffledData(NumberOfTesting + 1:end,:);
testingTarget = shuffledSpecies(NumberOfTesting +1:end);

% Evaluate different k values 5 and 7
k = [5,7];

% Looping through the k values 
for K = k
    % Create K-NN classifer
    model = fitcknn(trainingData,trainingTarget,'NumNeighbors',K);
    
    % Predict the species for the testing data
    predicting = predict(model,testingData);

    % Create confusion matrix
    c = confusionmat(testingTarget,predicting);

    % Find the percentage of correct classification
    correctClassification = sum(diag(c));
    total = sum(c(:));
    percentage = (correctClassification / total) * 100;
    
    % Display the confusion matrix and percentage of correct classification
    fprintf('Confusion matrix for k = %d:\n',K);
    disp(c);
    fprintf('Precentage of correct classification for k = %.2f%%\n',K,percentage);

end







