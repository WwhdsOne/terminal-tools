#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}

# Check if sudo is available
if command_exists sudo; then
    sudo_prefix="sudo"
else
    sudo_prefix=""
fi

# 1. Install Zsh
echo "1. Installing Zsh..."
if command_exists zsh; then
    echo "Zsh is already installed"
else
    echo "Ubuntu/Debian detected. Installing Zsh using apt..."
    $sudo_prefix apt update
    $sudo_prefix apt install -y zsh git gpg
fi

# Set Zsh as default shell
echo "2. Setting Zsh as the default shell..."
if [ ! -f ~/.zshrc ]; then
    touch ~/.zshrc
fi

# 2. Install Oh My Zsh
echo "3. Installing Oh My Zsh..."
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed"
fi

# 3. Install plugins
echo "4. Installing Oh My Zsh plugins..."
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# Install zsh-autosuggestions plugin
if ! dir_exists "$ZSH_CUSTOM/plugins/zsh-autosuggestions"; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Install zsh-syntax-highlighting plugin
if ! dir_exists "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# 4. Install Starship
echo "5. Installing Starship..."
if command_exists starship; then
    echo "Starship is already installed"
else
    curl -sS https://starship.rs/install.sh | sh -s -- --yes
fi

# 5. Install tools
echo "6. Installing tools: bat, glow, poppler, eza, hexyl, mediainfo, exiftool, chafa..."
$sudo_prefix apt update
$sudo_prefix apt install -y bat poppler-utils eza hexyl mediainfo exiftool chafa

# 6. Install tldr and fzf
echo "7. Installing tldr and fzf..."
$sudo_prefix apt install -y tldr fzf

# 7. Install zoxide
echo "8. Installing zoxide..."
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# 8. Create yazi.toml configuration file
echo "9. Creating yazi.toml configuration file..."
mkdir -p ~/.config/yazi
cat <<EOL > ~/.config/yazi/yazi.toml
[mgr]
ratio = [1, 2, 8]
sort_by = "alphabetical"
sort_dir_first = true
show_hidden = false

[preview]
image = true
max_width = 900
max_height = 1350
image_quality = 80
image_filter = "lanczos3"
EOL

# 9. Source .zshrc
echo "10. Applying changes..."
echo -e "\n✅ Installation completed successfully!"
echo -e "⚠️ 请重启终端生效所有配置\n"