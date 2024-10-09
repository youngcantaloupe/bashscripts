#!/bin/bash

gum style \
	--foreground 15 --border-foreground 212 \
	--align left --width 50 --margin "1 2" --padding "0 0" \
	'
    ___             ___     
   /   | __  ______/ (_)___ 
  / /| |/ / / / __  / / __ \
 / ___ / /_/ / /_/ / / /_/ /
/_/  |_\__,_/\__,_/_/\____/ 

' 

sinks=$(wpctl status | awk '/Sinks:/{flag=1; next} flag && /Sink endpoints:/{flag=0} flag && !/^[[:space:]]*│[[:space:]]*$/')

deviceNames=()
while IFS= read -r line; do
    deviceName=$(echo "$line" | sed 's/\[vol:.*//')
    deviceNames+=("$(echo "$deviceName" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')")
done <<< "$sinks"

selection=$(gum choose --height 8 "${deviceNames[@]}" --header "Select Device:") 


currDevice=$(echo "$sinks" | grep "\*|$selection" | awk '{print $2}' | sed 's/\.//')

if [ -z "$selection" ]; then
    echo "Exiting..."
    exit 1
fi

selectedSink=$(echo "$sinks" | grep "$selection" | awk '{print $2}' | sed 's/\.//')
#selectedSink=$(echo "$selectedSink" | xargs)

echo "Selected Sink: $selectedSink"

if [ -z "$selectedSink" ]; then
    echo "Error finding sink number, exiting..."
    exit 1
fi

if [ "$selectedSink" == "$currDevice" ]; then
    echo "Selected current device, exiting..."
    exit 0
fi

wpctl set-default "$selectedSink"

