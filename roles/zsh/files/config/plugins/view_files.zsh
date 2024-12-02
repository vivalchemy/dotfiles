#!/bin/bash

# Function to determine the viewer for a given file
get_viewer() {
    local file="$1"
    local mime_type=$(file -b --mime-type "$file")
    case "$mime_type" in
        image/*) echo "swappy -f" ;;
        video/*) echo "mpv" ;;
        application/pdf) echo "zathura" ;;
        text/markdown) echo "glow" ;;
        *) echo "bat" ;;
    esac
}

# Function to view a file based on its type
view() {
    local file="$1"

    # Check if a file is provided
    if [[ -z "$file" ]]; then
        echo "Error: Please specify a file to view."
        return 1
    fi

    # Check if file exists
    if [[ ! -f "$file" ]]; then
        echo "Error: File '$file' not found."
        return 1
    fi

    # Find the appropriate viewer command
    local viewer=$(get_viewer "$file")

    echo $viewer
    echo $file
    # Execute the viewer command with the file path
    "$viewer" "$file" &

    return 0
}
