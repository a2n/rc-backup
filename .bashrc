#!/bin/bash
# Last update, Wed Oct  5 17:12:55 CST 2011

# Environment variables
export PS1="\t:\h:\w\n\\$ "
export TZ="Asia/Taipei"
export PAGER="less -iXF"
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
alias g='grep -mmap -EHin --color=auto'
alias info='info --vi-keys'
alias df='df -h'
alias 528='iconv -f big5 -t utf8'
alias wget-m='wget -nd -np -p -k -m'
alias less="less -iXF"

# bashrc secret
. ~/.bashrc_secret

# mac detection
if [ `uname -s` == "Darwin" ]; then
    alias ls='ls -G'
    alias top='top -o -vsize -O -cpu'
    export LSCOLORS="exfxcxdxbxegedabagacad"
    export LC_ALL="zh_TW.UTF-8"
    export LANG="zh_TW.UTF-8"
    export LC_CTYPE="zh_TW.UTF-8"
else
    alias ls='ls --color=auto'
    export LS_COLORS="di=01;36"
    export LC_ALL="C"
    export LANG="C"
    export LC_CTYPE="C"
fi

# @fn function gr()
# @brief grep recursive with extension or not.
# @return colorful grep result.
function gr()
{
    if [ -z $2 ]; then
	find . -type f -print0 | xargs -0 grep --mmap -in --color=auto -H $1
    else
	find . -type f -iname $2 -print0 | xargs -0 grep --mmap -in --color=auto -H $1
    fi
}

# @fn function 28()
# @brief SSH to server.
# @ return Establishing a ssh connection.
function rd()
{
    ssh -p 2828 alan@192.168.1.22
    # $? represents the return value.
    if [ $? = 255 ]; then
	ssh -p 2828 alan@rd.28int.com
    fi
}

# @fn function ns()
# @brief Show all tcp established connection, exclude 127.0.0.1.
function ns()
{
    echo -n tcp sessions: 
    netstat -nf inet -p tcp |
    grep -e "ESTABLISHED" |
    grep -v "127.0.0.1" |
    awk '{ print $6 }' |
    wc -l
}
