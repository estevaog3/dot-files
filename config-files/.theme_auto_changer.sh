#!/bin/bash
DARK_HOUR=$1
DARK_MIN=$2
DARK_TIME=$(($DARK_HOUR * 3600 + $DARK_MIN * 60))
HOUR=`date +%H`
MIN=`date +%M`
TIME=$(($HOUR * 3600 + $MIN * 60))
if [ $TIME -lt $DARK_TIME ]
then
	if [ $(dconf read /org/gnome/desktop/interface/gtk-theme) != "'Ambiance'" ]; then
		dconf write /org/gnome/desktop/interface/gtk-theme "'Ambiance'"
	fi
	TIME_DIFF=$(($DARK_TIME - $TIME))
	HOUR_DIFF=$(($TIME_DIFF / 3600))
	MIN_DIFF=$((($TIME_DIFF - $HOUR_DIFF * 3600) / 60))
	sleep ${HOUR_DIFF}h ${MIN_DIFF}m
	dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"
fi
