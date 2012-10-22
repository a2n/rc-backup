#!/bin/bash
# Last update, Fri Apr 20 17:59:39 CST 2012

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go

# Environment variables
export PS1="\t:\h:\w\n\\$ "
export TZ="Asia/Taipei"
export PAGER="less -iXF"
export EDITOR="vim"
export PATH=$PATH:/Users/a2n/Downloads/android-sdk-macosx/platform-tools

# utilities
alias ll='ls -lha'
alias t='tmux attach -d'
alias gcc='gcc -Wall -g'
alias g++='g++ -Wall -g'
alias info='info --vi-keys'
alias df='df -h'
alias wget-m='wget -nd -np -p -k -m'
alias less="less -iXF"
alias s="screen -DRU"
alias youtube-dl="youtube-dl -nt"

# code hacking
alias chromium="cd /Users/a2n/labs/chromium/src/chromium"

# bashrc secret
if [ -r ~/.bashrc_secret ]; then
    . ~/.bashrc_secret
fi

# git completion
if [ -r ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Platform dependency
if [ `uname -s` == "Darwin" ]; then
    MACOS=true;
else
    MACOS=false;
fi

if ($MACOS); then
    alias g='grep --mmap -EHin --colour=auto'
    alias top='top -o cpu'
    alias ls='ls -GF'
    alias 528='iconv -f BIG-5 -t UTF-8'
    export LSCOLORS="exfxcxdxbxegedabagacad"
    export LC_ALL="zh_TW.UTF-8"
    export LANG="zh_TW.UTF-8"
    export LC_CTYPE="zh_TW.UTF-8"
else
    alias g='grep --mmap -EHin --color=auto'
    alias top='top -o -vsize -O -cpu'
    alias ls='ls --color=auto'
    alias 528='iconv -f big5 -t utf8'
    alias youtube-dl='youtube-dl -ct'
    export LS_COLORS="di=01;36"
    export LC_ALL="C"
    export LANG="C"
    export LC_CTYPE="C"

    # apt-{get, cache}
    alias agi="apt-get install"
    alias agu="apt-get update"
    alias agup="apt-get upgrade"
    alias agr='apt-get remove'
    alias acs="apt-cache search"
    alias acsh="apt-cache show"
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

# @fn function length()
# @brief Count string length
function length()
{
    echo $1 | wc -m
}
