load 'kmeansdata.mat';

% Number of clusters
k = [3,4,5];

% Variables to store the results
silh = zeros(length(k),1);
cluster_indices = cell(1, length(k));

for i = 1:length(k)
    clusters = k(i);

    % Perform KMeans clustering
    [cluster,c] = kmeans(X,clusters);

    % Calculate the Silhouette measure and store the mean Silhoutte score
    silhplot = silhouette(X, cluster);
    silh(i) = mean(silhplot);
    clusterAssign{i} = cluster;

    % Plot the Sillhoutte for each cluster in separate figure
    figure;
    silhouette(X,cluster);
    title(['Silhouette plot for' ,int2str(clusters), 'clusters']);
    xlabel('Silhouette Value');
    ylabel('Cluster');

    % Plot clusters and centroids in a separate figure
    figure;
    gscatter(X(:,1),X(:,2),cluster);
    hold on;
    plot(c(:,1),c(:,2),'kx','MarkerSize',15,'LineWidth',3);
    legend('Cluster 1','Cluster 2','Cluster 3', 'Cluster 4','Cluster 5','Centroids', ...
        'Location','NW')
    title(['Cluster centroids (K=', num2str(clusters) ,')']);
    xlabel('X values');
    ylabel('Y values');

    fprintf('Centroids for K=%d:\n',clusters);
    

end

% Find the best number of clusters
[best,bestIndex] = max(silh);
best_cluster = k(bestIndex);

fprintf('Best number of clusters are: %d\n',best_cluster);
fprintf('Mean silhouette for the best k: %f\n',best);
