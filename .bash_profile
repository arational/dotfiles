#
# ~/.bash_profile
#

export PATH=$PATH:$HOME/bin:$HOME/google_appengine/
export VISUAL='emc'
export EDITOR='emc'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ $(fgconsole 2>/dev/null) == 1 ]] && exec xinit -- :0 vt$XDG_VTNR -ardelay 200 -arinterval 40
