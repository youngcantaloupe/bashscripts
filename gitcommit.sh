#!/bin/bash
# git commit -m "$(gum input --width 50 --placeholder "Summary of changes")"
#            -m "$(gum write --width 80 --placeholder "Details of changes")"
echo "Choose Repo"
REPO=$(gum choose --height 10 "Notes" "C++" "Python")

echo "Choose Action"
CHOICE=$(gum choose --height 10 "Status" "Commit" "Push" "Pull")

if [ $CHOICE = "Status" ]; then
    if [ $REPO = "Notes" ]; then
        gum confirm "get status?" && git -C /home/kakashi/Notes status
    elif [ $REPO = "C++" ]; then
        gum confirm "get status?" && git -C /home/kakashi/Projects/C++ status
    elif [ $REPO = "Python" ]; then
        gum confirm "get status?" && git -C /home/kakashi/Projects/Python status
    fi
fi
if [ $CHOICE = "Commit" ]; then
    if [ $REPO = "Notes" ]; then
    elif [ $REPO = "C++" ]; then
    elif [ $REPO = "Python" ]; then
    fi
fi
