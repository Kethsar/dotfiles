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
	x=$(( SCREENSHOTTER_MOUSEX - 2560 ))
	y=$(( SCREENSHOTTER_MOUSEY))
fi

name=$("$gwpc" -x $x -y $y)

if [[ "$name" = "ed6_win_DX9" ]]; then
	name="eiyuu_densetsu_sora_no_kiseki"
elif [[ "$name" = "Artemis" ]]; then
	name="ixshe_tell"
fi

echo "$name"
