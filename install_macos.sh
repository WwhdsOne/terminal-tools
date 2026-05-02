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
    echo "macOS detected. Installing Zsh using Homebrew..."
    if ! command_exists brew; then
        echo "Homebrew not found, installing Homebrew..."
        $sudo_prefix /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    $sudo_prefix brew install zsh gpg git
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

# 5. Install Nerd Font (Hack Nerd Font)
echo "6. Installing Hack Nerd Font..."
brew install font-hack-nerd-font

# 6. Install Catppuccin Powerline theme for Starship
echo "7. Configuring Catppuccin Powerline theme..."
mkdir -p ~/.config
starship preset catppuccin-powerline -o ~/.config/starship.toml

echo -e "\nYou can change the Starship theme palette by editing ~/.config/starship.toml"
echo "Options: catppuccin_mocha, frappe, macchiato, latte"

# 7. Install tools
echo "8. Installing tools: bat, glow, poppler, eza, hexyl, mediainfo, exiftool, chafa..."
brew install bat glow poppler eza hexyl mediainfo exiftool chafa

# 8. Install tldr and fzf
echo "9. Installing tldr and fzf..."
brew install tldr fzf

# 9. Install zoxide
echo "10. Installing zoxide..."
brew install zoxide

# 10. Create yazi.toml configuration file
echo "11. Creating yazi.toml configuration file..."
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

# 11. Source .zshrc
echo "12. Applying changes..."
echo -e "\n✅ Installation completed successfully!"
echo -e "⚠️ 请重启终端生效所有配置\n"