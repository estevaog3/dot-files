#!/bin/bash

# install basic utilities

apt install -y vim zsh git htop screenfetch weka inxi tmux cmatrix nitrogen cmake virtualbox-qt libboost-all-dev
# set zsh as default shell
sed -i '/^estevao/ s/\/bin\/bash/\/bin\/zsh/' /etc/passwd
# install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

