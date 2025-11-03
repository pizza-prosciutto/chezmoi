#---------------------------------------------------#
# git interactive checkout with fzf branch selector #
#---------------------------------------------------#
function gsf() {
    # Check if we're inside a Git repository
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        print -P "%F{yellow}Not inside a Git repository.%f" >&2
        return 1
    fi

    # Fetch latest remote branches and clean up deleted ones
    git fetch --all --prune

    # Show local and remote branches (e.g. origin/feature-xyz), de-duplicated
    local branch
    branch=$(git for-each-ref --format='%(refname:short)' refs/heads refs/remotes/origin | sort -u | fzf)

    if [[ -n "$branch" ]]; then
        if [[ "$branch" == origin/* ]]; then
            # Strip 'origin/' prefix to get local branch name
            local local_branch="${branch#origin/}"

            # Check if the local branch already exists
            if git show-ref --verify --quiet "refs/heads/$local_branch"; then
                git switch "$local_branch"
            else
                git switch -c "$local_branch" --track "$branch"
            fi
        else
            # Local branch: switch directly
            git switch "$branch"
        fi
    fi
}
