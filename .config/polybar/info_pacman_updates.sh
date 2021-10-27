#!/usr/bin/env zsh
if [[ ( ! -f /tmp/pacman_last_update_count ) ]]; then
    echo pacman_last_update_count not found, creating file
    echo 0 > /tmp/pacman_last_update_count
fi

_last_update_count=$(</tmp/pacman_last_update_count)

echo "Arch" > /tmp/pacman_updates

checkupdates 2> /dev/null  > /tmp/pacman_updates_arch
sed 's/^/    /' /tmp/pacman_updates_arch >> /tmp/pacman_updates
updates_arch=$(cat /tmp/pacman_updates_arch | wc -l)

echo "AUR" >> /tmp/pacman_updates

paru -Qum 2> /dev/null > /tmp/pacman_updates_aur
sed 's/^/    /' /tmp/pacman_updates_aur >> /tmp/pacman_updates
updates_aur=$(cat /tmp/pacman_updates_aur | wc -l)

updates=$((updates_arch + updates_aur))

if [ "$updates" -gt 0 ]; then
    if [[ $updates -ne $_last_update_count ]]; then
        if [[ $(pgrep -x dunst) ]]; then
            dunstify -t 5000 "$updates New Pacman Updates Available" 2> /dev/null
        fi
        echo $updates > /tmp/pacman_last_update_count
    fi

#    echo "%{F#FF0000}${updates}%{F-}"
    echo "${updates}"
else
    echo - '-'
fi
