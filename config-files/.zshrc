# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/estevao/.oh-my-zsh"

# More themes at https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# general:
alias jn="jupyter notebook > /dev/null 2>&1 &"
alias x="xdg-open $1 > /dev/null 2>&1"
alias egrep="egrep --color=auto"
alias dk="sudo docker"
alias si="sudo snap install"
alias psgrep="ps -ef | grep -v grep | grep -e STIME -e"
alias cdiff='diff --color=always -u'
alias copy="xclip -selection clipboard"
alias ppaste="xclip -selection clipboard -o"
alias json="python3 -m json.tool"
# apt, apt-cache:
alias a="sudo apt"
alias aar="sudo apt-add-repository"
alias ai="sudo apt install"
alias arm="sudo apt remove"
alias aup="sudo apt update"
alias aupg="sudo apt upgrade"
alias ap="apt-cache policy"
alias asr="apt search"
alias acsr="apt-cache search"
alias asw="apt show" 
alias al="apt list" 
alias aarm="sudo apt autoremove"
alias apu="sudo apt purge"
# ls:
alias ls="ls --color=auto --group-directories-first"
alias lsa="ls --almost-all --color=auto --group-directories-first"
alias lsal="ls -lh --almost-all --color=auto --group-directories-first"
alias lsl="ls -lh --color=auto --group-directories-first"
#git:
alias gce="git commit -e"
alias gnt="git init"
alias gla="git pull --all"
# my custom settings:
#
# get suggestions to install command not found, just like in bash
source /etc/zsh_command_not_found

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
