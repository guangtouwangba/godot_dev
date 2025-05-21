# Godot Development Container

This repository contains a development container configuration for Godot game development, optimized for macOS with Apple Silicon (ARM64) architecture.

*[中文文档](README.zh.md)*

## Prerequisites

- Docker Desktop for Mac
- Visual Studio Code or Cursor with the "Remote - Containers" extension installed
- X11 server for macOS (such as XQuartz) for GUI applications

## Setup

1. Install Docker Desktop for Mac
2. Install Visual Studio Code or Cursor
3. Install the "Remote - Containers" extension
4. Install XQuartz: `brew install --cask xquartz`
5. Configure XQuartz to allow connections from network clients:
   - Open XQuartz
   - Go to XQuartz > Preferences > Security
   - Check "Allow connections from network clients"
   - Restart XQuartz
6. Find your local IP address using `ifconfig` or in System Preferences > Network
7. Update the DISPLAY variable in `.devcontainer/devcontainer.json` with your IP address: 
   ```
   "-e", "DISPLAY=YOUR_IP_ADDRESS:0"
   ```

## Usage

1. Clone this repository
2. Open the repository folder in VS Code or Cursor
3. Click on the green button in the bottom-left corner of the editor and select "Reopen in Container"
4. The first time you do this, Docker will build the container which may take several minutes
5. Once the container is built and running, you can use Godot's editor inside the container
6. Run Godot from the terminal with the command: `godot`

## Container Features

- Ubuntu 22.04 base image with ARM64 support
- Godot 4.2.1 engine pre-installed with ARM64 compatibility
- X11 forwarding configured for GUI applications
- OpenGL libraries and Mesa utilities for 3D rendering
- Non-root user setup (vscode) with sudo privileges
- VS Code/Cursor extensions for Godot development

## Technical Details

The development container includes:
- Core X11 development libraries
- OpenGL/Mesa libraries for 3D rendering
- Audio libraries (ALSA, PulseAudio)
- Git for version control
- Non-root user with sudo privileges

## Troubleshooting

### X11 Display Issues

If you're having trouble with the X11 display:

1. Check that XQuartz is running
2. Verify your IP address is correct in the `DISPLAY` environment variable in `.devcontainer/devcontainer.json`
3. Test X11 forwarding with a simple application like `xeyes` (included in the container)
4. Try restarting XQuartz and Docker

### Container Build Failures

If the container fails to build:

1. Check Docker logs for specific errors
2. Ensure Docker has sufficient resources allocated 
3. For ARM64-specific issues, verify that all packages in the Dockerfile are available for ARM64 architecture

### GPU Acceleration

This container is configured without GPU acceleration, as Docker on macOS (especially on Apple Silicon) has limited GPU passthrough capabilities. The container uses software rendering for OpenGL applications.

## License

[Your License Information]

## Contributing

[Instructions for contributing] 