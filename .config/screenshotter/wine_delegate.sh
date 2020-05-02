#!/bin/bash

[ "$SCREENSHOTTER_MODE" = "desktop" ] && exit 1

xprop -id "$SCREENSHOTTER_WINDOWID" -notype WM_CLASS | sed 's/[^"]*"\([^"]*\)".*/\1/' | sed 's/.exe$//'