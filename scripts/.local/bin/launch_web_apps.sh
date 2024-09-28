#!/usr/bin/env bash

zen-browser $1 && notify-send "Opening $1 in Zen browser" && hyprctl dispatch workspace 2
