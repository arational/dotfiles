#
# ~/.bash_profile
#

export PATH=$HOME/bin:$PATH:$HOME/.gem/ruby/2.4.0/bin:$HOME/src/adr-tools/src
export VISUAL='emc'
export EDITOR='emc'
export BROWSER='qutebrowser'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export MAGICK_OCL_DEVICE=OFF

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ $(fgconsole 2>/dev/null) == 1 ]]
then
  exec xinit -- :0 vt$XDG_VTNR -ardelay 200 -arinterval 40
fi
