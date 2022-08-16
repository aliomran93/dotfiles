#!/bin/bash

DOTFILES=$(pwd)

#######
# zsh #
#######

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"

ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"

rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

########
# nvim #
########

mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"

ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim"
ln -sf "$DOTFILES/nvim/lua" "$XDG_CONFIG_HOME/nvim"

rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

# Install plugin manager

[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"

# Install (or update) all the plugins
nvim --noplugin +PlugUpdate +qa

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ######
    # i3 #
    ######

    rm -rf "$XDG_CONFIG_HOME/i3"
    ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

    #########
    # Fonts #
    #########

    mkdir -p "$XDG_DATA_HOME"
    cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

    #########
    # Dunst #
    #########

    mkdir -p "$XDG_CONFIG_HOME/dunst"
    ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    ####################
    # Alacritty Mac OS # 
    ####################

    mkdir -p "$XDG_CONFIG_HOME/alacritty"
    ln -sf "$DOTFILES/alacritty/alacritty.macos.yml" "$XDG_CONFIG_HOME/alacritty/alacritty.yml"
fi

########
# tmux #
########

mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

