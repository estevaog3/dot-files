#!/bin/bash
set -eu -o pipefail

# globals:
echo -n "This system's username: "
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
		dconf-editor \
		|| true
	# dev:
	sudo apt install -y git \
		cmake \
		openssh-server \
		mysql-server \
		postgresql \
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
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed 's/exec zsh/#/')"
	# set zsh as default shell
	sudo sed -i "/^$USER_NAME/ s/\/bin\/bash/\/bin\/zsh/" /etc/passwd
	# install pathogen (vim plugin manager)
	sudo mkdir -p ~/.vim/autoload ~/.vim/bundle
	sudo curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	# install tweak tool:
	sudo add-apt-repository universe
	sudo apt install gnome-tweak-tool
}

configure_all(){
	BASE_DIR=.
	for DOTS in $BASE_DIR/config-files/.*; do
	  if [ -f $DOTS ] || [ -d $DOTS ]; then
			cp $DOTS ~/
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
}

echo "# Installing programs..."
installer

echo "# Configuring all stuff..."
configure_all

echo "# All done"
