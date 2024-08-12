% Read data from the weather station ThingSpeak channel
data = thingSpeakRead(12397,'Fields',[2 3 4 6],'DateRange',[datetime('07-Jan-2018'), ...
    datetime('09-Jan-2018')],...
    'OutputFormat','table');
% Assign input variables and target values
inputs = [data.Humidity';data.TemperatureF';data.PressureHg';data.WindSpeedmph'];
tempC = (5/9)*(data.TemperatureF-32); % Convert temperature from Fathrenheit to Celsius

% specify the constrants for water vapor(b) and barometric pressure(c).
b = 17.62;
c = 243.5;

% Calculate the intermediate value 'gamma' and assign target values for the
% network
gamma = log(data.Humidity/100)+b*tempC./(c + tempC);
dewPointC = c*gamma./(b-gamma);
dewPointF = (dewPointC * 1.8) + 32;
targets = dewPointF';

% Create and Train the Two-Layer Feedforward Network
net = feedforwardnet(10);
[net,triu] = train(net,inputs,targets);

% Use the Trained Model to predict Data
output = net(inputs(:,7))