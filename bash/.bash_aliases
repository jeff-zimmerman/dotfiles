###
# Aliases
###
alias sudo='sudo '
alias ssh='ssh '
alias python='python3'

alias cd='cd '
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias .4='../../../..'
alias .5='../../../../..'

alias kill='kill -9'

alias vi="stty stop '' -ixoff ; vim"
alias vim="stty stop '' -ixoff ; vim"

alias rm='rm -I --preserve-root'

alias ll='ls -al'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias top="htop"

alias pivpn-start='wg-quick up jzimmerman'
alias pivpn-stop='wg-quick down jzimmerman'
alias pivpn-restart='wg-quick down jzimmerman && wg-quick up jzimmerman'
alias pivpn-status='wg show'

###
# Functions
###
listports () {
    if [ ! "$1" == "-a" ]; then
        sudo netstat -tulpn | grep -e "Local Address" -e "$1" | grep -P --color "Local Address|(?<=:)\d+\s|$1"
    else
        sudo netstat -tulpn| grep -P "Local Address|(?<=:)\d+\s"
    fi
}

chprompt () {
    export PS1="\[\e]0;$1@$2: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]$1@$2\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\]"
}
activate () {
    source $1/bin/activate
}
