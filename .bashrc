#!/bin/bash
# Last update, Tue Aug  2 13:47:32 CST 2011

# Environment variables
export PS1="\t:\h:\w\n\\$ "
export TZ="Asia/Taipei"
export LC_ALL="zh_TW.UTF-8"
export LANG="zh_TW.UTF-8"
export LC_CTYPE="zh_TW.UTF-8"
export PAGER="less"
export LS_COLORS="di=01;36"
export EDITOR="vim"

# apt-{get, cache}
alias agi="apt-get install"
alias agu="apt-get update"
alias agup="apt-get upgrade"
alias agr='apt-get remove'
alias acs="apt-cache search"
alias acsh="apt-cache show"

# utilities
alias ll='ls -lha'
alias t='tmux attach -d'
alias a='axel -a -n 10'
alias gcc='gcc -Wall -g'
alias g++='g++ -Wall -g'
alias g='grep -in --color=auto -H'
alias info='info --vi-keys'
alias df='df -h'
alias 528='iconv -f big5 -t utf8'
alias wget-m='wget -nd -np -p -k -m'

# mac detection
if [ `uname -s` == "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

# @fn function gr()
# @brief grep recursive with extension or not.
# @return colorful grep result.
function gr()
{
    if [ -z $2 ]; then
	find . -type f -print0 | xargs -0 grep -in --color=auto -H $1
    else
	find . -type f -iname $2 -print0 | xargs -0 grep -in --color=auto -H $1
    fi
}
