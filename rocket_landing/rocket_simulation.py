import pygame
from scipy.io import loadmat
import time
import random
import math

# Initialize pygame
pygame.init()

# Screen dimensions
WIDTH, HEIGHT = 1200, 800

# Colors
BLUE = (135, 206, 235)  # Sky color
WHITE = (255, 255, 255)
GREEN = (0, 128, 0)  # Ground color
BLACK = (0, 0, 0)     # Text color
RED = (255, 0, 0)     # Thrust bar color
YELLOW = (255, 255, 0)  # Color for particles
GREY = (128, 128, 128)  # Color for landing pad

# Load the data from the .mat file
data = loadmat('simulationResults.mat')
h_data = [float(h) for h in data['h'].flatten()]
t_data = [float(t) for t in data['t'].flatten()]
u_th_data = [float(u) for u in data['u_m'].flatten()]
u_theta_data = [float(u_theta) for u_theta in data['u_theta'].flatten()]
v_data = [float(v) for v in data['v'].flatten()]
theta_data = [float(theta) for theta in data['theta'].flatten()] # in radians
fuel_mass = [float(fuel) for fuel in data['fuel_mass_t'].flatten()]
wind = [float(w) for w in data['w'].flatten()]


# Set up the display and font
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption('Rocket Landing Simulation')
font = pygame.font.SysFont('Arial', 24)

# Rocket scaling factors
zoom_scale_factor = 6.67  # Adjusted scale factor
rocket_height_scaled = int(70 * zoom_scale_factor)
rocket_width_scaled = int(4 * zoom_scale_factor)
rocket_pixel_height = rocket_height_scaled * 0.05  # after the scaling
meter_per_pixel = 70 / rocket_pixel_height  # as rocket is 70 meters
leg_length = int(10 * zoom_scale_factor)

background_height = int(meter_per_pixel * max(h_data))
background_surface = pygame.Surface((WIDTH, background_height))

def scale_height(h):
    return HEIGHT - h * HEIGHT / 10000  # Scaling to fit HEIGHT

def rotate_point(x, y, theta, cx, cy):
    """Rotate point (x,y) about point (cx,cy) by angle theta"""
    dx = x - cx
    dy = y - cy
    x_new = dx * math.cos(theta) - dy * math.sin(theta) + cx
    y_new = dx * math.sin(theta) + dy * math.cos(theta) + cy
    return x_new, y_new

def get_side_thruster_coordinates(x, y, theta, offset_x, offset_y):
    """Get the starting coordinates of the side thrusters after rotation"""
    thruster_x = x + offset_x
    thruster_y = y + offset_y
    thruster_x_rotated, thruster_y_rotated = rotate_point(thruster_x, thruster_y, theta, x, y)
    return int(thruster_x_rotated), int(thruster_y_rotated)

def draw_full_background():
    current_height = max(h_data)
    for y in range(0, background_height, int(100 * meter_per_pixel)):
        pygame.draw.line(background_surface, WHITE, (0, y), (WIDTH, y), 2)
        height_label = font.render(f"{int(current_height)} m", True, WHITE)
        background_surface.blit(height_label, (10, y))
        current_height -= 100
    

# Call the function once to prepare the entire background
draw_full_background()

def draw_window(rocket_pos, thrust, velocity, time, height, theta, u_theta):
    # Clear the entire screen
    screen.fill(BLACK)
    
    # Vertical View (Right)
    right_center = HEIGHT + (WIDTH - HEIGHT) // 2
    scaled_h = int(scale_height(height))
    pygame.draw.rect(screen, GREEN, (HEIGHT, HEIGHT - 20, WIDTH - HEIGHT, 20))  # Ground
    pygame.draw.rect(screen, BLUE, (HEIGHT, 0, WIDTH - HEIGHT, HEIGHT - 20))  # Sky
    pygame.draw.rect(screen, RED, (right_center - rocket_width_scaled * 0.001 // 2, scaled_h, rocket_width_scaled * 0.1, rocket_height_scaled * 0.05))  # Rocket

    # Calculate the portion of the background to show based on rocket height
    offset = background_height - int(meter_per_pixel * height) - HEIGHT + 60
    screen.blit(background_surface, (0, 0), (0, offset, HEIGHT, HEIGHT))

    # Draw the stationary rocket
    rocket_rect = pygame.Rect(HEIGHT // 2 - rocket_width_scaled // 2, HEIGHT // 2 - rocket_height_scaled // 2, rocket_width_scaled, rocket_height_scaled)
    #pygame.draw.rect(screen, RED, rocket_rect)
    #pygame.draw.line(screen, RED, rocket_rect.midbottom, (rocket_rect.midbottom[0] - leg_length // 2, rocket_rect.midbottom[1] + leg_length), 4)
    #pygame.draw.line(screen, RED, rocket_rect.midbottom, (rocket_rect.midbottom[0] + leg_length // 2, rocket_rect.midbottom[1] + leg_length), 4)
    
    # Calculate the COG of the rocket
    cog_x = HEIGHT // 2
    cog_y = HEIGHT // 2 + 20 * zoom_scale_factor
    
    # Rotate the rocket around COG
    rocket_points = [
        (rocket_rect.topleft[0], rocket_rect.topleft[1] + 10 * zoom_scale_factor),
        rocket_rect.topleft,
        rocket_rect.topright,
        (rocket_rect.topright[0], rocket_rect.topright[1] + 10 * zoom_scale_factor),
        rocket_rect.bottomright,
        rocket_rect.bottomleft
    ]
    rocket_points_rotated = [rotate_point(x, y, theta, cog_x, cog_y) for x, y in rocket_points]
    pygame.draw.polygon(screen, RED, rocket_points_rotated)
    
    # Rotate and draw the rocket legs around COG
    leg_left_start = rocket_rect.midbottom
    leg_left_end = (rocket_rect.midbottom[0] - leg_length // 2, rocket_rect.midbottom[1] + leg_length)
    leg_left_start_rotated = rotate_point(leg_left_start[0], leg_left_start[1], theta, cog_x, cog_y)
    leg_left_end_rotated = rotate_point(leg_left_end[0], leg_left_end[1], theta, cog_x, cog_y)
    pygame.draw.line(screen, RED, leg_left_start_rotated, leg_left_end_rotated, 4)

    leg_right_start = rocket_rect.midbottom
    leg_right_end = (rocket_rect.midbottom[0] + leg_length // 2, rocket_rect.midbottom[1] + leg_length)
    leg_right_start_rotated = rotate_point(leg_right_start[0], leg_right_start[1], theta, cog_x, cog_y)
    leg_right_end_rotated = rotate_point(leg_right_end[0], leg_right_end[1], theta, cog_x, cog_y)
    pygame.draw.line(screen, RED, leg_right_start_rotated, leg_right_end_rotated, 4)
    
    # COG
    cog_radius = 10  # Radius of the COG circle
    pygame.draw.circle(screen, YELLOW, (int(cog_x), int(cog_y)), cog_radius)

    # Thrust particles
    if thrust > 1:
        num_particles = int(500 * (thrust / max(u_th_data)))  # Scaled number of particles
        for i in range(num_particles):
            particle_x = random.randint(rocket_rect.left, rocket_rect.right)
            particle_y = random.randint(rocket_rect.bottom, rocket_rect.bottom + int(20 * (thrust / max(u_th_data)) * zoom_scale_factor))
            # Generate random variations of yellow
            yellow_r = random.randint(200, 255)
            yellow_g = random.randint(200, 255)
            yellow_color = (yellow_r, yellow_g, 0)
            pygame.draw.circle(screen, yellow_color, (particle_x, particle_y), 5)
            
    # Side Thrust particles
    side_thrust_intensity = abs(u_theta) / 10000  # Normalize to range [0, 1]
    num_side_particles = int(50 * side_thrust_intensity)

    left_thruster_x, left_thruster_y = get_side_thruster_coordinates(cog_x, cog_y, theta, -rocket_width_scaled // 3, -rocket_height_scaled // 1.5)
    right_thruster_x, right_thruster_y = get_side_thruster_coordinates(cog_x, cog_y, theta, rocket_width_scaled // 3, -rocket_height_scaled // 1.5)

    # Determine the orthogonal direction based on the rocket's orientation
    dx = -math.sin(theta - math.pi / 2)
    dy = math.cos(theta - math.pi / 2)

    for i in range(num_side_particles):
        # Set the base x and y for the thruster currently active
        if u_theta > 0:  # Left thruster
            base_x = left_thruster_x
            base_y = left_thruster_y
            # Randomize the offset in the direction of thrust
            offset_distance = random.randint(0, int(10 * side_thrust_intensity * zoom_scale_factor))
            particle_x = base_x + -dx * offset_distance
            particle_y = base_y + -dy * offset_distance
        else:  # Right thruster
            base_x = right_thruster_x
            base_y = right_thruster_y
            # Randomize the offset in the direction of thrust
            offset_distance = random.randint(0, int(10 * side_thrust_intensity * zoom_scale_factor))
            particle_x = base_x + dx * offset_distance
            particle_y = base_y + dy * offset_distance

        # Draw the particle with random variations of white
        white_r = random.randint(200, 255)
        white_g = random.randint(200, 255)
        white_color = (white_r, white_g, white_g)
        pygame.draw.circle(screen, white_color, (int(particle_x), int(particle_y)), 3)


    
    # Metrics
    velocity_text = font.render(f"Speed: {velocity:.2f} m/s", True, WHITE)
    time_text = font.render(f"Time: {time:.2f} s", True, WHITE)
    height_text = font.render(f"Height: {height:.2f} m", True, WHITE)
    theta_text = font.render(f"Angle: {theta:.2f} rad", True, WHITE)
    u_theta_text = font.render(f"Side thruster: {u_theta:.0f} N", True, WHITE)
    
    # Fuel bar
    fuel_bar_width = 50
    fuel_bar_height = 500
    fuel_bar_surface = pygame.Surface((fuel_bar_width, fuel_bar_height))
    fuel_bar_surface.fill(GREY)
    fuel_bar_rect = pygame.Rect(0, 0, fuel_bar_width, fuel_bar_height)
    fuel_bar_rect.bottomleft = (750, HEIGHT)
    screen.blit(fuel_bar_surface, fuel_bar_rect)
    pygame.draw.rect(screen, BLACK, fuel_bar_rect, 2)
    
    # Draw the fuel bar
    fuel_bar_height_scaled = fuel_bar_height * (fuel_mass[idx] / max(fuel_mass)) / 4
    fuel_bar_rect_scaled = pygame.Rect(0, 0, fuel_bar_width, fuel_bar_height_scaled)
    fuel_bar_rect_scaled.bottomleft = (750, HEIGHT)
    pygame.draw.rect(screen, YELLOW, fuel_bar_rect_scaled)
    
    # Show wind as a vector
    wind_arrow_length = 50
    wind_arrow_x = 400
    wind_arrow_y = 100
    wind_arrow_dx = wind[idx] / 10000
    wind_arrow_dy = 0
    wind_arrow_dx_scaled = wind_arrow_dx * wind_arrow_length
    wind_arrow_dy_scaled = wind_arrow_dy * wind_arrow_length
    wind_arrow_end_x = wind_arrow_x + wind_arrow_dx_scaled
    wind_arrow_end_y = wind_arrow_y + wind_arrow_dy_scaled
    pygame.draw.line(screen, WHITE, (wind_arrow_x, wind_arrow_y), (wind_arrow_end_x, wind_arrow_end_y), 2)
    pygame.draw.line(screen, WHITE, (wind_arrow_end_x, wind_arrow_end_y), (wind_arrow_end_x - 10, wind_arrow_end_y - 5), 2)
    pygame.draw.line(screen, WHITE, (wind_arrow_end_x, wind_arrow_end_y), (wind_arrow_end_x - 10, wind_arrow_end_y + 5), 2)
    wind_text = font.render(f"Wind: {(wind[idx] / 10000):.2f} m/s", True, WHITE)
    
    
    screen.blit(velocity_text, (WIDTH - 650, 10))
    screen.blit(time_text, (WIDTH - 650, 40))
    screen.blit(height_text, (WIDTH - 650, 70))
    screen.blit(theta_text, (WIDTH - 650, 100))
    screen.blit(u_theta_text, (WIDTH - 650, 130))
    screen.blit(wind_text, (WIDTH - 650, 160))

    pygame.display.flip()


# Main loop
clock = pygame.time.Clock()
running = True
idx = 0
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    if idx < len(h_data):
        draw_window(h_data[idx], u_th_data[idx], v_data[idx], t_data[idx], h_data[idx], theta_data[idx], u_theta_data[idx])
        idx += 1
        clock.tick(24)  # Cap frame rate to 24 fps
    else:
        running = False

pygame.quit()
