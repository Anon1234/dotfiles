#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.git-prompt.sh

PS1='$(__git_ps1 "(%s) ")[\[\e[00;32m\]\u@\h \W\[\e[0m\]]\$ '

if [[ "$(whoami)" = "root" ]]; then
    PS1='[\[\e[00;31m\]\u@\h \W\[\e[0m\]]\$ '
fi

export EDITOR="subl3"
export GIT_EDITOR="subl3 --wait --new-window"

# Fix for Skype
export GTK2_RC_FILES="/etc/gtk-2.0/gtkrc:$HOME/.gtkrc-2.0"

# Fix ugly font rendering in Java Apps
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

export VDPAU_DRIVER="va_gl"

# Golang
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx  -- -keeptty -nolisten tcp

shopt -s autocd
shopt -s checkwinsize


alias ls='ls --color=auto'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias igrep='grep -i'
alias grep='grep --color'
alias hd='hexdump -C'
alias h='htop'
alias please='sudo "$BASH" -c "$(history -p !!)"'
alias upg='yaourt -Syu --aur --noconfirm'
alias fullcharge='sudo tlp chargeonce && sudo tlp fullcharge'
alias d='docker'
alias p='ipython'
alias docker-rm-all='docker rm `docker ps --no-trunc -aq`'
alias docker-stop-all='docker stop `docker ps --no-trunc -aq`'
alias day='~/.config/redshift/hooks/notify.sh period-changed to daytime'
alias night='~/.config/redshift/hooks/notify.sh period-changed to night'
alias ff='firefox --new-tab'
alias hrom="mpv  --really-quiet --video-unscaled=yes --ytdl-raw-options='format=best[height=720]' https://www.youtube.com/watch?v=$(wget -q http://www.hromadske.tv/ -O - | grep 'var mainstream ' | cut -d/ -f5 | cut -d\? -f1) &"
alias clear_pkg_cache='paccache -r && paccache -ruk 0'
alias m='mpv --vf mirror tv://'
alias kyivpolice='mpv "http://audio5.broadcastify.com/2z965p1cswyh"'
alias ipcalc='ipcalc -b'
alias notify="tee /dev/tty | xargs -n 1 -d '\n' -- notify-send -i stock_dialog-warning"


# TODO: fix this
# alias devdocs='docker run --rm --name devdocs -p 9292:9292 thibaut/devdocs && xdg-open http://localhost:9292'

yapfdiff() {
    yapf -d "$1" | pygmentize -l diff
}

docker-ip() {
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

when() {
    date --date "$*"
}

mkcd() {
    command mkdir "$1" && cd "$1"
}

say() {
	espeak -s $((100+(($RANDOM%2)*30))) "$*" &> /dev/null &
}




