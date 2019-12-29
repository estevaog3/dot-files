#!/bin/bash
BASE_DIR=..
for DOT_FILE in $BASE_DIR/config-files/.*; do
	if [ -f $DOT_FILE ]; then
		cp $DOT_FILE ~/
	fi
done
for DOT_DESKTOP in $BASE_DIR/config-files/*.desktop; do
	cp $DOT_DESKTOP ~/.config/autostart/
done

cp -r $BASE_DIR/config-files/.scripts ~/
cp -r $BASE_DIR/favorite-wallpapers ~/Pictures
