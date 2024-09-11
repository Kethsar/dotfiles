#!/bin/bash

[ "$SCREENSHOTTER_MODE" = "desktop" ] && exit 1

# Check if it'ss something being run through Steam
name=$(xprop -id "$SCREENSHOTTER_WINDOWID" -notype WM_CLASS | sed 's/[^"]*"\([^"]*\)".*/\1/' | sed 's/.exe$//')
if ! [[ "$name" =~ "steam_app" ]]; then
	echo "$name"
	exit 0
fi

# Just get the WM_NAME
name=$(xprop -id "$SCREENSHOTTER_WINDOWID" -notype _NET_WM_NAME | sed 's/[^"]*"\([^"]*\)".*/\1/' | sed 's/.exe$//')

if [[ "$name" =~ "FINAL FANTASY IX" ]]; then
	name="final-fantasy-ix"
fi

echo "$name"
