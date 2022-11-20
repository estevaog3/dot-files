#!/bin/bash
set -eu -o pipefail

# globals:
echo -n "Type in this system's username: "
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
		tree \
		neofetch \
		dconf-editor \
		|| true
	# dev:
	sudo apt install -y git \
		cmake \
		openssh-server \
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
		debsecan \
		lynis \
		|| true
}

configure_all(){
	for DOT_DIR in config-files/.*; do
	  if [[ -f $DOT_DIR || -d $DOT_DIR && $DOT_DIR != 'config-files/.local' ]]; then
			cp $DOT_DIR ~/
		fi
	done
	cp config-files/.local/bin/* ~/.local/bin
	sed -i "s/\/estevao\//\/$USER_NAME\//" ~/.zshrc
	mkdir -p ~/.config/autostart
	for DOT_DESKTOP in config-files/*.desktop; do
		cp $DOT_DESKTOP ~/.config/autostart/
		FILE_NAME=`echo $DOT_DESKTOP | awk -F/ '{print $NF}'`
		sed -i "/^Exec/ s/estevao/$USER_NAME/" ~/.config/autostart/$FILE_NAME
	done
}

echo "# Installing programs..."
installer

echo "# Configuring all stuff..."
configure_all

echo '# All done
You might want to run the following commands to install and configure oh my zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo sed -i "/^$USER/ s/\/bin\/bash/\/bin\/zsh/" /etc/passwd
'
