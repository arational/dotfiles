#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/bin:$PATH
export VISUAL='emc'
export EDITOR='emc'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
