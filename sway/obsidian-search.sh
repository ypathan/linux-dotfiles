#!/bin/sh
cd /home/ypathan/dev/ypathan-vault

f=$(find . \( \
  -path '*/.obsidian' -o -path '*/.obsidian/*' -o \
  -path '*/Excalidraw' -o -path '*/Excalidraw/*' -o \
  -path '*/Assets' -o -path '*/Assets/*' \
  \) -prune -o -type f -printf '%P\n' | fuzzel --dmenu --width 60)

~/.local/bin/obsidian open file="$f"

/usr/bin/swaymsg workspace 6
