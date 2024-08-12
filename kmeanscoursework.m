data = load('kmeansdata.mat');

% Display the sturcture of loaded data
disp('Displaying the structure of the loaded data')
disp(data)

x = data.X;

% Initialize variables to store the intertias and k values
intertias = [];
k = 3:5; % Range of k values

% Run k-means for different values of k
for k = k
    % Run kmean clustering
    [idx,c,smud] = kmeans(x,k);

    % Calculate and store the sum of squad distance
    intertias(end +1) = sum(smud);

end

% Plot the Elbow curve
figure;
plot(k,intertias,'o-');
title('Elbow Method for Optimal k ')
xlabel('Number of clusters')
ylabel('Sum of Squared Distances')

optimal_k =5;

% Run k-means with the optimal k
[idx,c] = kmeans(x,optimal_k);