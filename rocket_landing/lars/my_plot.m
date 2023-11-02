% Load the data
load 'simulationResults.mat'

t = ans.tout;
h = ans.hoyde.Data;
v = ans.fart.Data;
u_m = ans.u_hoyde.Data;
theta = ans.theta.Data;
u_theta = ans.u_theta.Data;
fuel_mass_t = ans.fuel_mass.Data;
w = ans.w.Data;

% Set remaining values to zero after the rocket has landed
h(landing_idx+1:end) = 0;
v(landing_idx+1:end) = 0;
u_m(landing_idx+1:end) = 0;
theta(landing_idx+1:end) = 0;
u_theta(landing_idx+1:end) = 0;
fuel_mass_t(landing_idx+1:end) = fuel_mass_t(landing_idx);
w(landing_idx+1:end) = 0;

% Plot u_m, u_theta and fuel_mass_t
figure(1)
yyaxis left
plot(t, u_m, 'r', 'LineWidth', 1.5);
hold on
plot(t, u_theta, 'b', 'LineWidth', 1.5);
ylabel('Skyvekraft')
yyaxis right
plot(t, fuel_mass_t, 'g', 'LineWidth', 1.5);
xlabel('Tid (s)')
ylabel('Drivstoffmasse (kg)')
title('Skyvekraft og Drivstoffmasse over Tid')
legend('u (Skyvekraft fra rakettmotoren)', 'u_{\theta} (Skyvekraft fra sidemotorene)', 'Drivstoffmasse over tid')
hold off
saveas(gcf,'Skyvekraft_Drivstoffmasse.png')

% Plot h and v in the same plot with separate y-axes
figure(2)
yyaxis left
plot(t, h, 'r', 'LineWidth', 1.5);
ylabel('Høyde (m)')
yyaxis right
plot(t, v, 'b', 'LineWidth', 1.5);
xlabel('Tid (s)')
ylabel('Fart (m/s)')
title('Høyde og Fart over Tid')
legend('h (Høyde)', 'v (Fart)')
saveas(gcf,'Hoyde_Fart.png')
