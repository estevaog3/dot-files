#!/bin/bash
for DOT_FILE in ./config-files/.*; do
	cp $DOT_FILE ~/
done
for DOT_DESKTOP in config-files/*.desktop; do
	cp $DOT_DESKTOP ~/.config/autostart/
done
cp ./config-files/vimrc /usr/share/vim/