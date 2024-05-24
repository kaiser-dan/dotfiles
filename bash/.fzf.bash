# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kaiserd/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/kaiserd/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/kaiserd/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/kaiserd/.fzf/shell/key-bindings.bash"
