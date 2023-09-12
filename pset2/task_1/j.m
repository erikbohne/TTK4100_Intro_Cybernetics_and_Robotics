% Define values
m = 200; % Mass of AUV [kg]
k = 100; % Constant of proportionality [kg/s]
u = 200; % Force of propellers from t = 0s to t = 15s [N]

% Time intervals
t1 = linspace(0, 15, 500); % 0 to 15 seconds
t2 = linspace(15, 30, 500); % 15 to 30 seconds

% Velocity equations for first interval
v1 = (1/k) * u * (1 - exp(-(k * t1 / m)));

% Calculate the initial speed at t = 15s
v_initial = v1(end);

% Velocity equations for second interval
v2 = v_initial * exp(-(k / m) * (t2 - 15));

% Plotting
figure;
plot([t1, t2], [v1, v2], 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('AUV Velocity Profile')
grid on;
