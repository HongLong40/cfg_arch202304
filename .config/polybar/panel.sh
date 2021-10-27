#!/usr/bin/zsh

typeset SEMAPHORE="/tmp/polybar_started"

rm -f $SEMAPHORE

if [[ -z $(pgrep -x polybar) ]]
then
    m=$(polybar --list-monitors | grep  "primary" | cut -d":" -f 1)
    MONITOR=$m polybar --reload slate &

    # for m in $(polybar --list-monitors | cut -d":" -f 1)
    # do
    #     MONITOR=$m polybar --reload slate &
    # done
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

