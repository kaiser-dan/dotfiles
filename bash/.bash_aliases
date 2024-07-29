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
alias tls='tmux ls'  # list tmux
alias clr='clear'

####################
# Installed utility #
####################
# System tools
alias dust='dust -i'  # improved 'du'; automatically ignore hidden files
alias dustd='dust -D'  # dust; only show directories
alias erd='erd -IH'  # colorized tree with human-readable size and icons
alias erdd='erd --dirs-only'  # prettier alternative to `tree`
alias lg='lazygit'  # nice Git UI
alias rgi='rg -i'  # ripgrep, ignore case

alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'

# Navigation/prompt
alias lsd='lsd -1 --color always --group-directories-first'  # improved `ls`
alias lsdd='lsd -l --permission octal -A --total-size'  # improved `ls`
alias tree='lsd --tree'  # overload `tree` with icons and syntax highlighting from `lsd`
alias prompt='starship explain'

alias ls='lsd'  # overload 'ls' with 'lsd'

# Terminal multiplexers
alias zlj='zellij'  # terminal multiplexer

# Editors
alias nv='nvim'
alias lv='lvim'

# Other
alias lynxp='lynx -stdin'  # web browser
alias btb='bartib'

alias todo='/usr/bin/taskwarrior-tui'

##################
# Custom utility #
##################
alias hello=". ~/.hello"  # init github key, check remotes, check quotas, neofetch
alias sshinit='. ~/.ssh/ssh_init'  # activate agent, add github key

alias syncnotes_up='rsync -zaP ~/notes/ kj_luddy_iu:~/notes/'
alias syncnotes_down='rsync -zaP kj_luddy_iu:~/notes/ ~/notes/'
alias synctasks_up='rsync -zaP ~/.task/ kj_luddy_iu:.task/; rsync -zaP ~/.local/share/timewarrior/ kj_luddy_iu:.local/share/timewarrior/'
alias synctasks_down='rsync -zaP kj_luddy_iu:.task/ ~/.task/; rsync -zaP kj_luddy_iu:.local/share/timewarrior/ ~/.local/share/timewarrior/'

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
    alias tmux='~/Software/AppImages/tmux.appimage -f ~/.config/tmux/tmux.conf'
    alias nvim='~/Software/AppImages/nvim.appimage'
fi

# --- Personal machines ---
if [ "$(uname -n)" == "PICARD" ] || [ "$(uname -n)" == "JANEWAY" ] || [ "$(uname -n)" == "KIRK" ]
then
    export BROWSER=wslview
    alias cat='bat'  # improved `cat`
    alias tmux='tmux -f ~/.config/tmux/tmux.conf'
    alias syncclock='sudo hwclock -s'  # sync WSL clock with Windows
    # alias cd='z'  # zoxide fuzzy navigator
fi


if [ "$(uname -n)" == "JANEWAY" ]
then
    alias cat='batcat'
fi
