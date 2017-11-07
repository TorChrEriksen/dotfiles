# COLORS
NOC='\[\033[0m\]'
BLACK='\[\033[0;30m\]'
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
BROWN='\[\033[0;33m\]'
BLUE='\[\033[0;34m\]'
PURPLE='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
L_GRAY='\[\033[0;37m\]'
D_GRAY='\[\033[1;30m\]'
L_RED='\[\033[1;31m\]'
L_GREEN='\[\033[1;32m\]'
YELLOW='\[\033[1;33m\]'
L_BLUE='\[\033[1;34m\]'
L_PURPLE='\[\033[1;35m\]'
L_CYAN='\[\033[1;36m\]'
WHITE='\[\033[1;37m\]'

OK="[ ${GREEN}OK${NOC} ]"
FAIL="[${RED}FAIL${NOC}]"

function load_alias()
{
    if [[ -s $1 ]]; then
        . $1
        if [[ $? -eq 0 ]]; then
            echo -e "${OK} loading ${1}"
        fi
    else
        echo -e "${FAIL} loading ${1}"
    fi
}

load_alias ~/.alias
# test -s ~/.alias && . ~/.alias || true


function tc_pwd()
{
    if [[ `pwd` == "${HOME}" ]]; then
        echo "~";
    else
        pwd | awk -F\/ '{print $(NF-1),$(NF)}' | sed 's/ /\//'
    fi
}

# Prompt colouring
# Ref: http://bitmote.com/index.php?post/2012/11/19/Using-ANSI-Color-Codes-to-Colorize-Your-Bash-Prompt-on-Linux


# BACKGROUND="\[\033[1;30;43m\]"
# CLEAR="\[\033[0m\]"
# export PS1="$BACKGROUND\u@\h:\w>$CLEAR "

PROMPT="${GREEN}\u@\h${NOC}:${YELLOW}\$(tc_pwd)${NOC} \$ ";
NEXT_PROMPT="${PROMPT:0:-3}\n\$ "

# PROMPT="\u:\w \$ "
# NEXT_PROMPT="${PROMPT:0:-3}\n\$ "
export PS1="$PROMPT"

# Default environment variables
export VISUAL="emacs -nw -q -l ~/.emacs.d/init.el"
export EDITOR="$VISUAL"
export BROWSER=/usr/bin/firefox
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Enable gtk 3.X dark for terminal emulators
# if [ "$TERM" == "xterm" ] ; then
#   xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT "dark" -id `xprop -root | awk '/^_NET_ACTIVE_WINDOW/ {print $5}'`
# fi

# Set key F11 to us key layout
bind -x '"\e[23~":"setxkbmap us"'

# Set key F12 to no key layout
bind -x '"\e[24~":"setxkbmap no"'

# Swap ctrl and caps
setxkbmap -option ctrl:swapcaps

# emacs GUI function
function ew
{
    emacs &> /dev/null -q -l ~/.emacs.d/init_w.el "$@" &
}

function t2
{
    tree -dL 2
}

function open
{
    firefox "$@"
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
