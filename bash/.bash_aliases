###
# Aliases
###
alias sudo='sudo '
alias ssh='ssh '
alias python='python3'

alias cd='cd '
alias ...='../../..'
alias ....='../../../..'
alias .....='../../../../..'
alias .4='../../../..'
alias .5='../../../../..'

alias kill='kill -9'

alias vi="stty stop '' -ixoff ; vim"
alias vim="stty stop '' -ixoff ; vim"

alias rm='rm -I --preserve-root'

alias ll='ls -al'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias top="htop"

alias pivpn-start='systemctl start wg-quick@jzimmerman'
alias pivpn-stop='systemctl stop wg-quick@jzimmerman'

###
# Functions
###
chprompt (){
    export PS1="\[\e]0;$1@$2: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]$1@$2\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\]"
}
activate () {
    source $1/bin/activate
}
