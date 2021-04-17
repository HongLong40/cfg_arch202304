#!/bin/zsh
bat ~/.config/polybar/check_pacman_updates.log
bat /tmp/polybar_started
exa -l --time-style=full-iso /tmp/pacman_updates.count
bat /tmp/pacman_updates

