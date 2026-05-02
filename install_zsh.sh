#!/bin/bash

# Detect the operating system and execute the corresponding script
OS=$(uname -s)

if [[ "$OS" == "Darwin" ]]; then
    echo "macOS detected, executing macOS installation script..."
    bash ./install_macos.sh
elif [[ "$OS" == "Linux" ]]; then
    echo "Ubuntu/Debian detected, executing Linux installation script..."
    bash ./install_ubuntu_debian.sh
else
    echo "Unsupported OS detected. Please install manually."
    exit 1
fi