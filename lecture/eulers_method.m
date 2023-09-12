x=0;

h=0.5; % step size
a=-1;
T=10; % simulation time
x(1)=10; % initial value

for n=2:(T/h+1) % iterate over all time steps using the Eulers method
    x(n) = x(n-1)+h*(a*x(n-1));
end

t=0:h:T; % define t values
plot(t,x); % plot the x(t) values
grid on
hold on
