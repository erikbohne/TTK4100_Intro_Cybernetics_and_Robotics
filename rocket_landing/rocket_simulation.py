import pygame
from scipy.io import loadmat
import time

# Initialize pygame
pygame.init()

# Screen dimensions
WIDTH, HEIGHT = 1200, 900

# Colors
BLUE = (135, 206, 235)  # Sky color
WHITE = (255, 255, 255)
RED = (255, 0, 0)
GREEN = (0, 128, 0)  # Ground color
BLACK = (0, 0, 0)     # Text color

# Load the data from the .mat file
data = loadmat('simulationResults.mat')
h_data = [float(h) for h in data['h']]
t_data = [float(t) for t in data['t']]
u_data = [float(u) for u in data['u_m']]
v_data = [float(v) for v in data['v']]

# Set up the display and font
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption('Rocket Landing Simulation')
font = pygame.font.SysFont('Arial', 24)

# Define the rocket object
rocket = pygame.Rect(WIDTH // 2 - 15, HEIGHT - h_data[0]*0.05 - 30, 30, 60)

def scale_height(h):
    return HEIGHT - h * HEIGHT / 10000  # Scaling to fit HEIGHT

def draw_window(rocket_pos, thrust, velocity, time, height):
    screen.fill(BLUE)
    
    # Drawing the rocket
    pygame.draw.rect(screen, RED, (rocket.x, scale_height(rocket_pos) - rocket.height, rocket.width, rocket.height))
    
    # Drawing the ground
    pygame.draw.rect(screen, GREEN, (0, scale_height(0) - 20, WIDTH, 20))
    
    # Drawing grid lines for h=10,000m and h=5,000m
    pygame.draw.line(screen, BLACK, (0, scale_height(10000)), (WIDTH, scale_height(10000)), 2)
    pygame.draw.line(screen, BLACK, (0, scale_height(5000)), (WIDTH, scale_height(5000)), 2)
    
    # Drawing the power bar
    pygame.draw.rect(screen, WHITE, (50, 50, 20, 300))
    pygame.draw.rect(screen, RED, (50, 50 + (1 - thrust/max(u_data)) * 300, 20, thrust/max(u_data)*300))
    
    # Displaying metrics
    velocity_text = font.render(f"Speed: {velocity:.2f} m/s", True, BLACK)
    time_text = font.render(f"Time: {time:.2f} s", True, BLACK)
    height_text = font.render(f"Height: {height:.2f} m", True, BLACK)
    
    screen.blit(velocity_text, (WIDTH - 250, 10))
    screen.blit(time_text, (WIDTH - 250, 40))
    screen.blit(height_text, (WIDTH - 250, 70))
    
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
        draw_window(h_data[idx], u_data[idx], v_data[idx], t_data[idx], h_data[idx])
        idx += 1
        clock.tick(24)  # Cap frame rate to 24 fps
    else:
        running = False

pygame.quit()
