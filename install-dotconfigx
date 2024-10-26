#!/bin/bash

# ------------------------------------------
# Script to install prerequisites for my dotfiles on Pop!_OS
# ------------------------------------------

# Update package list and install necessary dependencies
sudo apt update && sudo apt install -y \
    git \
    curl \
    zsh \
    tmux

# Install Flatpak if it's not already installed
sudo apt install -y flatpak

# Add Flathub repository for Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Neovim via Flatpak
flatpak install -y flathub io.neovim.nvim

# Install zsh-autosuggestions
# TODO: use manual method https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone

# Install zsh-syntax-highlighting
# TODO: use manual method https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#in-your-zshrc

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install ripgrep via apt
sudo apt install -y ripgrep

# Install Tmux
sudo apt install -y tmux

# Install .NET SDK via apt
sudo apt install -y dotnet-sdk-6.0 # Adjust the version if necessary

# Clone Tmux plugin manager if it doesn't already exist
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install plugins via TPM
$HOME/.tmux/plugins/tpm/bin/install_plugins
