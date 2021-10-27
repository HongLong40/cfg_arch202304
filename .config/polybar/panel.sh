#!/usr/bin/zsh

typeset SEMAPHORE="/tmp/polybar_started"

rm -f $SEMAPHORE

if [[ -z $(pgrep -x polybar) ]]
then
    m=$(polybar --list-monitors | awk -F ":" '/primary/ { print $1 }')
    MONITOR=$m polybar --reload slate &
else    
    polybar-msg cmd restart
    dunstify -t 2000 "Polybars Restarted"
fi

echo $(date "+%Y-%m-%d %T") polybars started > $SEMAPHORE

# start pacman update monitoring script (used by polybar pacman script module)
#if [[ -z $(pidof -x "$HOME/.config/polybar/check_pacman_updates.sh") ]]
#then
#    "$HOME/.config/polybar/check_pacman_updates.sh" &
#else
#    echo "Sending msg to polybars"
#    sleep 5
#    polybar-msg hook pacman_ipc 2 || true
#fi

