#!/bin/zsh

# ------------------------------------------
# Script to installing prerequisites for my dotfiles
# ------------------------------------------

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Neovim via Homebrew
brew install neovim

# Install zsh-autosuggestions via Homebrew
brew install zsh-autosuggestions

# Install zsh-syntax-highlighting via Homebrew
brew install zsh-syntax-highlighting

# Install starship via Homebrew
brew install starship

# Install postgres@16 via Homebrew
brew install postgresql@16

# Install ripgrep via Homebrew
brew install ripgrep
