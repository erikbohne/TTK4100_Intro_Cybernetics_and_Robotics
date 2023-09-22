% Assign value for µ
mu = 1;

% Define constants
tsim = 20;
x1_0 = 0.01;
x2_0 = 0.01;

% Start simulation
sim('model.slx');

% Plot graph
figure;
plot(ans.values.Data);
xlabel('x1');
ylabel('x2');
title('Van der Pol Oscillator');