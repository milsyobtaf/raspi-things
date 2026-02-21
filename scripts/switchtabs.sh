#!/bin/bash

cycleTime="30"

# Find Chromium browser process ID
chromium_pid=$(pgrep chromium | head -1)

# Check if Chromium is running
while [[ -z $chromium_pid ]]; do
  echo "Chromium browser is not running yet."
  sleep 5
  chromium_pid=$(pgrep chromium | head -1)
done

echo "Chromium browser process ID: $chromium_pid"
echo "Currently rotating the tab every $cycleTime second(s)"

# Loop to send keyboard events
while true; do
  # Send Ctrl+Tab using `wtype` command
  # Make sure you have installed `wtype` and are in a `wayland` environment
  # With `wtype` you need to press the key with -P or -M in caps, and release the key with -p or -m in lowercase
  wtype -M ctrl -P Tab -p Tab -m ctrl
  sleep $cycleTime
done
