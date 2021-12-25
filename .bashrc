#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Java
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=gasp -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export JAVA_OPTIONS="-Dsun.java2d.opengl=true"

# gpg-agent
GPG_TTY=$(tty)
export GPG_TTY

# command Aliases
alias ll='ls -alF --color=auto'

# Prompt
PS1='$(if [[ $? == 0 ]]; then echo "\[\033[1;32m\]:-)";else echo "\[\033[1;31m\]:-("; fi)\[\033[0m\] \$ '

eval "$(direnv hook bash)"
