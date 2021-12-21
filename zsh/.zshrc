# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tenwasa/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export XDG_CACHE_HOME=$HOME/.cache


alias ls="exa -la --icons --git"
alias ll="exa -la --icons --git --ignore-glob .git -T"
alias dotnvim="cd ~/dotfiles/nvim/.config/nvim; nvim init.lua; cd ~"

EDITOR=nvim

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

neofetch
