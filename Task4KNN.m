load fisheriris.mat

% Shuffle dataset and split into training and testing
rng(1);
data = meas;
labels = species;
Numberofrows = size(data,1);
indices = randperm(Numberofrows);
training_Indices = indices(1:round(0.6*Numberofrows));
testing_Indices = indices(round(0.6 * Numberofrows) + 1:end);

trainingData = data(training_Indices,:);
trainingLabels = labels(training_Indices);
testing_data = data(testing_Indices,:);
testingLabels = labels(testing_Indices);

% Evaluate different k values (5 and 7)

k = [5,7];
for K = k
    classifier = fitcknn(trainingData,trainingLabels,'NumNeighbors',K);

    % Predict using the trained model
    prediction = predict(classifier,testing_data);

    % Calculate the confusion matrix
    c = confusionmat(testingLabels,prediction);

    % Calculate the accuracy
    accuracy = sum(diag(c) / sum(c(:)) * 100);

    fprintf('For k = %d:\n',k);
    disp(c);
    fprintf('Accuracy:%.2f%',accuracy);

end




