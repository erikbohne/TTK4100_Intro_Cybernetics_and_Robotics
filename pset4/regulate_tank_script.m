% Define values
h_max = 1; % m
h_ref = 0.5; % m
h_init = 0; % m
A = 1; % m^2
k = 1;
rho = 1000; % kg/m^3
w = 0; % kg/m^3
Kp = 100; %
Ki = 0.1; %
T = 200; % s

tau_values = [0, 3, 6, 9, 27];

for tau = tau_values
    sim regulate_tank.slx

    plot(ans.h.Data)
    hold on
end

legend('0', '3', '6', '9')

hold off

% Sim regulation
%sim regulate_tank.slx

% Find the last h value
%h_last = ans.h.Data(size(ans.h.Data));

% Calculate error
%error = h_ref - h_last;

%fprintf("Stasjonæravviket: %i ", error)