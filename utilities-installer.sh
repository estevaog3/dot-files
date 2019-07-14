#!/bin/bash

# install basic utilities

apt install -y vim zsh git htop screenfetch weka inxi tmux cmatrix nitrogen cmake virtualbox-qt gnome-tweak-tool gimp
# set zsh as default shell
sed -i '/^estevao/ s/\/bin\/bash/\/bin\/zsh/' /etc/passwd
# install Oh My Zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# set up github:
git config --global user.email "estevao_carvalho.10@hotmail.com"
git config --global user.name "EstevaoCostaG3"
