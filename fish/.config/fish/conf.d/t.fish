fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin
set -Ux T_FZF_FIND_BINDING 'ctrl-f:change-prompt(  )+reload(fd -H -d 2 -t d -E .Trash . ~)'
set -Ux T_FZF_PROMPT '🧠 '
set -Ux T_SESSION_USE_GIT_ROOT true
