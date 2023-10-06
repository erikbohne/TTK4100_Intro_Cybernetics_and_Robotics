% Euler's method for AUV 
% Define values
u = 500; % [N]
m = 200; % [kg]
k = 100; % [kg/s]
h = 0.1; % time step
t = 0:h:15; % range of t from t = 0 to t = 15
v = zeros(size(t));
v(1) = 0; % v(0)

% Iterate over all values of t
for n = 1:numel(t) - 1

    % Define function
    v_dot = u/m - (k/m) * v(n);
    
    % Find next v value
    v(n + 1) = v(n) + h * v_dot;
   
end

% Plot velocity
hold on;
plot(t, v, "b-")

% Plot the exact solution
v_exact = exp((-(k/m) * t)) * (v(1) - (u/k)) + (u/k);

plot(t, v_exact, "r-")
xlabel('Time [s]')
ylabel('Velocity [m/s]')
title('Velocity of AUV using Euler''s Method (Blue) vs Exact solution (Red)')
hold off;