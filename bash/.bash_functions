###################
#     Headers     #
###################

# 

# ========================================
# (De)compress given directory as gzipped tarball using `ouch`
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
seeremotes () {
    # Check running screens
    echo "Checking running screens..."
    HOSTS=("lab_luddy_iu" "kj_luddy_iu" "gh_luddy_iu")
    for HOST in ${HOSTS[@]}
    do
        check_screen $HOST
    done

    # Check usage
    echo "Checking disk usage..."
    HOSTS=("lab_luddy_iu" "quartz_iu")
    for HOST in ${HOSTS[@]}
    do
        check_quota $HOST
    done
}


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
