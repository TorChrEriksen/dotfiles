# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

# Prompt colouring
# Ref: http://bitmote.com/index.php?post/2012/11/19/Using-ANSI-Color-Codes-to-Colorize-Your-Bash-Prompt-on-Linux
PROMPT="\u@\h:\w> "
NEXT_PROMPT="\u@\h:\w\n> "
# BACKGROUND="\[\033[1;30;43m\]"
# CLEAR="\[\033[0m\]"
# export PS1="$BACKGROUND\u@\h:\w>$CLEAR "
export PS1="$PROMPT"

# Default editors
export VISUAL="emacs -nw -q -l ~/.emacs.d/init.el"
export EDITOR="$VISUAL"

# Enable gtk 3.X dark for terminal emulators
if [ "$TERM" == "xterm" ] ; then
  xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT "dark" -id `xprop -root | awk '/^_NET_ACTIVE_WINDOW/ {print $5}'`
fi

# Set key F11 to us key layout
bind -x '"\e[23~":"setxkbmap us"'

# Set key F12 to no key layout
bind -x '"\e[24~":"setxkbmap no"'

# emacs GUI function
function ew
{
  (emacs &> /dev/null -q -l ~/.emacs.d/init_w.el "$@" &)
}

# spacetec git clone
function spaceclone
{
    if [ -z $@ ]; then
	echo "usage: spaceclone <spacetec git repo>"
	return 1
    fi

    git clone git@git.spacetec.no:"$@"
}

# fire up gui from local webstart
function gui_ws
{
    target="/home/torce/gui/$1.jnlp"
    javaws $target &
}

function t2
{
    tree -dL 2
}

function afind
{
    find.rb "$@"
}

function open
{
    google-chrome "$@"
}

function np
{
    export PS1="$NEXT_PROMPT"

    NEXT_PROMPT=$PROMPT
    PROMPT=$PS1
}

function h2d
{
  echo "ibase=16; $@"|bc
}

function d2h
{
  echo "obase=16; $@"|bc
}

function gcdiff
{
    if [[ "$1" == "-u" ]]; then
        diff -u <(git show "$2") <(git show "$3")
    else
        diff <(git show "$1") <(git show "$2")
    fi
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
