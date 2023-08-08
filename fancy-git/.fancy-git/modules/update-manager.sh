#!/bin/bash
#
# Author: Diogo Alexsander Cavilha <diogocavilha@gmail.com>
# Date:   12.05.2018
#
# Update manager - Check new releases and notify users about them.

FANCYGIT_CHANGELOG_FILE="$HOME/.fancy-git/CHANGELOG.md"

# ----------------------------------------------------------------------------------------------------------------------
# Update checker trigger.
# ----------------------------------------------------------------------------------------------------------------------
check_for_update() {
    if __fancygit_must_check_for_update
    then
        __fancygit_update_notification
        (__fancygit_update_checker &)
    fi
}

# ----------------------------------------------------------------------------------------------------------------------
# Notify that FancyGit needs to be updated and wait for confirmation.
# ----------------------------------------------------------------------------------------------------------------------
__fancygit_update_notification() {
    local option
    local current_version
    local new_version

    if ! __fancygit_is_git_repo || ! __fancygit_must_check_for_update
    then
        return
    fi

    if [[ ! -e ~/.fancy-git/tmpversions ]]
    then
        return
    fi

    current_version=$(grep -o '.*[:]' ~/.fancy-git/tmpversions | sed 's/://')
    new_version=$(grep -o ':.*' ~/.fancy-git/tmpversions | sed 's/://')

    echo -e "\n Hey! Fancy Git $(tput bold; tput setaf 2)$new_version$(tput sgr0) has been released!"
    echo " You're running Fancy Git $(tput bold; tput setaf 6)$current_version$(tput sgr0)"
    echo ""
    read -r -p " $(tput bold)Would you like to update it? [Y/n]: $(tput sgr0)" option
    echo ""

    case "$option" in
        "y"|"Y"|"")
            fancygit_update
            return;;
    esac

    __fancygit_reset_update_checker
}

# ----------------------------------------------------------------------------------------------------------------------
# Check if FancyGit needs to be updated by comparing current local version and current remote version.
# ----------------------------------------------------------------------------------------------------------------------
__fancygit_update_checker() {
    if ! __fancygit_is_git_repo || ! __fancygit_must_check_for_update
    then
        return
    fi

    if [[ -e ~/.fancy-git/tmpversions ]]
    then
        return
    fi

    local current_version
    local new_version

    cd ~/.fancy-git || return
    current_version=$(git tag | tail -1)

    git fetch -t 2> /dev/null
    new_version=$(git tag | tail -1)

    current_version_filter_number=${current_version//[vV\.]/}
    new_version_filter_number=${new_version//[vV\.]/}

    if [[ "$current_version_filter_number" -lt "$new_version_filter_number" ]]
    then
        echo "$current_version:$new_version" > ~/.fancy-git/tmpversions
        return
    fi

    __fancygit_reset_update_checker
}

# ----------------------------------------------------------------------------------------------------------------------
# Update the FancyGit. It performs a git pull.
# After updating, it show the changelog for the last release.
# ----------------------------------------------------------------------------------------------------------------------
fancygit_update() {
    local current_dir

    current_dir=$(pwd)

    cd ~/.fancy-git/ && git pull origin master > /dev/null 2> /dev/null

    __fancygit_create_app_config
    __fancygit_copy_style_from_mode_file_to_app_config
    __fancygit_safetly_remove_mode_file
    __fancygit_reset_update_checker

    cd "$current_dir" || return

    echo "$(tput bold; tput setaf 2) FancyGit successfully updated ;D$(tput sgr0)"
    echo ""

    fancygit_changelog_show
}

# ----------------------------------------------------------------------------------------------------------------------
# Check if current dir is a git repo.
#
# return int 0 It is a git repo.
# return int 1 It is not a git repo.
# ----------------------------------------------------------------------------------------------------------------------
__fancygit_is_git_repo() {
    local branch_name

    branch_name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if [ "$branch_name" = "" ]
    then
        return 1
    fi

    return 0
}

# ----------------------------------------------------------------------------------------------------------------------
# Update checker handler.
# If it has already checked for updates today, then it may wait for the next day to check again.
#
# return int 0 It must check for updates.
# return int 1 It must not check for updates.
# ----------------------------------------------------------------------------------------------------------------------
__fancygit_must_check_for_update() {
    local current_date
    local last_update_at

    last_update_at=$(cat ~/.fancy-git/last_update_at 2> /dev/null)
    current_date=$(date +%Y-%m-%d)

    if [ "$current_date" = "$last_update_at" ]
    then
        return 1
    fi

    return 0
}

# ----------------------------------------------------------------------------------------------------------------------
# Create the app configuration file.
# ----------------------------------------------------------------------------------------------------------------------
__fancygit_create_app_config() {
    if [ ! -f ~/.fancy-git/app_config ]
    then
        touch -f ~/.fancy-git/app_config
        cat ~/.fancy-git/app_config_sample > ~/.fancy-git/app_config
    fi
}

# ----------------------------------------------------------------------------------------------------------------------
# DEPRECATED
# Auxiliar function to help on version compatibility.
# ----------------------------------------------------------------------------------------------------------------------
__fancygit_copy_style_from_mode_file_to_app_config() {
    if [ -f ~/.fancy-git/mode ] && [ -f ~/.fancy-git/app_config ]
    then
        local style
        style=$(cat ~/.fancy-git/mode)
        sed -i "s#style:.*#style:${style}#" ~/.fancy-git/app_config
    fi
}

# ----------------------------------------------------------------------------------------------------------------------
# DEPRECATED
# Auxiliar function to help on version compatibility.
# ----------------------------------------------------------------------------------------------------------------------
__fancygit_safetly_remove_mode_file() {
    local app_config_file_status

    app_config_file_status=$(grep -io 'fresh_file' < ~/.fancy-git/app_config)

    if [ "$app_config_file_status" = "fresh_file" ]
    then
        sed -i '/fresh_file/d' ~/.fancy-git/app_config
        rm -f mode
    fi
}

# ----------------------------------------------------------------------------------------------------------------------
# Mark update checker as executed today.
# It controls if it has been called already.
# ----------------------------------------------------------------------------------------------------------------------
__fancygit_reset_update_checker() {
    local current_date

    current_date=$(date +%Y-%m-%d)

    echo "$current_date" > ~/.fancy-git/last_update_at

    rm ~/.fancy-git/tmpversions 2> /dev/null
}

# ----------------------------------------------------------------------------------------------------------------------
# Show changelog content for the last version.
# ----------------------------------------------------------------------------------------------------------------------
fancygit_changelog_show() {
    sed '0,/##/! s/## //g' "$FANCYGIT_CHANGELOG_FILE" \
        | sed '/^v/q' \
        | sed '/^v/d' \
        | sed 's/^##/ Version:/' \
        | sed '1,4d' \
        | sed 's/-/ -/'
}