#!/bin/bash

# Check if keyd is running
if pgrep -x "keyd" > /dev/null; then
    # If keyd is running, stop it
    systemctl stop keyd
else
    # If keyd is not running, start it
    systemctl start keyd
fi
