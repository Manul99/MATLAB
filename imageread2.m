% Load Pre-trained Network (AlexNet)-- Author Joe Hicklin
% AlexNet is a pre-trained network trained on 1000 object categories.
alex = alexnet;
% Review Network Architecture
layers = alex.Layers

% Modify pre-trained Network
% AlexNet was trained to recognize 1000 classes, we need to modify it to
% Here we recognize just 2 classes.
layers(23) = fullyConnectedLayer(2); %change this based on # of classes
layers(25) = classificationLayer
allImages = imageDatastore(['Images','IncludeSubfolders',true,'LabelSource'])
