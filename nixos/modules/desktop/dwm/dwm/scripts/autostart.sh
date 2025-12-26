#!/usr/bin/env bash
sleep 1
dunst & disown
flameshot & disown
picom & disown
/etc/nixos/nixos/modules/desktop/dwm/dwm/scripts/wallpaper.sh
/etc/nixos/nixos/modules/desktop/dwm/dwm/scripts/xsetroot.sh
