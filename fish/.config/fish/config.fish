set fish_greeting # disable fish greeting

starship init fish | source
zoxide init fish | source

# variables
set -U FZF_CTRL_R_OPTS "--reverse"
set -U FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -U FZF_DEFAULT_OPTS "--color=spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"
set -U FZF_TMUX_OPTS "-p"
set -U KIT_EDITOR /opt/homebrew/bin/nvim
set -U LANG en_US.UTF-8
set -U LC_ALL en_US.UTF-8

fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.config/bin

abbr :q "tmux kill-server"
abbr ta "tmux a"
abbr tat "tmux attach -t"
abbr td "t dotfiles"
abbr lg "lazygit"
abbr gs "git status"
abbr gd "git diff"
abbr gl "git pull"
abbr ga "git add"
abbr gc "git commit"
abbr gp "git push"

