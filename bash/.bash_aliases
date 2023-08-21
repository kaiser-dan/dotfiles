#!/usr/bin/env bash
###################
#     Headers     #
###################

# Default utility
# Installed utility
# Symlink navigation
# Environment management

# ======================================
###################
# Default utility #
###################
alias syncclock='sudo hwclock -s'  # sync WSL clock with Windows

alias hello=". ~/.hello"  # startup common utils
alias du='du -hs'
alias sshinit='. ~/.ssh/ssh_init'  # activate agent, add github key
alias envact='source .venv/bin/activate'  # activate python venv
alias scrls='screen -ls'  # list screens - can take additional patterns to match on

####################
# Installed utiliy #
####################
alias bat='batcat'  # improved `cat`
alias dustd='dust -D'  # improved `du`
alias lsd='lsd -1 -l --color always --permission octal --group-directories-first'  # improved `ls`
alias prompt='starship explain'
alias tmux='tmux -f ~/.config/tmux/tmux.conf'

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

