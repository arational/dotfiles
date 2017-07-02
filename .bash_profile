#
# ~/.bash_profile
#

export PATH=$PATH:$HOME/bin:$HOME/src/chicken/bin
export VISUAL='emc'
export EDITOR='emc'
export BROWSER='qutebrowser'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ $(fgconsole 2>/dev/null) == 1 ]]
then
  exec xinit -- :0 vt$XDG_VTNR -ardelay 200 -arinterval 40
fi
