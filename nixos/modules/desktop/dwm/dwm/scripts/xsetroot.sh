#!/usr/bin/env bash
while true; do
    xsetroot -name "$(cat /sys/class/power_supply/BAT1/capacity)% | $(date)"
    sleep 1
done
