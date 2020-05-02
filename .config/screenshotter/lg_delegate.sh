#!/bin/bash

[ "$SCREENSHOTTER_MODE" = "desktop" ] && exit 1

gwpc=$(which getwindowprocname)
[ -z "$gwpc" ] && exit 0

x="-1"
y="-1"

if [ "$SCREENSHOTTER_MODE" = "region" ] || [ "$SCREENSHOTTER_MODE" = "name" ];
then
	# Hardcoded values cause lazy
	# 1080 is the X offset from 0,0 on the host for our looking glass client window
	# 840 is the Y offset
	x=$(( SCREENSHOTTER_MOUSEX - 1080 ))
	y=$(( SCREENSHOTTER_MOUSEY - 840 ))
fi

name=$("$gwpc" -x $x -y $y)

[[ "$name" = "ed6_win_DX9" ]] &&
	name="eiyuu_densetsu_sora_no_kiseki"

echo "$name"
