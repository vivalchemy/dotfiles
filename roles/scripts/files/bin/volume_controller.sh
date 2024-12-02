#!/bin/bash

# Notification ID file
notif_file="/tmp/volume_controller.txt"

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
    # We keep the notif_id and don't expect notify-send to give a new one.
    notif_id=$(notify-send -p -r "$notif_id" -u low -i "$icon" "Volume" "$message")

    # Store the notif_id in the file if it was valid
    echo "$notif_id" > "$notif_file"
}
# Get mute status
get_mute_status() {
    if wpctl get-volume @DEFAULT_AUDIO_SINK@ | rg -q 'MUTED'; then
        echo 'Muted'
    else
        echo 'Unmuted'
    fi
}

# Get volume percentage
get_volume_percentage() {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -oP '\d+(\.\d+)?' | head -1)
    # Multiply the decimal value by 100 using awk to convert it to a percentage
    percentage=$(awk "BEGIN {print $volume * 100}")
    printf "%.0f\n" "$percentage"
}

# Process input arguments
case "$1" in
    toggle)
        # Toggle mute and notify
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        mute_status=$(get_mute_status)
        echo "$mute_status"
        if [[ "$mute_status" == "Muted" ]]; then
            icon="/usr/share/icons/Papirus-Dark/32x32/panel/audio-off.svg"
        else
            icon="/usr/share/icons/Papirus-Dark/32x32/panel/audio-on.svg"
        fi
        send_notification "$mute_status" "$icon"
        ;;

    *+|*-)
        # Change volume and notify
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ "$1"
        volume=$(get_volume_percentage)
        echo "$volume%"
        icon="/usr/share/icons/Papirus-Dark/32x32/panel/audio-volume-low.svg"
        [[ $volume -gt 30 ]] && icon="/usr/share/icons/Papirus-Dark/32x32/panel/audio-volume-medium.svg"
        [[ $volume -gt 70 ]] && icon="/usr/share/icons/Papirus-Dark/32x32/panel/audio-volume-high.svg"
        send_notification "$volume%" "$icon"
        ;;

    *)
        echo "Usage: $0 {toggle|X+|X-}"
        exit 1
        ;;
esac

