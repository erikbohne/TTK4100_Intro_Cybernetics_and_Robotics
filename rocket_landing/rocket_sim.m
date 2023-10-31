% Define values
m = 25000; % kg (weight of booster to land)
F_th = 845000; % N (per Merlin motor)
F_min = F_th / 4; %
h0 = 10000; % Starting height
h_ref = -1; % height ref
k = 5.47; % Air resistance constant
v_term = -211; % Terminal velocity
v_ref = -1; % Landing velocity
g = 9.81; % Gravity
t = 90; % sim time

% Regulator values
Kp = 100000;
Ki = 20000;
Kd = 125000;

% Load your simulation data
% Assuming the simulation has already been run and data exists in workspace
sim 'rocket.slx';

u_m = ans.u_m.Data;
t = ans.tout;
h = ans.h.Data;
v = ans.v.Data;

% Landing time
landing_idx = find(h <= 0, 1, 'first');
landing_time = t(landing_idx);
landing_velocity = v(landing_idx);

% Burn start and end time
burn_start_idx = find(u_m > F_th/10, 1, 'first'); % Assuming you only want to consider burn times when thrust is more than F_th/10
burn_start_time = t(burn_start_idx);
burn_end_time = landing_time; % We cut the engine when landed

% Calculate total burn time
burn_time = landing_time - burn_start_time;

% Energy Used
energy_used = trapz(t(burn_start_idx:landing_idx), u_m(burn_start_idx:landing_idx) .* -v(burn_start_idx:landing_idx));

% Maximum G-force
a = (u_m - m*g - k*v.^2) ./ m; % Acceleration
g_force = a/g;
max_g = max(g_force);

fprintf('Burn starts at: %f seconds\n', burn_start_time);
fprintf('Burn ends at: %f seconds\n', burn_end_time);
fprintf('Total burn time: %f seconds\n', burn_time);
fprintf('Landing time: %f seconds\n', landing_time);
fprintf('Landing velocity: %f m/s\n', landing_velocity);
fprintf('Energy used: %f J (or appropriate unit)\n', energy_used);
fprintf('Maximum G-force experienced: %f g\n', max_g);

% After your simulation
save('simulationResults.mat', "u_m", "t", "h", "v");
