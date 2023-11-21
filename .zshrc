# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# alias to git controlled configruation
# https://www.atlassian.com/git/tutorials/dotfiles
alias dotconfig='/usr/bin/git --git-dir=/Users/goergemiguel/dotconfig/ --work-tree=/Users/goergemiguel'

# Starship Init
# https://github.com/starship/starship
eval "$(starship init zsh)"

# Fish-like autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
