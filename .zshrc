#Colors
CLEAR='\033[0m'
RED='\033[0;31m'
export ZSH=/home/$USER/.oh-my-zsh

JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"

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

#----[ipa - IP ADDRESS]----#
alias ipa="curl https://api.ipify.org"

#----[LOG->GIT LOG]----#
alias log="git log"

#----[PUSH->GIT PUSH]----#
alias push="git push"

#----[PULL->GIT PULL]----#
alias pull="git pull"

#----[UPPER - CONVERT THE FILE(S) TO UPPER CASE]----#
upper()
{
	for i in "$@"
	do
		ORIGINAL=$i
		RENAME="$(echo $i | tr '[:lower:]' '[:upper:]')"
		if [ -f $RENAME ]; then
			echo "${RED}File${CLEAR} ${RENAME} ${RED}already exists${CLEAR}"
		else
			mv $ORIGINAL $RENAME
			echo "${ORIGINAL} -> ${RENAME}"
		fi
	done
}


#----[LOWER - CONVERT THE FILE(S) TO LOWER CASE]----#
lower()
{
	for i in "$@"
	do
		ORIGINAL=$i
		RENAME="$(echo $i | tr '[:upper:]' '[:lower:]')"
		if [ -f $RENAME ]; then
			echo "${RED}File${CLEAR} ${RENAME} ${RED}already exists${CLEAR}"
		else
			mv $ORIGINAL $RENAME
			echo "${ORIGINAL} -> ${RENAME}"
		fi
	done
}

#----[tm TIME]----#
alias tm="date +"%r""

#----[clock]----#
clock()
{
	while true
	do
		clear
		tm
		sleep 1
	done
}

gputemp()
{
	while true
	do
		clear
		aticonfig --odgt
		sleep 1
	done
}


cputemp()
{
	while true
	do
		clear
		sensors
		sleep 1
	done
}


alias dirs="dirs -h"
#alias push="pushd"
alias pop="popd"

plugins=(git)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh


[ -s "/home/$USER/.dnx/dnvm/dnvm.sh" ] && . "/home/daniel/.dnx/dnvm/dnvm.sh" # Load dnvm

