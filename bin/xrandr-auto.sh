#!/bin/bash
extern='VGA1'
intern='LVDS1'

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr-home.sh
fi

