function theme-profile {
    local PROFILE=$(tmux showenv -g ITERM_PROFILE | awk -F'=' '{print $2}')
    echo $PROFILE
}

function theme-toggle {
 local PROFILE=$(tmux showenv -g ITERM_PROFILE | awk -F'=' '{print $2}')
 echo $PROFILE
 if [[ $PROFILE == *"light"* ]]; then
    tmux setenv -g ITERM_PROFILE dark
    tmux source ~/.tmux/plugins/tmux-colors-solarized/tmuxcolors-dark.conf
    osascript -e 'tell app "System Events" to keystroke "t" using {option down, control down}'
 else
    tmux setenv -g ITERM_PROFILE light
    tmux source ~/.tmux/plugins/tmux-colors-solarized/tmuxcolors-light.conf
    osascript -e 'tell app "System Events" to keystroke "t" using {shift down, option down, control down}'
 fi
}
