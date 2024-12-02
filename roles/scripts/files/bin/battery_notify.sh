#!/usr/bin/env bash

# Get the DISPLAY and DBUS_SESSION_BUS_ADDRESS for the current user session
# Required for notify-send to work since it uses X11 and DBUS
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# Get battery capacity and status
battery_capacity=$(cat /sys/class/power_supply/BAT*/capacity)
battery_status=$(cat /sys/class/power_supply/BAT*/status)

# Constants
battery_icon="/usr/share/icons/Papirus-Dark/32x32/panel/battery-010.svg"

# Check if battery capacity is low and not discharging
if [[ $battery_capacity -lt 30 ]] && [[ $battery_status == "Discharging" ]]; then
  notify-send -i $battery_icon -u critical "Battery Low" "Battery capacity: $battery_capacity%\nDate: $(date)"
fi
