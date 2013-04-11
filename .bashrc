#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

set -o vi

alias cpp_comp='g++ `find . -name "*.h" -o -name "*.cpp"` -o main'
