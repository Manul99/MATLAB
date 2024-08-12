data = randi([1,100],1,200);

% Plot the data
figure;
plot(data);
xlabel('x');
ylabel('y');
title('Plot of the data');

% Normalize the data to range -1 to 1
min_val = min(data);
max_val = max(data);
normalize_data = -1 + 2 * (data - min_val) / (max_val - min_val);

% Plot the normalize data
figure;
plot(normalize_data);
xlabel('x');
ylabel('l');
title('Plot of normalization data');