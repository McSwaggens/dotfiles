export ZSH=/home/daniel/.oh-my-zsh

#----[THEME]----#
ZSH_THEME="DJ"

#----[CLR->CLEAR]----#
alias clr="clear"

#----[COM]----#
com()
{
	if ! [ -z "$1" ] && ! [ -z "$2" ]
	then
		git add $1
		git commit -m "$2"
	else
		echo "Missing parameters (com <files> <commit name>)"
	fi
}

#----[LOG->GIT LOG]----#
alias log="git log"

alias dirs="dirs -h"
alias push="pushd"
alias pop="popd"

plugins=(git)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

