fpath=($ZDOTDIR/external $fpath)

source "$XDG_CONFIG_HOME/zsh/aliases"

# Vi mode auto-complete
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -U compinit; compinit
_com_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

autoload -Uz prompt_purification_setup; prompt_purification_setup

autoload -Uz cursor_mode && cursor_mode

source ~/dotfiles/zsh/external/_docker_compose 

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD

# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT

# Vi mode in zsh
bindkey -v
export KEYTIMEOUT=1

# Edit command in nvim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# bd jumps
source ~/dotfiles/zsh/external/bd.zsh

# fzf
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# Run startx on login
if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
