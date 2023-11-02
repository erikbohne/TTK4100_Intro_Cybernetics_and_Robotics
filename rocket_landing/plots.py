import numpy as np
import matplotlib.pyplot as plt
from scipy.io import loadmat

# Load the data from the .mat file
data = loadmat('simulationResults.mat')
h = [float(h) for h in data['h'].flatten()]
t = [float(t) for t in data['t'].flatten()]
u = [float(u) for u in data['u'].flatten()]
u_m = [float(u) for u in data['u_m'].flatten()]
u_theta = [float(u_theta) for u_theta in data['u_theta'].flatten()]
theta = [float(theta) for theta in data['theta'].flatten()]
v = [float(v) for v in data['v'].flatten()]
theta_data = [float(theta) for theta in data['theta'].flatten()] # in radians
fuel_mass_t = [float(fuel) for fuel in data['fuel_mass_t'].flatten()]
w = [float(w) for w in data['w'].flatten()]

# This is a placeholder for landing_idx, replace with your actual value
landing_idx = len(t) - 10

# Set remaining values to zero after the rocket has landed
h = h
v[landing_idx:] = [0] * (len(v) - landing_idx)
u[landing_idx:] = [0] * (len(u) - landing_idx)
u_m[landing_idx:] = [0] * (len(u_m) - landing_idx)
u_theta[landing_idx:] = [0] * (len(u_theta) - landing_idx)
fuel_value = fuel_mass_t[landing_idx-1]
fuel_mass_t[landing_idx:] = [fuel_value] * (len(fuel_mass_t) - landing_idx)
w[landing_idx:] = [0] * (len(w) - landing_idx)


# Plot u_m
plt.figure(1)
plt.title('Mettet pådrag')
plt.plot(t, u_m, label='Mettet pådrag')
plt.xlabel('Tid [s]')
plt.ylabel('Mettet pådrag [N]')
plt.savefig('u_m.png')

# Plot v
plt.figure(2)
plt.title('Fart')
plt.plot(t, v, label='Fart')
plt.xlabel('Tid [s]')
plt.ylabel('Fart [m/s]')
plt.savefig('v.png')

# Plot u_theta
plt.figure(3)
plt.title('Mettet vinkel pådrag')
plt.plot(t, u_theta, label='Mettet vinkel pådrag')
plt.xlabel('Tid [s]')
plt.ylabel('Mettet vinkel pådrag [N]')
plt.savefig('u_theta.png')

# Plot theta
plt.figure(4)
plt.title('Vinkel')
plt.plot(t, theta_data, label='Vinkel')
plt.xlabel('Tid [s]')
plt.ylabel('Vinkel [rad]')
plt.savefig('theta.png') 

# Plot h    
plt.figure(5)
plt.title('Høyde')
plt.plot(t, h, label='Høyde')
plt.xlabel('Tid [s]')
plt.ylabel('Høyde [m]')
plt.savefig('h.png')

# Plot u
plt.figure(6)
plt.title('Pådrag')
plt.plot(t, u, label='Pådrag')
plt.xlabel('Tid [s]')
plt.ylabel('Pådrag [N]')
plt.savefig('u.png')


# Plot w
plt.figure(7)
plt.title('Forstyrrelse')
plt.plot(t, w, label='Forstyrrelse')
plt.xlabel('Tid [s]')
plt.ylabel('Forstyrrelse [N]')
plt.savefig('w.png')

# Find tangent to the first change of h (when u_m is not zero the first time)
# Plot only the part from where u_m is not zero the first time
# Plot this tangent and where this tangent crosses zero to find time constant

# Find the index where u_m is not zero the first time
u_m_not_zero_idx = 0
for i in range(len(u_m)):
    if u_m[i] != 0:
        u_m_not_zero_idx = i
        break

# Remove all h values before u_m is not zero the first time
h = h[u_m_not_zero_idx:]
t = t[u_m_not_zero_idx:]
v = v[u_m_not_zero_idx:]

# Remove all values after t = 20 and reindex from 0 seconds
t = t[:20*24]
t = [i - t[0] for i in t]
h = h[:20*24]
v = v[:20*24]

# Fit a tangent to the first change of h
tangent = np.polyfit(t[:12], h[:12], 1)

# Find where tangent crosses zero
t_cross_zero = -tangent[1] / tangent[0]


# Plot new h with tangent
plt.figure(8) 
plt.title('Høyde')
plt.plot(t, h, label='Høyde')
# Print the tangent until it crosses zero and mark this point with label it should be when x = t_cross_zero
plt.plot(t[:5*24], np.polyval(tangent, t[:5*24]), label='Tangent')
plt.plot(t_cross_zero, 0, 'ro', label='t = {:.2f} s'.format(t_cross_zero))
plt.legend()
plt.xlabel('Tid [s]')
plt.ylabel('Høyde [m]')
plt.savefig('h_T.png')

# Find tangent for v
tangent = np.polyfit(t[:12], v[:12], 1)

# Find where tangent crosses zero
t_cross_zero = -tangent[1] / tangent[0]

# Plot new v with tangent
plt.figure(9)
plt.title('Fart')
plt.plot(t, v, label='Fart')
# Print the tangent until it crosses zero and mark this point with label it should be when x = t_cross_zero
plt.plot(t[:8*24], np.polyval(tangent, t[:8*24]), label='Tangent')
plt.plot(t_cross_zero, 0, 'ro', label='t = {:.2f} s'.format(t_cross_zero))
plt.legend()
plt.xlabel('Tid [s]')
plt.ylabel('Fart [m/s]')
plt.savefig('v_T.png')


