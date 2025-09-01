#!/bin/bash
# This script adds a permanent alias 'll' for 'ls -la' to your ~/.bashrc file

ALIAS_NAME="ll"
ALIAS_CMD="ls -la"
BASHRC_FILE="$HOME/.bashrc"
ALIAS_DEFINITION="alias $ALIAS_NAME='$ALIAS_CMD'"

# Check if the alias is already defined in the .bashrc file
if grep -Fxq "$ALIAS_DEFINITION" "$BASHRC_FILE"; then
    echo "The alias '$ALIAS_NAME' is already defined in $BASHRC_FILE."
else
    echo "$ALIAS_DEFINITION" >> "$BASHRC_FILE"
    echo "Alias '$ALIAS_NAME' added to $BASHRC_FILE."
fi

# Reload the .bashrc file to activate the new alias immediately
source "$BASHRC_FILE"

echo "Alias '$ALIAS_NAME' is now active. You can use it in this session."
