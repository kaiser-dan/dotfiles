#!/usr/bin/env bash
###################
#     Headers     #
###################

# Archiving and compression
# Statuses and quotas

# =============================================
#############################
# Archiving and compression #
#############################
# (De)compress given directory 
# as gzipped tarball using `ouch`
ouchy () {
	case $1 in
		*.tar.gz )
			ouch d $1;;
		*)
			ouch c $1 "${1\/%%}.tar.gz";;
	esac
}


##############################
# Screen statuses and quotas #
##############################
# --- Drivers ---
progreSh() {
    LR='\033[1;31m'
    LG='\033[1;32m'
    LY='\033[1;33m'
    LC='\033[1;36m'
    LW='\033[1;37m'
    NC='\033[0m'
    if [ "${1}" = "0" ]; then TME=$(date +"%s"); fi
    SEC="FIXME >:( sec" #`printf "%04d\n" $(($(date +"%s")-${TME}))`; SEC="$SEC sec"
    PRC=`printf "%.0f" ${1}`
    SHW=`printf "%3d\n" ${PRC}`
    LNE=`printf "%.0f" $((${PRC}/2))`
    LRR=`printf "%.0f" $((${PRC}/2-12))`; if [ ${LRR} -le 0 ]; then LRR=0; fi;
    LYY=`printf "%.0f" $((${PRC}/2-24))`; if [ ${LYY} -le 0 ]; then LYY=0; fi;
    LCC=`printf "%.0f" $((${PRC}/2-36))`; if [ ${LCC} -le 0 ]; then LCC=0; fi;
    LGG=`printf "%.0f" $((${PRC}/2-48))`; if [ ${LGG} -le 0 ]; then LGG=0; fi;
    LRR_=""
    LYY_=""
    LCC_=""
    LGG_=""
    for (( i=1; i<=13; i++ ))
    do
    	DOTS=""; for ((ii=${i};ii<13;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LRR_="${LRR_}#"; else LRR_="${LRR_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${DOTS}${LY}............${LC}............${LG}............ ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 1 ]; then sleep .02; fi
    done
    for (( i=14; i<=25; i++ ))
    do
    	DOTS=""; for ((ii=${i};ii<25;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LYY_="${LYY_}#"; else LYY_="${LYY_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${LY}${LYY_}${DOTS}${LC}............${LG}............ ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 14 ]; then sleep .02; fi
    done
    for (( i=26; i<=37; i++ ))
    do
    	DOTS=""; for ((ii=${i};ii<37;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LCC_="${LCC_}#"; else LCC_="${LCC_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${LY}${LYY_}${LC}${LCC_}${DOTS}${LG}............ ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 26 ]; then sleep .02; fi
    done
    for (( i=38; i<=49; i++ ))
    do
    	DOTS=""; for ((ii=${i};ii<49;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LGG_="${LGG_}#"; else LGG_="${LGG_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${LY}${LYY_}${LC}${LCC_}${LG}${LGG_}${DOTS} ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 38 ]; then sleep .02; fi
    done
}

seeremotes () {
    # Check running screens
    echo "Checking running screens..."
    HOSTS=("kj_luddy_iu" "gh_luddy_iu")
    for HOST in ${HOSTS[@]}
    do
        check_screen $HOST
    done

    # Check usage
    echo "Checking disk usage..."
    HOSTS=("quartz_iu")
    for HOST in ${HOSTS[@]}
    do
        check_quota $HOST
    done
}

export seeremotes

# --- Helpers ---
check_screen () {
    if [ -z "$1" ]
    then
        echo "LOCAL"
        echo "$(screen -ls)"
    else
        echo "$1"
        echo "$(ssh -q $1 -t 'screen -ls')"
    fi
}

check_quota () {
    if [ -z "$1" ]
    then
        echo "LOCAL"
        echo "$(quota -s)"
    else
        echo "$1"
        echo "$(ssh -q $1 -t 'quota -s -u kaiserd')"
    fi
}
