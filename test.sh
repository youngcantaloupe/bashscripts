#!/bin/bash
#gum input --placeholder "Text here" > test.txt
#txt overwritten every execution

# choose action: fetch, pull, status, commit, abort
# confirm action, perform action, error checking
#
# how to ececute from anywhere: aliases
# log file with summary? redundant w/ version history
# error log helpful with rebase and merge




echo "Choose action" 
CHOICE=$(gum choose --height 10 "Status" "Push" "Pull")
#echo $CHOICE

if [ $CHOICE = "Status"]; then
    echo "Choose repo"

STATUS=$(gum choose --height 10 "Notes" "C++")
if [ $STATUS = "Notes" ]; then
    gum confirm "get status?" && git -C /home/kakashi/Notes status 
    #echo `git -C /home/kakashi/Notes status`
elif [ $STATUS = "C++" ]; then
    echo `git -C /home/kakashi/Projects/C++ status`
fi


# echo "Pick a card, any card..."
# CARD=$(gum choose --height 15 {{A,K,Q,J},{10..2}}" "{♠,♥,♣,♦})
# echo "Was your card the $CARD?"

#gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change"
#gum write --placeholder "Details of this change"
#gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
