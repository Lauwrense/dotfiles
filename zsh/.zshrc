# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -v

zstyle :compinstall filename '/home/tenwasa/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
# End of lines added by compinstall
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export XDG_CACHE_HOME=$HOME/.cache
export EDITOR=nvim


alias v="nvim"
alias ls="exa -la --icons --git -s type"
alias ll="exa -la --icons --git --ignore-glob .git -s type -T"
alias dotnvim="cd ~/dotfiles/nvim/.config/nvim; nvim init.lua; cd ~"


eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

neofetch

# Change cursor shape for different vi modes
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';; # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}

zle -N zle-line-init

echo -ne '\e[5 q'

preexec() {
    echo -ne '\e[5 q'
}
