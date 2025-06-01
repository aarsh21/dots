#!/bin/bash

sleep 1 # Add a 1-second delay

wallpaper_path=~/wallpaper/wallpaper.png

if [ ! -f "$wallpaper_path" ]; then
  notify-send -a "swww" "No wallpaper found" "$wallpaper_path"
  exit 1
fi

# It's good practice to ensure swww daemon is running from within the script too,
# though exec-once = swww init should handle it.
# swww query > /dev/null 2>&1 || swww init

swww img "$wallpaper_path" \
  --transition-bezier .43,1.19,1,.4 \
  --transition-fps 60 \
  --transition-step 90 \
  --transition-type "grow" \
  --transition-duration 0.7 \
  --invert-y \
  --transition-pos "$(hyprctl cursorpos)"
