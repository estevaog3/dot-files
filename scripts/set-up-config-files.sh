#!/bin/bash
BASE_DIR=..
if ! [ -e "$BASE_DIR/username" ]; then
	echo "Error: can't find 'username' file in the directory of this repository"
	exit 1
fi
USER_NAME=`cat $BASE_DIR/username`
for DOT_FILE in $BASE_DIR/config-files/.*; do
	if [ -f $DOT_FILE ]; then
		cp $DOT_FILE ~/
	fi
done

mkdir -p ~/.config/autostart
for DOT_DESKTOP in $BASE_DIR/config-files/*.desktop; do
	cp $DOT_DESKTOP ~/.config/autostart/
	FILE_NAME=`echo $DOT_DESKTOP | awk -F/ '{print $NF}'`
	sed -i "/^Exec/ s/estevao/$USER_NAME/" ~/.config/autostart/$FILE_NAME
done

cp -r $BASE_DIR/config-files/.scripts ~/
cp -r $BASE_DIR/config-files/.deamons ~/
cp -r $BASE_DIR/favorite-wallpapers ~/Pictures

# Add vim plugins 
git clone https://github.com/junegunn/goyo.vim.git ~/.vim/bundle/goyo.vim
git clone https://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary
git clone https://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
# set up github:
git config --global user.email "estevao_carvalho.10@hotmail.com"
git config --global user.name "EstevaoCostaG3"
git config --global core.editor "vim"
