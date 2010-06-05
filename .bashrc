#!/bin/bash
# Last update, Sat Oct  3 20:58:19 CST 2009

# Environment variables
export PS1="\t:\h:\w\n\\$ "
export TZ="Asia/Taipei"
export LC_ALL="C"
export LANG="C"
export LC_CTYPE="C"
export PAGER="less"
export DISPLAY=":0.0"
export LS_COLORS="di=01;36"
export EDITOR="vim"

# apt-{get, cache}
alias agi="apt-get install"
alias agu="apt-get update"
alias agup="apt-get upgrade"
alias agr='apt-get remove'
alias acs="apt-cache search"
alias acsh="apt-cache show"

# hostings
export linux="192.168.1.80"
export ZD="163.26.225.8"
export SL400="192.168.1.26"
alias zd='ssh a2n@${ZD}'
alias sl400='ssh a2n@${SL400}'
alias linux='ssh a2n@192.168.1.80'
alias tunnel='ssh -fNCD 29999 a2n@163.26.225.8'

# utilities
alias ll='ls -lha'
alias ls='ls --color=auto'
alias t='tmux attach -d'
alias a='axel -a -n 10'
alias e='epdfview &> /dev/null &'
alias gcc='gcc -Wall -g'
alias g++='g++ -Wall -g'
alias g='grep -in --color=auto'
alias info='info --vi-keys'
alias sd='sdcv'
alias df='df -h'
alias opera='opera -visual 0x3e --nomail &> /dev/null &'
alias 528='iconv -f big5 -t utf8'
alias clive='clive --limit-rate=100 -c -f mp4'
alias wget-m='wget -nd -np -p -k -m'
#alias make='make -j `cat /proc/cpuinfo | grep "precessor" | wc -l`'
alias urxvt-utf8='LC_ALL=zh_TW.utf8 LC_CTYPE=zh_TW.utf8 LANG=zh_TW.utf8 urxvt -fn xft:"Dejavu Sans Mono",[codeset=utf8]"AR PL UMing TW" -bg black -fg white'
alias mrxvt-big5='LC_CTYPE=zh_TW.big5 LC_ALL=zh_TW.big5 LANG=zh_TW.big5 mrxvt -xft -xftfm "AR PL KaitiM Big5" -xftfn "AR PL KaitiM Big5" -xftmsz 18 -xftsz 18 -xftaa -xftah -xftbwt light -xftwt light'

function radio() {
	echo -e "London: `TZ=GB date`\n";
	if [ -z $1 ]; then
		echo -e "Usage:\tradio [commands] [indecs]";
		echo -e "\tradio list ::shows up all indecs"
		echo -e "\tradio play indecs ::play indicated choice"
	else
		case $1 in
			"list")
			echo "[1] BBC RADIO 1, The best new music"
			echo "[2] BBC RADIO 2, Music & Entertainment"
			echo "[3] BBC RADIO 3, Classical, Jazz, World, Arts, Drama"
			echo "[4] BBC RADIO 4, Intelligent speech"
			echo "[5] BBC RADIO 5, Live news - live sport"
			echo "[6] 1Xtra"
			echo "[7] 6 Music"
			echo "[8] BBC 7"
			echo "[9] Asian Network"
			;;
			"play")
				bbc_radio $2;
		esac
	fi

}

function bbc_radio() {
	local url
	case $1 in
		"1") url="rtsp://rmlegacy.bbc.co.uk/bbc-rbs/rmlegacy/farm/live24/bbc_ami/radio1/radio1_nb_int_live.ra?BBC-UID=c4faac68294917b094f12dd051aebd9ae6206f79f02061b414efe4b63830deea&SSO2-UID="
		;;
		"2") url="rtsp://rmlegacy.bbc.co.uk/bbc-rbs/rmlegacy/farm/live24/bbc_ami/radio2/radio2_nb_int_live.ra?BBC-UID=f4ba9cd8390980ab94f2fa93110c5dfe9e337f9e90b03184b49fb4d6d3fae98a&SSO2-UID="
		;;
		"3") url="rtsp://rmlegacy.bbc.co.uk/bbc-rbs/rmlegacy/farm/live24/bbc_ami/radio3/radio3_nb_int_live.ra?BBC-UID=245a7cb83909132724831b54218783ea90fa6465809011b4c47f245603dac9ba&SSO2-UID="
		;;
		"4") url="rtsp://rmlegacy.bbc.co.uk/bbc-rbs/rmlegacy/farm/live24/bbc_ami/radio4/radio4_nb_int_live.ra?BBC-UID=a46a7c8899c9192802f74c8da1d4002cbba1fa39009011c4f44f8936ff2ef0a7&SSO2-UID="
		;;
		"5") url="rtsp://rmlegacy.bbc.co.uk/bbc-rbs/rmlegacy/farm/live24/bbc_ami/radio5/5live_nb_int_live.ra?BBC-UID=b45a3c28f9b90cacb4273564114747591ef3931a50b011d444ffd4e663ea19da&SSO2-UID="
		;;
		"6") url="rtsp://rmlegacy.bbc.co.uk/bbc-rbs/rmlegacy/farm/live24/bbc_ami/1xtra/1xtra_nb_int_live.ra?BBC-UID=242afd24862ce73db6d21d849137c16bbc90163a1080720112f8d084d4cd32d4&SSO2-UID="
		;;
		"7") url="rtsp://rmlegacy.bbc.co.uk/bbc-rbs/rmlegacy/farm/live24/bbc_ami/6music/6music_nb_int_live.ra?BBC-UID=440a8d74b6dcdadd8663ff2eb1730aec24b4e511f0e032e132a870d4e46d6234&SSO2-UID="
		;;
		"8") url="rtsp://rmlegacy.bbc.co.uk/bbc-rbs/rmlegacy/farm/live24/bbc_ami/bbc7/bbc7_nb_int_live.ra?BBC-UID=647a8db4665ce421c616152e71418388ec8235b47030c2712288b0e4931cc0b8&SSO2-UID="
		;;
		"9") url="rtsp://rmlegacy.bbc.co.uk/bbc-rbs/rmlegacy/farm/live24/bbc_ami/asiannet/asiannet_nb_int_live.ra?BBC-UID=e44afdc4669c3e95dccf960fd159e19721ecfe0e2050015464cf39571cb2aa51&SSO2-UID="
		;;
	esac
	mplayer "$url"
}
