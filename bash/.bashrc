# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# ========================================================================
###############################
#           Headers           #
###############################
# Make use of your editor's search functionality

# History
# Window sizing
# Utility
# Prompt setup
# Package managers
# Additional setup

# ========================================================================
###########
# History #
###########
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

#################
# Window sizing #
#################
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

###########
# Utility #
###########
# --- ls ---
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Some standard options (and some extensions I dont know...)
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31'

# Media files
LS_COLORS=$LSCOLORS:'*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

# Data
## Generics
LS_COLORS=$LS_COLORS:'*.dat=01;33:*.pkl=01;32:*.txt=01;33:*.csv=01;32'

## Archives
LS_COLORS=$LS_COLORS:'*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31'

## Network data
LS_COLORS=$LS_COLORS:'*.edgelist=01;33:*.edges=01;33:*.mplx=01;33:*.rmnt=01;33'

# Documentation and notes
LS_COLORS=$LS_COLORS:'*.md=01;36:*.rst=01;36'

# Config
LS_COLORS=$LS_COLORS:'*.cfg=01;90:*.config=01;90:*.yaml=01;90:*.yml=01;90:*.toml=01;90:*requirements.txt=01;90'
LS_COLORS=$LS_COLORS:'*makefile=01;35:*Makefile=01;35:*Snakefile=01;35:*snakefile=01;35:*.smk=01;35'

# Repo specialty
LS_COLORS=$LS_COLORS:'*LICENSE=04;33:*CITATION.cff=04;33'

export LS_COLORS

# --- grep ---
if [ -x /usr/bin/dircolors ]
then
	alias grep='grep --color=always'
	alias fgrep='fgrep --color=always'
	alias egrep='egrep --color=always'
fi

# --- nvim/lvim ---
if [ "$(uname -n)" == "PICARD" ] || [ "$(uname -n)" == "JANEWAY" ] || [ "$(uname -n)" == "KIRK" ]
then
    export PATH="$PATH:/opt/nvim-linux64/bin"
fi

# --- man ---
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

################
# Prompt setup #
################
# --- Color management ---
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# --- Prompt string ---
# Default PS, overwritten by starship if available!
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    export PS1="\[\033[90m\]{\t} \[\033[32m\]\u\[\033[31m\]@\[\033[34m\]\h \[\033[37m\]:: \[\033[36m\]\W \[\033[33m\][\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')] \[\033[35m\]->\[$(tput sgr0)\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# --- Starship <3 ---
if [ -f ~/.config/starship.toml ]; then
	eval "$(starship init bash)"
fi

# --- Zoxide initialize ---
eval "$(zoxide init bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

####################
# Package managers #
####################

####################
# Additional setup #
####################
# --- Bash features ---
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# --- GCC ---
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# --- Aliases ---
# - Default aliases -
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# - Custom aliases -
# Aliases in .bash_aliases should be considered mutable per-user
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# --- Functions ---
# It is the user's responsibility to ensure saftey!
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

# --- Default programs ---
# --- XDG open ---
alias open='xdg-open'

# Default editor
export EDITOR="nvim"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/daniel/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/daniel/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<


[ -f "/home/daniel/.ghcup/env" ] && . "/home/daniel/.ghcup/env" # ghcup-env
. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/daniel/.local/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/daniel/.local/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/daniel/.local/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/daniel/.local/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/daniel/.local/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/daniel/.local/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

