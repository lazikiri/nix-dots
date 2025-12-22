#!/usr/bin/env bash

pkill quickshell
quickshell & disown
hyprctl reload
