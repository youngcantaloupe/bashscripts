#!/bin/bash
SESSION=$(gum choose --height 10 "home" "c++" "python" "bash")

if [ "$SESSION" = "home" ]; then
    tmux has-session -t $SESSION 2>/dev/null
    if [ $? != 0 ]; then
        cd ~
        tmux new-session -ds $SESSION
        tmux rename-window -t $SESSION:1 terminal
    fi
tmux attach -t $SESSION
fi

if [ "$SESSION" = "c++" ]; then
    tmux has-session -t $SESSION 2>/dev/null
    if [ $? != 0 ]; then
        cd ~/Projects/C++
        tmux new-session -ds $SESSION
        tmux rename-window -t $SESSION:1 vim
        tmux split-window -h -l '95%' -t $SESSION:1
        tmux new-window -t $SESSION:2 -c ~/Notes/Coding/C++
        tmux rename-window -t $SESSION:2 notes
        tmux select-window -t $SESSION:2
        tmux select-window -t $SESSION:1

    fi
tmux attach -t $SESSION
fi

if [ "$SESSION" = "python" ]; then
    tmux has-session -t $SESSION 2>/dev/null
    if [ $? != 0 ]; then
        cd ~/Projects/Python
        tmux new-session -ds $SESSION
        tmux rename-window -t $SESSION:1 vim
        tmux split-window -h -l '95%' -t $SESSION:1
        tmux new-window -t $SESSION:2 -c ~/Notes/Coding/Python
        tmux rename-window -t $SESSION:2 notes
        tmux select-window -t $SESSION:2
        tmux select-window -t $SESSION:1
    fi
tmux attach -t $SESSION
fi

if [ "$SESSION" = "bash" ]; then
    tmux has-session -t $SESSION 2>/dev/null
    if [ $? != 0 ]; then
        cd ~/Projects/Bash
        tmux new-session -ds $SESSION
        tmux rename-window -t $SESSION:1 vim
        tmux split-window -h -l '95%' -t $SESSION:1
        tmux new-window -t $SESSION:2 -c ~/Notes/Coding/Bash
        tmux rename-window -t $SESSION:2 notes
        tmux select-window -t $SESSION:2
        tmux select-window -t $SESSION:1
    fi
tmux attach -t $SESSION
fi
