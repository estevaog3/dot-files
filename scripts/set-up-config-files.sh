#!/bin/bash
BASE_DIR=..
for DOT_FILE in $BASE_DIR/config-files/.*; do
	cp $DOT_FILE ~/
done
for DOT_DESKTOP in $BASE_DIR/config-files/*.desktop; do
	cp $DOT_DESKTOP ~/.config/autostart/
done
