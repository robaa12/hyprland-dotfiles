#!/usr/bin/env bash

question=$(echo " lock| logout| reboot| shutdown" | rofi -sep "|" \
    -dmenu -i -p 'System: ' "" -width 20 -hide-scrollbar \
    -eh 1 -line-padding 4 -padding 20 -lines 4 -color-enabled)

case $question in
    *lock)
        i3lock
        ;;
    *logout)
        #command -v gnome-session-quit 2>/dev/null 2>&1 || command -v session-logout >/dev/null 2>&1
        command -v session-logout
        ;;
    *reboot)
        systemctl reboot
        ;;
    *shutdown)
        systemctl poweroff
        ;;
    *)
        exit 0  # do nothing on wrong response
        ;;
esac