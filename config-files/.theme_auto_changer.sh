#!/bin/bash
DARK_HOUR=$1
DARK_MIN=$2
DARK_TIME=$(($DARK_HOUR * 3600 + $DARK_MIN * 60))
HOUR=`date +%H`
MIN=`date +%M`
TIME=$(($HOUR * 3600 + $MIN * 60))
if [ $TIME -lt $DARK_TIME ]
then
	CURRENT_THEME=``
	if [ $(dconf read /org/gnome/desktop/interface/gtk-theme) != "'Ambiance'" ]; then
		dconf write /org/gnome/desktop/interface/gtk-theme "'Ambiance'"
	fi
	HOUR_DIFF=$(($DARK_HOUR - $HOUR))
	MIN_DIFF=$(($DARK_MIN - $MIN))
	if [ $MIN_DIFF -lt 0 ]; then 
		MIN_DIFF=$(($MIN - $DARK_MIN))
	fi
	sleep ${HOUR_DIFF}h ${MIN_DIFF}m
	dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"
fi
