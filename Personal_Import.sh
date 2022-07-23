#!/bin/zsh

PRIVATE_VAR=/var/PRIVATE_VAR

#COLOR
txtblk='\e[0;30m' 	# Black - Regular
txtred='\e[0;31m' 	# Red
txtgrn='\e[0;32m' 	# Green
txtblu='\e[0;34m'	# Blue
txtyel='\033[1;93m' # yello
txtrst='\e[0m' 		# Text Reset

#export
export MAKEFLAGS="-j $(nproc)"
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
    location=$(plocate "$1"|xargs -I {} dirname {} |uniq)
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
    if [[ $last =~ F.* ]] then;
        FLAG=$last
        unset 'argv[-1]'
    fi

    while true; do

        sleep $TEMP

        if [[ $FLAG =~ FD.* ]] then;
            echo "=========== $(date) ============="
        elif [[ $FLAG =~ F(B|C).* ]] then;
            clear
        fi

        #invoque un shell ?
        $(echo $@)


    done
}


moyenne(){    
    rm -f timing
    nbloop=$1
    shift 1
    for valeur in $(seq $nbloop);
    do
        /bin/time -f "%e" $(echo $@) 2>> timing
    done
    echo temps moyen:
    OP=$(echo -n \( ; tr '\n' '+' < timing ; echo 0\)/${nbloop})
    echo "scale=3;$OP"|bc #|tee -a final
    rm timing
}



#bindkey


#tgest


# completion
fpath+=$(sed -n 2p $PRIVATE_VAR)
export fpath
compinit
