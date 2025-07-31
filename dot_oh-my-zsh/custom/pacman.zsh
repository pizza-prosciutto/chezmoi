alias update='sudo pacman -Syu'                 # Full system update
alias up='update'                               # Shorter alias for update
alias install='sudo pacman -S'                  # Install a package
alias remove='sudo pacman -R'                   # Remove a package
alias purge='sudo pacman -Rns'                  # Remove with dependencies and configs
alias search='pacman -Ss'                       # Search for a package in repos
alias list='pacman -Qs'                         # List installed packages matching string
alias info='pacman -Si'                         # Show info for a package
alias owns='pacman -Qo'                         # Find which package owns a file
alias files='pacman -Ql'                        # List files installed by a package
alias clean='sudo pacman -Rns $(pacman -Qtdq 2>/dev/null || echo "")'   # Remove orphaned packages

function pachelp() {
    local aliases=(
        update
        up
        install
        remove
        purge
        search
        list
        info
        owns
        files
        clean
    )
    for alias_name in "${aliases[@]}"; do
        if alias "$alias_name" &>/dev/null; then
            alias "$alias_name"
        else
            print -P "%F{yellow}alias $alias_name not found%f"
        fi
    done
}
