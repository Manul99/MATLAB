
load fisheriris.mat

% N - the total number of rows (objects, cases).
rows = size(meas, 1);
fprintf('Total number of Rows : %d \n', rows);


% Calculate the values and report it for each Columns from 1 to 4 
for i=1:4

    % Mean 
    meanValue = mean(meas(:,i));

    % Standard diviation  
    stdValue = std(meas(:,i));

    % Max 
    maxValue = max(meas(:,i));

    % Min
    minValue = min(meas(:,i));

    % Root mean square 
    rsmValue = rms(meas(:,i));



% Displaying all the Features 
    fprintf('\n');
    fprintf('Column: %d \n',i);
    fprintf('Mean value = %.4f \n',meanValue);
    fprintf('Standard Diviation Value = %.4f \n',stdValue);
    fprintf('Maximun Value  = %.4f \n',minValue);
    fprintf('Minimum Value = %.4f \n',maxValue);
    fprintf('Root Mean Square = %.4f \n',rsmValue);
end
