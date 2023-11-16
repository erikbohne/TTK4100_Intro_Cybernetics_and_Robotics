% Define motor and PID parameters
L_a = 1; % Anchor inductance
R_a = 10; % Anchor resistance
K_E = 1; % Motor voltage constant
K_M = 1; % Motor torque constant
J_m = 0.1; % Motor inertial constant
M_L = 0; % Load on motor
theta_ref = pi/2; % Reference angle in radians
t = 20; % Simulation time

% Run simulation with initial PID parameters from Ziegler Nichols
Kp = 6;
Ki = 0.625;
Kd = 0.25;
N = 100;
sim('dc_motor_sim.slx'); % Ensure this is the correct way to call your Simulink model
% Define motor and PID parameters
L_a = 1; % Anchor inductance
R_a = 10; % Anchor resistance
K_E = 1; % Motor voltage constant
K_M = 1; % Motor torque constant
J_m = 0.1; % Motor inertial constant
M_L = 0; % Load on motor
theta_ref = pi/2; % Reference angle in radians
t = 20; % Simulation time

% Run simulation with initial PID parameters from Ziegler Nichols
Kp = 6;
Ki = 0.625;
Kd = 0.25;
N = 100;
sim('dc_motor_sim.slx'); % Ensure this is the correct way to call your Simulink model

figure; % Create new figure for plot
plot(ans.theta.Data, 'DisplayName', 'Ziegler Nichols'); % Plot with label
hold on; % Hold for next plot

% Run simulation with adjusted PID parameters after Simulink PID tuner
Kp = 2.51;
Ki = 0.2074;
Kd = 0.7061;
N = 227.4;
sim('dc_motor_sim.slx');

plot(ans.theta.Data, 'DisplayName', 'Simuling PID tuner'); % Plot with label
xlabel('Time (s)'); % Label X-axis
ylabel('Theta (radians)'); % Label Y-axis
title('DC Motor Response with PID Control'); % Add title
legend; % Add legend
hold off; % Release plot hold

saveas(gcf, 'DC_Motor_PID_Comparison.png');
