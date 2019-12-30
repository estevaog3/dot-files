#!/bin/bash

# utilities:
apt install -y vim zsh htop inxi tmux cmatrix  virtualbox-qt tree neofetch cowsay xclip
# media:
apt install -y byzanz ffmpeg nitrogen
# dev:
apt install -y git cmake openssh-server nodejs npm yarn mysql-server postgresql mongodb-org docker-ce docker-ce-cli containerd.io ack-grep curl
# need to install timeshift:
apt-add-repository -y ppa:teejee2008/ppa
apt update
# important:
apt install -y timeshift clamav gufw needrestart debsecan lynis
# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# set zsh as default shell
sed -i '/^estevao/ s/\/bin\/bash/\/bin\/zsh/' /etc/passwd
# set up github:
git config --global user.email "estevao_carvalho.10@hotmail.com"
git config --global user.name "EstevaoCostaG3"
# install pathogen (vim plugin manager)
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
