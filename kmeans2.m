rng default; % For reproducibility
data = [randn(100,2)*0.75+ones(100,2);
randn(100,2)*0.5-ones(100,2)];
figure;
plot(data(:,1),data(:,2),'.');
title 'Randomly Generated Data';
% idx is a vector of predicted cluster indices corresponding to 
the observations in X.
% C is a 3-by-2 matrix containing the final centroid locations.
k=2;
[idx,C,sumd]=kmeans(data,k); 
[silh,h] = silhouette(data,idx,'sqEuclidean');
title(['Number of clussters = ' int2str(k)]);
xlabel 'Silhouette Value '
ylabel 'Cluster'
mean_silh=mean(silh);