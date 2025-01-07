#!/usr/bin/env bash

# Notification ID file
notif_file="/tmp/brightness_controller.txt"

# Function to send notification and update the ID
send_notification() {
    local message=$1
    local icon=$2
    local notif_id

    # Get the current notification ID (if it exists)
    if [[ -f "$notif_file" ]] && [[ -s "$notif_file" ]]; then
        notif_id=$(cat "$notif_file")
        # Ensure notif_id is a valid integer
        if ! [[ "$notif_id" =~ ^[0-9]+$ ]]; then
            notif_id=0
        fi
    else
        notif_id=0
    fi

    # Send or replace the notification using the -r flag
    notif_id=$(notify-send -p -r "$notif_id" -u low -i "$icon" "Brightness" "$message")

    # Store the notif_id in the file if it was valid
    echo "$notif_id" > "$notif_file"
}

# Get brightness percentage
get_brightness_percentage() {
    brightness=$(brightnessctl g)
    max_brightness=$(brightnessctl m)
    percentage=$(awk "BEGIN {print ($brightness / $max_brightness) * 100}")
    printf "%.0f\n" "$percentage"
}

# Process input arguments
case "$1" in
    *+|*-)
        # Change brightness and notify
        brightnessctl set "$1"
        brightness=$(get_brightness_percentage)
        echo "$brightness%"
        icon="/usr/share/icons/Papirus-Dark/32x32/panel/brightness-low-symbolic.svg"
        [[ $brightness -gt 30 ]] && icon="/usr/share/icons/Papirus-Dark/32x32/panel/brightness-medium-symbolic.svg"
        [[ $brightness -gt 70 ]] && icon="/usr/share/icons/Papirus-Dark/32x32/panel/brightness-high-symbolic.svg"
        send_notification "$brightness%" "$icon"
        ;;

    *)
        echo "Usage: $0 {X+|X-}"
        exit 1
        ;;
esac
