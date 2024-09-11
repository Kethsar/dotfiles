#!/bin/bash

[ "$SCREENSHOTTER_MODE" = "desktop" ] && exit 1

xprop -id "$SCREENSHOTTER_WINDOWID" -notype WM_CLASS | \
	grep -ioP '(?!")\w+(?=")' | head -n 1
