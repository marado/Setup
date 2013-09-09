## ANTIGEN CONFIG
source $HOME/bin/antigen.zsh

# Load the oh-my-zsh's library.
antigen-use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle git
antigen-bundle pip
antigen-bundle lein
antigen-bundle kennethreitz/autoenv
antigen-bundle command-not-found

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen-theme gallois

# Tell antigen that you're done.
antigen-apply

## END ANTIGEN

export COMPLETION_WAITING_DOTS=true

# XDG
export XDG_CONFIG_HOME="${HOME}/.xdg"

# Source alias
if [ -f ${XDG_CONFIG_HOME}/.alias ]; then
    . ${XDG_CONFIG_HOME}/.alias
fi

# Source extra alias
if [ -f ${XDG_CONFIG_HOME}/.alias_extra ]; then
    . ${XDG_CONFIG_HOME}/.alias_extra
fi

wiki() { dig +short txt $1.wp.dg.cx }

grep_output="$(uname -a | grep -oh 'Ubuntu')"

export WORKON_HOME=$HOME/.virtualenvs
if [ $grep_output = "Ubuntu" ]; then
    source /etc/bash_completion.d/virtualenvwrapper
else
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
    source /usr/bin/virtualenvwrapper.sh
fi

xrdb -merge ~/.Xdefaults

# for tmux: export 256color
[ -n "$TMUX" ] && export TERM=screen-256color
