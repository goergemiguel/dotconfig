# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

#### ALIAS ####

# alias to git controlled configruation
# https://www.atlassian.com/git/tutorials/dotfiles
alias dotconfig='/usr/bin/git --git-dir=/Users/goergemiguel/dotconfig/ --work-tree=/Users/goergemiguel'

# list directory contents, including hidden files, long listing format and colored output
alias ll='ls -alG'

# clear terminal
alias c='clear'

# move up a directory
alias ..="cd ../"

# Commonly used git commands
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias gl='git log'

##### PLUGINS #####

# Starship Init
# https://github.com/starship/starship
eval "$(starship init zsh)"

## Homebrew

# Fish-like autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fish-like syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
