#!/bin/bash

SESSIONS=$(tmux ls 2>/dev/null | cut -d: -f1)
#echo "$SESSIONS"

if [ -z "$SESSIONS" ]; then
    echo "No tmux sessions are currently running."
    exit 1
fi

SESSION=$(gum choose --height 10 $SESSIONS)

if [ "$SESSION" = "home" ]; then
    tmux has-session -t $SESSION 2>/dev/null
    
    if [ $? -eq 0 ]; then
        tmux attach-session -t $SESSION
    else
        echo "Error: tmux session '$SESSION' does not exist."
    fi
fi

if [ "$SESSION" = "c++" ]; then
    tmux has-session -t $SESSION 2>/dev/null
    
    if [ $? -eq 0 ]; then
        tmux attach-session -t $SESSION
    else
        echo "Error: tmux session '$SESSION' does not exist."
    fi
fi

if [ "$SESSION" = "python" ]; then
    tmux has-session -t $SESSION 2>/dev/null
    
    if [ $? -eq 0 ]; then
        tmux attach-session -t $SESSION
    else
        echo "Error: tmux session '$SESSION' does not exist."
    fi
fi

if [ "$SESSION" = "bash" ]; then
    tmux has-session -t $SESSION 2>/dev/null
    
    if [ $? -eq 0 ]; then
        tmux attach-session -t $SESSION
    else
        echo "Error: tmux session '$SESSION' does not exist."
    fi
fi
