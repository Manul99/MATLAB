data = randi([1,100],1,200);

% Plot the data 
figure;
plot(data);
xlabel('x');
ylabel('y');
title('The plot of the data');

% Normalize the data between -1 to 1
min_val = min(data);
max_val = max(data);

for i = 1:length(data)
    normalize_data = -1 + 2 * (data(i)-min_val) / (max_val - min_val);
end
% Plot the normalize data
figure;
plot(normalize_data);
xlabel('Normalize x');
ylabel('Normalize y');
title('The plot of the normalize data');

