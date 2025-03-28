# Phantom Horn

Phantom Horn is a Dockerized application that sets up a virtual display server (Xvfb) along with Firefox (using geckodriver) to enable Python browser automation with Selenium and PyAutoGUI. You could probably just replace the python script with whatever you would need it for but yea.

The original goal of this project was to have a bot that spawns and posts a message in places where I needed it but I wanted something ephemeral, light, and portable. Also flexbility where the environment is consistent and I just have to focus my time on developing the scripts that use the environment.

## Features

- **Dockerized Environment:** Portablity
- **Virtual Display:** Uses Xvfb to simulate a display for GUI applications in a headless environment
- **Meant For Pythong Browser Automation:** Downloads selenium and pyautogui in requirements.txt for this purpose
- **VNC:** Connect via VNC to view the virtual display for debugging and monitoring and other stuff.

## Getting Started

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop) if running docker on windows
- Docker Hub credentials (if pulling images that require authentication).

### To Run Phantom Horn

#### 1. Authenticate with Docker (if needed)
This ensures you have access to pull the required base images.
`docker login`

#### 2. Build the Docker Image
Navigate to the phantom-horn directory and build the image:
`docker build -t phantom-horn-app`

#### 3. Run the Application
Run the container with port mapping and automatic removal after exit:
`docker run --rm -p 5910:5900 phantom-horn-app`
This maps host port 5910 to the container’s port 5900 (the port that the virtual display server uses).

#### 4. Connect via VNC
Use whatever VNC client you have (I use tightVNC) and connect to localhost:<host_port> like localhost:5910

#### 5. To kill the container (it will delete itself automatically after)
```
docker ps
docker stop <container_id>
```