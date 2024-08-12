picture =imread('Dog.jpg');
nnet = alexnet; % Load the neural net
picture = imresize(picture,[227,227]); % Resize the picutre
label = classify(nnet,picture); % Classify the picutre
image(picture);
title(char(label)); % Show the label
drawnow;