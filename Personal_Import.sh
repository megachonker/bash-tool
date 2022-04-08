#!/bin/zsh

#COLOR
txtblk='\e[0;30m' 	# Black - Regular
txtred='\e[0;31m' 	# Red
txtgrn='\e[0;32m' 	# Green
txtblu='\e[0;34m'	# Blue
txtyel='\033[1;93m' # yello
txtrst='\e[0m' 		# Text Reset

#Alias perso
alias vi='vim'
alias dud='du -h'
alias dff='df -h'
alias ffree='free -h'
alias ip='ip -c'
alias iperfc='iperf3 -c'
alias iperfs='iperf3 -s'
alias sstrings='strings -e {s,S,b,l,B,L}'

#Litle script

zstyle ':completion:*:va:*' ignore-line yes
va(){
    cd $(dirname $(plocate $1|head -n 1))
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
        $(echo $@)

        if [[ $FLAG ]] then;
            echo "=========== $(date) ============="
        fi

    done
}


export GREP_COLOR=31
alias grep='grep --color=auto'


#bindkey