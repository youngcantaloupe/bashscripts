#!/usr/bin/env bash

# Default source directory
SRC_DIR="${1:-$HOME/Projects/Bash}"
DEST_DIR="$HOME/.local/bin"

echo "Converting .sh scripts from: $SRC_DIR"
echo "Target destination: $DEST_DIR"
echo

# Check if source directory exists
if [[ ! -d "$SRC_DIR" ]]; then
    echo "Source directory does not exist: $SRC_DIR"
    exit 1
fi

# Make sure the destination exists
mkdir -p "$DEST_DIR"

# Loop through .sh files
for file in "$SRC_DIR"/*.sh; do
    [[ -e "$file" ]] || { echo "No .sh files found."; exit 0; }

    # Get filename without path or extension
    filename="$(basename "$file" .sh)"
    target="$DEST_DIR/$filename"

    # Copy (or move) file and make executable
    cp "$file" "$target"
    chmod +x "$target"

    echo "→ Installed: $filename"
done

echo
echo "✅ All .sh scripts converted and placed in $DEST_DIR"

