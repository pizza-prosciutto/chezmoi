alias ls="ls --color -hal"
alias pd="pushd"
export PATH="${PATH:+${PATH}:}/home/viktor/.local/bin"

##############
# set EDITOR #
##############

if command -v nvim >/dev/null 2>&1; then
    export EDITOR="nvim"
fi

#########################
# some z-shell settings #
#########################

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # Append to history file (Default).
setopt HIST_NO_STORE         # Don't store history commands.
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

#######
# fzf #
#######

if command -v fzf >/dev/null 2>&1; then

    # enable shell integration

    . <(fzf --zsh)

    # theme from https://vitormv.github.io/fzf-themes/

    export FZF_DEFAULT_OPTS='
    --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#121212,bg+:#262626
    --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
    --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
    --color=border:#262626,label:#aeaeae,query:#d9d9d9
    --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
    --marker=">" --pointer="👉" --separator="─" --scrollbar="│"'

    # override default command -> show dirs only

    export FZF_ALT_C_COMMAND='
    find . -type d -maxdepth 1 | sort'

    # add tree preview

    export FZF_ALT_C_OPTS='
    --preview "tree -L 1 --dirsfirst -C {}"'

fi

##################
# cheat shortcut #
##################

function cheat() {
  curl --silent cheat.sh/$1 | bat
}

################
# bat settings #
################

export BAT_THEME="ansi"

################
# zoxide setup #
################

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi
