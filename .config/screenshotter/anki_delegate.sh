#!/bin/bash

[ "$SCREENSHOTTER_MODE" = "desktop" ] && exit 1

xprop -id "$SCREENSHOTTER_WINDOWID" -notype WM_CLASS | grep -i 'anki' >/dev/null && echo "anki"
