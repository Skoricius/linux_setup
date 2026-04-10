#!/bin/bash
# Get the list of windows
LIST=$(/opt/homebrew/bin/aerospace list-windows --all)

# Pass the list to the 'choose' overlay
# This pops up a search bar that doesn't count as a "Space" window
SELECTED=$(echo "$LIST" | /opt/homebrew/bin/choose)

# Extract ID and focus
if [ -n "$SELECTED" ]; then
    WIN_ID=$(echo "$SELECTED" | awk '{print $1}')
    /opt/homebrew/bin/aerospace focus --window-id "$WIN_ID"
fi
