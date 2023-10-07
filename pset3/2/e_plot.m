% MATLAB script to plot x as a function of z

% Load the data from the workspace
% Extract the data from the timeseries object
x = out.x.Data;
z = out.z.Data;

% Check if the data arrays are of the same length
if length(x) ~= length(z)
    error('The lengths of x and z data must be the same.');
end

% Create the plot
figure; % Create a new figure window
plot(x, z); % Plot z as a function of x
grid on; % Turn the grid on

% Add labels and title
xlabel('X Position');
ylabel('Z Position');
title('Trajectory of the AUV in the xz-plane');

% Show the plot
drawnow;
