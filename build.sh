#!/bin/bash
set -eu -o pipefail

# globals:
echo -n "username: "
read USER_NAME
[ -z `egrep "^$USER_NAME:" /etc/passwd` ] && echo "Error: user '$USER_NAME' doesn't exists" && exit 1

installer(){
	# necessary:
	sudo apt install -y \
		vim \
		zsh \
		xclip \
		xdotool \
		ffmpeg \
		nitrogen
	# utilities:
	sudo apt install -y htop \
		inxi \
		tmux \
		virtualbox-qt \
		tree \
		neofetch \
		|| true
	# dev:
	sudo apt install -y git \
		cmake \
		openssh-server \
		yarn \
		mysql-server \
		postgresql \
		mongodb-org \
		ack-grep \
		curl \
		|| true
	# need to install timeshift:
	sudo apt-add-repository -y ppa:teejee2008/ppa
	sudo apt update
	# important:
	sudo apt install -y timeshift \
		clamav \
		gufw \
		needrestart \
		debsecan \
		lynis \
		|| true
	# install Oh My Zsh
	curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	sed -i 's/exec zsh/#/' install.sh
	sudo sh install.sh
	# set zsh as default shell
	sudo sed -i "/^$USER_NAME/ s/\/bin\/bash/\/bin\/zsh/" /etc/passwd
	# install pathogen (vim plugin manager)
	sudo mkdir -p ~/.vim/autoload ~/.vim/bundle && \
			curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

configure_all(){
	BASE_DIR=.
	for DOT_FILE in $BASE_DIR/config-files/.*; do
		if [ -f $DOT_FILE ]; then
			cp $DOT_FILE ~/
		fi
	done
	sed -i "s/\/estevao\//\/$USER_NAME\//" ~/.zshrc
	mkdir -p ~/.config/autostart
	for DOT_DESKTOP in $BASE_DIR/config-files/*.desktop; do
		cp $DOT_DESKTOP ~/.config/autostart/
		FILE_NAME=`echo $DOT_DESKTOP | awk -F/ '{print $NF}'`
		sed -i "/^Exec/ s/estevao/$USER_NAME/" ~/.config/autostart/$FILE_NAME
	done

	cp -r $BASE_DIR/config-files/.scripts ~/
	cp -r $BASE_DIR/config-files/.deamons ~/

	# Add vim plugins 
	git clone https://github.com/junegunn/goyo.vim.git ~/.vim/bundle/goyo.vim
	git clone https://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary
	git clone https://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
	# set up github:
	git config --global user.email "estevao_carvalho.10@hotmail.com"
	git config --global user.name "estevaog3"
	git config --global core.editor "vim"
}

echo "# Installing programs..."
installer

echo "# Configuring all stuff..."
configure_all

echo "# All done"
