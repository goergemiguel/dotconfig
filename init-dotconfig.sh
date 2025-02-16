#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Define colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Update package lists and install necessary packages
echo -e "${GREEN}Updating packages and installing dependencies...${NC}"
sudo apt update && sudo apt install -y \
    zsh \
    git \
    curl \
    wget \
    software-properties-common

# Install latest Neovim
echo -e "${GREEN}Installing latest Neovim...${NC}"
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update && sudo apt install -y neovim

# Install zsh-autosuggestions
echo -e "${GREEN}Installing zsh-autosuggestions...${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Install zsh-syntax-highlighting
echo -e "${GREEN}Installing zsh-syntax-highlighting...${NC}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# Install Starship prompt
echo -e "${GREEN}Installing Starship...${NC}"
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Add plugins and Starship to .zshrc
echo -e "${GREEN}Configuring .zshrc...${NC}"
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
echo -e "${GREEN}Changing default shell to zsh...${NC}"
chsh -s $(which zsh)

echo -e "${GREEN}Installation complete. Restart your terminal or run 'zsh' to start using it.${NC}"
