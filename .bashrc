#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Java
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=gasp -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export JAVA_OPTIONS="-Dsun.java2d.opengl=true"

# command Aliases
alias ls='ls --color=auto'
alias qutebrowser='qutebrowser --backend webengine'

# Prompt
PS1='\u $(if [[ $? == 0 ]]; then echo "\[\033[1;32m\]:-)";else echo "\[\033[1;31m\]:-("; fi)\[\033[0m\] \$ '
