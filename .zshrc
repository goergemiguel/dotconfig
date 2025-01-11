# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# ---------------------------------
# ALIAS
# ---------------------------------

# Alias for git controlled configruation [https://www.atlassian.com/git/tutorials/dotfiles]
alias dotconfig='/usr/bin/git --git-dir=/Users/goergemiguel/dotconfig/ --work-tree=/Users/goergemiguel'

# List directory contents, including hidden files, long listing format and colored output
alias ll='ls -alG'

# Clear terminal
alias c='clear'

# Move up a directory
alias ..="cd ../"
alias ...="cd ../../"

# Commonly used git commands
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpf='git push --force'
alias gs='git status'
alias gl='git log'

# Postgres commands
alias pgstart='brew services start postgresql@16'
alias pgstop='brew services stop postgresql@16'

# Create tmux session
alias tx='tmux'
alias txa='tmux a'
alias txn='tmux new -s'
alias txt='tmux a -t'

# ---------------------------------
# PLUGINS
# ---------------------------------

# Starship Prompt [https://github.com/starship/starship]
eval "$(starship init zsh)"

# Fish-like autosuggestions [https://github.com/zsh-users/zsh-autosuggestions]
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fish-like syntax highlighting [https://github.com/zsh-users/zsh-syntax-highlighting]
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# POSTGRES PATH
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"

# NODE PATH
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# nvim path for linux
export PATH="$PATH:/opt/nvim-linux64/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
