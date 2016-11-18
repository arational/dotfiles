#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\u $(if [[ $? == 0 ]]; then echo "\[\033[1;32m\]:-)";else echo "\[\033[1;31m\]:-("; fi)\[\033[0m\] \$ '
