#!/bin/bash
BASE_DIR=..
for DOT_FILE in $BASE_DIR/config-files/.*; do
	if [ -f $DOT_FILE ]; then
		cp $DOT_FILE ~/
	fi
done

mkdir -p ~/.config/autostart
for DOT_DESKTOP in $BASE_DIR/config-files/*.desktop; do
	cp $DOT_DESKTOP ~/.config/autostart/
	FILE_NAME=`echo $DOT_DESKTOP | awk -F/ '{print $NF}'`
	sed -i "/^Exec/ s/estevao/$USER/" ~/.config/autostart/$FILE_NAME
done

cp -r $BASE_DIR/config-files/.scripts ~/
cp -r $BASE_DIR/config-files/.deamons ~/
cp -r $BASE_DIR/favorite-wallpapers ~/Pictures

# Add vim plugins
cd ~/.vim/bundle
git clone https://github.com/junegunn/goyo.vim.git
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/tpope/vim-surround.git

