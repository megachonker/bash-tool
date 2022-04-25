#!/bin/zsh

if [ -f "$/var/PRIVATE_VAR" ]; then
    PRIVATE_VAR=/var/PRIVATE_VAR
else 
    PRIVATE_VAR="/dev/null"
fi

#COLOR
txtblk='\e[0;30m' 	# Black - Regular
txtred='\e[0;31m' 	# Red
txtgrn='\e[0;32m' 	# Green
txtblu='\e[0;34m'	# Blue
txtyel='\033[1;93m' # yello
txtrst='\e[0m' 		# Text Reset

#export
export MAKEFLAGS="-j 24"
export GREP_COLOR=31
export ETHPOOL=$(head -n1 $PRIVATE_VAR)

#Alias perso
alias vi='vim'
alias dud='du -h'
alias dff='df -h'
alias ffree='free -h'
alias ip='ip -c'
alias iperfc='iperf3 -c'
alias iperfs='iperf3 -s'
alias sstrings='strings -e {s,S,b,l,B,L}'

alias grep='grep --color=auto'
alias ncdu='ncdu -e'
alias reset='/bin/reset && reloadShell'


#Litle script

va(){
    lignumber=1
    location=$(mlocate "$1"|xargs -I {} dirname {} |uniq)
    if [ $# -eq 2 ] ;then
        lignumber=$2
    else
        echo $location|cat -n
    fi
    location=$(echo $location|sed -n ${lignumber}p )
    cd $location
}

reloadShell () {
   exec $SHELL $SHELL_ARGS "$@"
}

watch(){
    TEMP=0.5
    FLAG="";

    if [[ $1 =~ [0-9.] ]] then;
        TEMP=$1
        shift 1
    fi
    last=${argv[-1]}
    if [[ $last == "FLAG" ]] then;
        FLAG="ON"
        unset 'argv[-1]'
    fi

    while true; do
        sleep $TEMP

        #invoque un shell ?
        $(echo $@)

        if [[ $FLAG ]] then;
            echo "=========== $(date) ============="
        fi

    done
}




#bindkey


#tgest


# completion
fpath+=$(sed -n 2p $PRIVATE_VAR)
export fpath
compinit