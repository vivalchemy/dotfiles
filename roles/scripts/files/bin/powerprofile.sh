#!/usr/bin/env bash

PROFILE_FILE="/sys/firmware/acpi/platform_profile" # fallback for some devices

get_current_profile() {
  powerprofilesctl get 2>/dev/null || cat "$PROFILE_FILE" 2>/dev/null
}

set_profile() {
  echo "Setting profile to: '$1'"
  powerprofilesctl set "$1" 2>/dev/null || echo "$1" | sudo tee "$PROFILE_FILE" >/dev/null
}

toggle_profile() {
  current=$(get_current_profile)
  echo "Current: $current"
  case "$current" in
  performance)
    set_profile balanced
    echo "Power profile set to: $(get_current_profile)"
    ;;
  balanced)
    set_profile power-saver
    echo "Power profile set to: $(get_current_profile)"
    ;;
  power-saver)
    set_profile performance
    echo "Power profile set to: $(get_current_profile)"
    ;;
  *)
    echo "Unknown: '$current'"
    exit 1
    ;;
  esac
}

# Logic
if [[ "$1" == "toggle" ]]; then
  echo "Toggling profile"
  toggle_profile
  exit 0
fi

# Output for waybar display
echo "$(get_current_profile)"
