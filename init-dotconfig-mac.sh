#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Check for Homebrew and install if not found
echo "Checking for Homebrew..."
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew found. Updating..."
    brew update
fi

# Install necessary packages
echo "Installing dependencies..."
brew install \
    zsh \
    neovim \
    git \
    curl \
    wget \
    starship

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# Add plugins and Starship to .zshrc
echo "Configuring .zshrc..."
if ! grep -q "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ~/.zshrc; then
    echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
fi

if ! grep -q "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ~/.zshrc; then
    echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
fi

if ! grep -q "eval \$(starship init zsh)" ~/.zshrc; then
    echo "eval \$(starship init zsh)" >> ~/.zshrc
fi

# Change default shell to zsh
echo "Changing default shell to zsh..."
chsh -s $(which zsh)

echo "Installation complete. Restart your terminal or run 'zsh' to start using it."
