#!/bin/bash
# utilities:
sudo apt install -y vim zsh htop inxi tmux cmatrix  virtualbox-qt tree neofetch cowsay xclip xdotool
# media:
sudo apt install -y ffmpeg nitrogen
# dev:
sudo apt install -y git cmake openssh-server nodejs npm yarn mysql-server postgresql mongodb-org ack-grep curl
# need to install timeshift:
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update
# important:
sudo apt install -y timeshift clamav gufw needrestart debsecan lynis
# install Oh My Zsh
curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sed -i 's/exec zsh/#/' install.sh
sudo sh install.sh
# set zsh as default shell
sudo sed -i "/^$USER/ s/\/bin\/bash/\/bin\/zsh/" /etc/passwd
# install pathogen (vim plugin manager)
sudo mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
