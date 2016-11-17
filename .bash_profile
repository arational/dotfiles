#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/bin:$PATH
export VISUAL='emc'
export EDITOR='emc'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export PS1='\u $(if [[ $? == 0 ]]; then echo "\[\033[1;32m\]:-)";else echo "\[\033[1;31m\]:-("; fi)\[\033[0m\] \$ '
