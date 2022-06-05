~/.config/X11/monitor.sh
setxkbmap -option caps:escape
setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&
xrdb -merge ~/.config/X11/.Xresources
exec i3
