# dotconfig

Following https://www.atlassian.com/git/tutorials/dotfiles to keep track of configs

NOTE IMPORTANT: Using alias `dotconfig` instead of `config`

# Installing on new machine

Clone repo to home directory
```
git clone --bare <git-repo-url> $HOME/dotconfig
```

Define the alias in the current shell:
```
alias dotconfig='/usr/bin/git --git-dir=$HOME/dotconfig/ --work-tree=$HOME'
```

Checkout the actual content from the bare repository to your $HOME:
```
dotconfig checkout
```

Set the flag showUntrackedFiles to no on this specific (local) repository:
```
dotconfig config --local status.showUntrackedFiles no
```

# Updating directories and files

```
dotconfig status
dotconfig add .vimrc
dotconfig commit -m "Add vimrc"
dotconfig add .bashrc
dotconfig commit -m "Add bashrc"
dotconfig push
```



