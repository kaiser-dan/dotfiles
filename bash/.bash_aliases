#!/usr/bin/env bash
###################
#     Headers     #
###################

# Default utility
# Installed utility
# Custom utility
# Symlink navigation
# Environment management
# Machine-specific

# ======================================
###################
# Default utility #
###################
alias du='du -hs'
alias scrls='screen -ls'  # list screens - can take additional patterns to match on

####################
# Installed utility #
####################
alias bat='batcat'  # improved `cat`
alias dustd='dust -D'  # improved `du`
alias lsd='lsd -1 -l --color always --permission octal --group-directories-first'  # improved `ls`
alias lsdd='lsd -A --total-size'  # improved `ls`
alias prompt='starship explain'


##################
# Custom utility #
##################
alias hello=". ~/.hello"  # init github key, check remotes, check quotas, neofetch
alias sshinit='. ~/.ssh/ssh_init'  # activate agent, add github key

######################
# Symlink navigation #
######################
alias _EMB='cd ~/.symlinks/EMB'
alias _MLTMTF='cd ~/.symlinks/MLTMTF'
alias _SPIN='cd ~/.symlinks/SPIN'
alias _SNFR='cd ~/.symlinks/SNFR'

##########################
# Environment management #
##########################
alias __EMB='mamba activate EmbeddedNaive'
alias __SNFR='mamba activate WindScraper'
alias envact='source .venv/bin/activate'  # activate python venv

####################
# Machine-specific #
####################
# --- Uni machines ---
if [ "$(uname -n)" == "sagres" ]
then
    alias python='~/Software/LanguageBinaries/Python-3.10.13/python'
    alias tmux='~/Software/AppImages/tmux.appimage -f ~/.config/tmux/tmux.conf'
fi

# --- Personal machines ---
if [ "$(uname -n)" == "PICARD" ] || [ "$(uname -n)" == "JANEWAY" ] || [ "$(uname -n)" == "KIRK" ]
then
    alias tmux='tmux -f ~/.config/tmux/tmux.conf'
    alias syncclock='sudo hwclock -s'  # sync WSL clock with Windows
fi
