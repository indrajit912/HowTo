#!/bin/sh

###############################################################################
# Script to append a directory to the PATH environment variable
# in a user's shell configuration file (.bash_profile or .bashrc).
#
# Author: Indrajit Ghosh
# Created On: May 09, 2025
#
# Usage:
#   ./add_to_path.sh /your/directory/path
#
# The script checks for the existence of ~/.bash_profile or ~/.bashrc and
# appends the line:
#   export PATH="$PATH:/your/directory/path"
# if it's not already present. It supports macOS and most Linux distributions.
###############################################################################

# Exit on error
set -e

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/directory"
  exit 1
fi

DIR_TO_ADD=$1

# Check if directory exists
if [ ! -d "$DIR_TO_ADD" ]; then
  echo "Error: Directory '$DIR_TO_ADD' does not exist."
  exit 1
fi

# Determine appropriate shell profile file
if [ -f "$HOME/.bash_profile" ]; then
  PROFILE_FILE="$HOME/.bash_profile"
elif [ -f "$HOME/.bashrc" ]; then
  PROFILE_FILE="$HOME/.bashrc"
else
  # Default to .bash_profile if neither exists
  PROFILE_FILE="$HOME/.bash_profile"
  touch "$PROFILE_FILE"
fi

EXPORT_LINE="export PATH=\"\$PATH:$DIR_TO_ADD\""

# Check if the line is already in the file
if grep -Fxq "$EXPORT_LINE" "$PROFILE_FILE"; then
  echo "PATH already contains '$DIR_TO_ADD' in $PROFILE_FILE"
else
  echo "$EXPORT_LINE" >> "$PROFILE_FILE"
  echo "Added '$DIR_TO_ADD' to PATH in $PROFILE_FILE"
fi

