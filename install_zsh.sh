#!/bin/bash

# 检测操作系统
OS=$(uname -s)

# 根据操作系统执行相应的安装脚本
if [[ "$OS" == "Darwin" ]]; then
    echo "macOS detected, executing macOS installation script..."
    curl -sL https://raw.githubusercontent.com/WwhdsOne/terminal-tools/main/install_macos.sh | bash
elif [[ "$OS" == "Linux" ]]; then
    echo "Ubuntu/Debian detected, executing Linux installation script..."
    curl -sL https://raw.githubusercontent.com/WwhdsOne/terminal-tools/main/install_ubuntu_debian.sh | bash
else
    echo "Unsupported OS detected. Please install manually."
    exit 1
fi