#!/bin/bash
DOT_FILES=$(ls config-files/ -a | egrep '^\.[A-Za-z]+')
for DOT_FILE in $DOT_FILES; do
	ln -f config-files/$DOT_FILE ~/
done
mkdir ~/.scripts
ln -f config-files/.scripts/* ~/.scripts
DOT_DESKTOP_FILES=$(ls config-files/ -a | egrep '.desktop$')
for DOT_DESKTOP in $DOT_DESKTOP_FILES; do
	ln -f config-files/$DOT_DESKTOP ~/.config/autostart/
done
cp config-files/vimrc /usr/share/vim/
