clear all;
clc;
close all;
rng default; % For reproducibility

% Generate data with three different distributions
data1 = [randn(100,2)*0.75+ones(100,2)];
data2 = [randn(100,2)*0.5-ones(100,2)];
data3 = [randn(100,2)*0.5+2*ones(100,2)];

data = [data1; data2; data3];

figure;
plot(data(:,1),data(:,2),'.');
title 'Randomly Generated Data';

k = 3;
[idx, C, sumd] = kmeans(data, k); 
[silh, h] = silhouette(data, idx, 'sqEuclidean');
title(['Number of clusters = ' int2str(k)]);
xlabel 'Silhouette Value '
ylabel 'Cluster'
mean_silh = mean(silh);


figure;
plot(data(idx==1,1), data(idx==1,2), 'r.', 'MarkerSize', 12)
hold on
plot(data(idx==2,1), data(idx==2,2), 'b.', 'MarkerSize', 12)
plot(data(idx==3,1), data(idx==3,2), 'g.', 'MarkerSize', 12)
plot(C(:,1), C(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3) 
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Centroids', 'Location', 'NW')
title 'Cluster Assignments and Centroids'
hold off


% Generate new test data
test_data = [randn(50,2)*0.75+ones(50,2);
             randn(50,2)*0.5-ones(50,2);
             randn(50,2)*0.5+2*ones(50,2)];

% Use the previously computed centroids to assign the test data to clusters
[test_idx, ~] = knnsearch(C, test_data);


figure;
gscatter(test_data(:,1), test_data(:,2), test_idx, 'rgb', 'o', 8);
title 'Test Data Cluster Assignments';