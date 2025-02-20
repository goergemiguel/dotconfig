export PATH="$HOME/.local/bin:$PATH"

# ---------------------------------
# ALIAS
# ---------------------------------

# Alias for git controlled configruation [https://www.atlassian.com/git/tutorials/dotfiles]
alias dotconfig='/usr/bin/git --git-dir=/Users/goergemiguel/dotconfig/ --work-tree=/Users/goergemiguel'

# List directory contents, including hidden files, long listing format and colored output
alias ll='ls -al --color=always'

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


#lazydocker
alias lzd='lazydocker'

# ---------------------------------
# PLUGINS
# ---------------------------------

# Starship Prompt [https://github.com/starship/starship]
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HOSTNAME=$(hostname)

alias dotconfig='/usr/bin/git --git-dir=$HOME/dotconfig/ --work-tree=$HOME'
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

 # Fixes the "Inappropriate ioctl for device" error when committing
 # https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)
