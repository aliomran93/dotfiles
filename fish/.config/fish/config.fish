eval (/opt/homebrew/bin/brew shellenv)
starship init fish | source # https://starship.rs/
zoxide init fish | source # 'ajeetdsouza/zoxide'

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux EDITOR nvim # 'neovim/neovim' text editor
set -Ux FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -Ux VISUAL nvim

fish_add_path $HOME/.config/bin # my custom scripts

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/aliomran/anaconda3/bin/conda
    eval /Users/aliomran/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

