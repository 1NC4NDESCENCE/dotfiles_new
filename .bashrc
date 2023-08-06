# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.

# ls aliases
alias ll='ls -halF'
alias la='ls -lh'
alias l='ls -CF'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# cd aliases
alias '~'='cd ~'
alias '..'='cd ..'
alias '...'='cd ../..'
alias '..4'='cd ../../..'
alias '..5'='cd ../../../..'

alias Downloads='cd /mnt/d/Downloads'
alias Onedrive='cd /mnt/d/Onedrive'
alias MounRiver='cd /mnt/c/MounRiver/MounRiver_Studio/workspace'
alias nvimcfg='nvim ~/.config/nvim/init.vim'
alias vi='nvim'
alias vim='nvim'
alias src='source'
alias grep='grep -rnw'

# git aliases
alias gs='git status'
alias gaa='git add .'
alias gbr='git branch'
alias gl='git log'
alias gc='git commit'

# tmux aliases
alias tma='tmux attach-session -t'
alias tmk='tmux kill-session -t'

# functions
unzip() {
	7z x "/mnt/d/Downloads/$1" "-o$2"
}
transcode_porn() {
	if [$1 == "remux"]
	then
		ffmpeg -i "/mnt/d/Porn/$4.$2" -codec copy "/mnt/d/Porn/$4.$3"
	fi
}
mk_dotfile() {
	# assumes any dot{file/dir} is in root directory
	# first argument is file(f) or dir(d), second argument is the dot{file/dir} name, not path to it
	# consider improving it by not linking the whole .config dir but link all dirs inside respectively so that it is easier to find the config for the application you are looking for 
	# not working yet
	# make it so that if any command inside reports an error, don't execute any command following it.
	if [$1 == 'f']
	then
		mv -i ~/$2 ~/.dotfiles
		ln -s ~/.dotfiles/$2 ~/$2
	fi
	if [$1 == 'd']
	then
		mv -i ~/$2 ~/.dotfiles/$2
		ln -s ~/.dotfiles/$2 ~/$2
	fi
}

# Alias definitions.
# !!! consider this
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

red="\001$(tput setaf 1)\002"
green="\001$(tput setaf 2)\002"
yellow="\001$(tput setaf 3)\002"
blue="\001$(tput setaf 4)\002"
magenta="\001$(tput setaf 5)\002"
cyan="\001$(tput setaf 6)\002"
white="\001$(tput setaf 7)\002"
reset="\001$(tput sgr0)\002"
bold="\001$(tput bold)\002"
dim="\001$(tput dim)\002"

PS1="$green\u$dim$white at $reset$cyan\h"
PS1+="$white in$yellow \w\n"
PS1+="$dim$green[\t] $reset\$ "
export BROWSER=wslview


# export PS1="[${_BOLD}${_GREEN}\u${_RESET}${_RED}@${_MAGENTA}\h: ${_CYAN}\w${_RESET}] ${_BOLD}\$ ${_RESET}"
export NEMU_HOME=/home/jiao/ics2022/nemu
export AM_HOME=/home/jiao/ics2022/abstract-machine
export PATH="/usr/lib/ccache:/home/jiao/.local/bin:$PATH"
