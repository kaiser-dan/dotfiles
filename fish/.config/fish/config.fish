if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Starship prompt string
starship init fish | source

# Zoxide fuzzy file navigator
zoxide init fish | source
