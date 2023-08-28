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

alias dld='cd ~/Downloads'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias vi='nvim'
alias vim='nvim'
alias src='source'
alias grep='grep -rnw'

# git aliases
alias gs='git status'
alias ga='git add .; git status'
alias gp='git push'
alias gr='git remote -v'
alias gaa='git add .'
alias gbr='git branch'
alias gl='git log'
alias gc='git commit'
alias gd='git diff'

# tmux aliases
alias tma='tmux attach-session -t'
alias tmk='tmux kill-session -t'


