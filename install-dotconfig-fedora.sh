# Install Neovim
dnf install neovim

# Install zsh-autosuggestions via Homebrew
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/Fedora_Rawhide/shells:zsh-users:zsh-autosuggestions.repo
dnf install zsh-autosuggestions

# Install zsh-syntax-highlighting via Homebrew
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/Fedora_Rawhide/shells:zsh-users:zsh-syntax-highlighting.repo
dnf install zsh-syntax-highlighting

# Install starship via Homebrew
dnf copr enable atim/starship
dnf install starship

# Install postgres@16 via Homebrew
dnf install postgresql-server

# Install ripgrep via Homebrew
dnf install ripgrep

# Install amethyst window tiling manager via Homebrew
# brew install --cask amethyst

# Install alfred
# brew install --cask alfred

# Install wezterm terminal
dnf copr enable wezfurlong/wezterm-nightly
dnf install wezterm

# Install Tmux
dnf install tmux

# Install dotnet
dnf install dotnet

# Install Docker Desktop
# brew install --cask docker

# Clone Tmux plugin manager if it doesn't already exist
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install plugins via TPM
$HOME/.tmux/plugins/tpm/bin/install_plugins

# Install ollama to turn LLM locally
# brew install ollama
