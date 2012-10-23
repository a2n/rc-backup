#!/bin/bash
# Last update, 2012年 7月16日 周一 15時46分08秒 CST 

# Golang
export GOROOT=/home/a2n/opt/go
export PATH=$PATH:$GOROOT/bin:/var/lib/gems/1.8/bin

# Environment variables
export PS1="\t:\h:\w\n\\$ "
export TZ="Asia/Taipei"
export PAGER="less -iXF"
export EDITOR="vim"
export LC_ALL="zh_TW.UTF-8"
export LC_MESSAGE="C"
export LANG="zh_TW.UTF-8"

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
alias gcc='gcc -Wall -g'
alias g++='g++ -Wall -g'
alias info='info --vi-keys'
alias df='df -h'
alias wget-m='wget -nd -np -p -k -m'
alias less="less -iXF"
alias s="screen -DR"
alias 528='iconv -f big5 -t utf8'
alias g='grep --mmap -EHin --colour=auto'

# code hacking
alias chromium="cd /Users/a2n/labs/chromium/src/chromium"
alias screen="screen -U"

# bashrc secret
if [ -r ~/.bashrc_secret ]; then
    . ~/.bashrc_secret
fi

# Platform dependency
if [ `uname -s` == "Darwin" ]; then
    MACOS=true;
else
    MACOS=false;
fi

if ($MACOS); then
    alias top='top -o cpu'
    alias ls='ls -GF'
    export LSCOLORS="exfxcxdxbxegedabagacad"
else
    alias ls='ls --color=auto'
    export LS_COLORS="di=01;36"
fi

# @fn function gr()
# @brief grep recursive with extension or not.
# @return colorful grep result.
function gr()
{
    if [ -z $2 ]; then
	find . -type f -print0 | xargs -0 grep --mmap -in --color=auto -H $1
    else
	find . -type f -iname "$2" -print0 | xargs -0 grep --mmap -in --color=auto -H $1
    fi
}

# @fn function ns()
# @brief Show all tcp established connection, exclude 127.0.0.1.
function ns()
{
    echo -n tcp sessions: 
    if ($MACOS); then
	cmd="netstat -nf inet -p tcp"
    else
	cmd="netstat -n4"
    fi
    eval $cmd |
    grep -e "ESTABLISHED" |
    grep -v "127.0.0.1" |
    awk '{ print $6 }' |
    wc -l
}
