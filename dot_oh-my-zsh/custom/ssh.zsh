if [ -n "$SSH_CONNECTION" ] && [ -z "$TMUX" ] && command -v tmux >/dev/null; then
    tmux attach-session -t main || exec tmux new-session -s main
fi
