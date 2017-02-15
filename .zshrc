#Colors
CLEAR='\033[0m'
RED='\033[0;31m'
export ZSH=$HOME/.oh-my-zsh

JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"



initializeANSI()
{
 esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"
  
  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

# figlet -f slant Mammoth | lolcat --seed=234312323244 -a --duration=3 
# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

initializeANSI


# Wait for terminal to initialize it's size
sleep 0.03

# Rainbow line
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' - | lolcat -a --duration=9

clear

# Print the #! #! #! #! #! #!
cat << EOF

 ${reset}${redf}▄█▄█▄ ${reset}${boldon}${redf}█ ${reset}${greenf}▄█▄█▄ ${reset}${boldon}${greenf}█ ${reset}${yellowf}▄█▄█▄ ${reset}${boldon}${yellowf}█ ${reset}${bluef}▄█▄█▄ ${reset}${boldon}${bluef}█ ${reset}${purplef}▄█▄█▄ ${reset}${boldon}${purplef}█ ${reset}${cyanf}▄█▄█▄ ${reset}${boldon}${cyanf}█${reset} 
 ${reset}${redf}▄█▄█▄ ${reset}${boldon}${redf}▀ ${reset}${greenf}▄█▄█▄ ${reset}${boldon}${greenf}▀ ${reset}${yellowf}▄█▄█▄ ${reset}${boldon}${yellowf}▀ ${reset}${bluef}▄█▄█▄ ${reset}${boldon}${bluef}▀ ${reset}${purplef}▄█▄█▄ ${reset}${boldon}${purplef}▀ ${reset}${cyanf}▄█▄█▄ ${reset}${boldon}${cyanf}▀${reset}
 ${reset}${redf} ▀ ▀  ${reset}${boldon}${redf}▀ ${reset}${greenf} ▀ ▀  ${reset}${boldon}${greenf}▀ ${reset}${yellowf} ▀ ▀  ${reset}${boldon}${yellowf}▀ ${reset}${bluef} ▀ ▀  ${reset}${boldon}${bluef}▀ ${reset}${purplef} ▀ ▀  ${reset}${boldon}${purplef}▀ ${reset}${cyanf} ▀ ▀  ${reset}${boldon}${cyanf}▀${reset}
EOF


# Print out some simple information
echo -e " ${boldon}${bluef} User: $(whoami) ${whitef}-> ${bluef}$(uname --nodename)${reset}"


#----[THEME]----#
ZSH_THEME="DJ"

#----[EDIT->MICRO]----#
alias edit="micro"

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

alias at="cd ~/Documents/AimTux/"

#----[install - dpkg -i]----#
alias install="sudo dpkg -i"

#----[nt - new terminal]----#
alias nt="gnome-terminal $(pwd)"

#----[ipa - IP ADDRESS]----#
alias ipa="curl https://api.ipify.org"

#----[LOG->GIT LOG]----#
alias log="git log"

#----[PUSH->GIT PUSH]----#
alias push="git push"

#----[PULL->GIT PULL]----#
alias pull="git pull"

#----[CHECKOUT->GIT CHECKOUT]----#
alias checkout="git checkout"

#----[UPPER - CONVERT THE FILE(S) TO UPPER CASE]----#
upper()
{
	for i in "$@"
	do
		ORIGINAL=$i
		RENAME="$(echo $i | tr '[:lower:]' '[:upper:]')"
		if [ -f $RENAME ]; then
			echo "${RED}File${CLEAR} ${RENAME} ${RED}already exists${CLEAR}"
		elif [ ! -f $ORIGINAL ]; then
			echo "${RED}File${CLEAR} ${ORIGINAL} ${RED}does not exist${CLEAR}"
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
		elif [ ! -f $ORIGINAL ]; then
			echo "${RED}File${CLEAR} ${ORIGINAL} ${RED}does not exist${CLEAR}"
		else
			mv $ORIGINAL $RENAME
			echo "${ORIGINAL} -> ${RENAME}"
		fi
	done
}

colorfetch()
{
	T='xYz'   # The test text

	echo -e "\n                 40m     41m     42m     43m\
	     44m     45m     46m     47m";

	for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
	           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
			              '  36m' '1;36m' '  37m' '1;37m';
	do FG=${FGs// /}
	echo -en " $FGs \033[$FG  $T "
	for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
		do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
		done
		echo;
		done
	 echo
}

#----[kls SIGKILL]----#
alias kls="kill -s SIGKILL"



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


alias dirs="dirs -v"
#alias push="pushd"
alias pop="popd"

plugins=(git zsh-autosuggestions zsh-completions)
autoload -U compinit && compinit
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh


[ -s "/home/$USER/.dnx/dnvm/dnvm.sh" ] && . "/home/daniel/.dnx/dnvm/dnvm.sh" # Load dnvm
