test -s ~/.alias && . ~/.alias || true

PROMPT="\u@\h:\w> "
NEXT_PROMPT="\u@\h:\w\n> "
export PS1="$PROMPT"

# Default editors
export VISUAL="emacs -nw -q -l ~/.emacs.d/init.el"
export EDITOR="$VISUAL"

# emacs GUI function
function ew
{
  (emacs &> /dev/null -q -l ~/.emacs.d/init_w.el "$@" &)
}

function t2
{
    tree -dL 2
}

# function open
# {
#     google-chrome "$@"
# }

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
