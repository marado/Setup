# XDG
export XDG_CONFIG_HOME="${HOME}/.xdg"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source alias
if [ -f ${XDG_CONFIG_HOME}/.alias ]; then
    . ${XDG_CONFIG_HOME}/.alias
fi

# Source extra alias
if [ -f ${HOME}/.alias ]; then
    . ${HOME}/.alias
fi

# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\u@\e[0;31m\h\e[m \W]\[$(tput setaf 7)\] \j$ '
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

export WORKON_HOME="${HOME}/.virtualenvs"
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
