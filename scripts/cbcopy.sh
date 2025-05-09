#!/bin/bash

# ------------------------------------------------------------------------------
# cbcopy - Cross-platform clipboard copy utility
#
# Author: Indrajit Ghosh
# Created On: May 09, 2025
#
# Description:
#   Copies the content of a given file to the system clipboard in a 
#   platform-independent way. Supports:
#     - macOS (uses pbcopy)
#     - Linux (requires xclip)
#     - Windows Git Bash (uses clip)
#
# Usage:
#   cbcopy <file_path>
#
# Example:
#   cbcopy ~/.ssh/id_ed25519.pub
#
# Notes:
#   - The script checks for the required clipboard tool and gives
#     appropriate installation guidance if missing.
#   - It removes newlines on macOS to match typical SSH key copy behavior.
# ------------------------------------------------------------------------------

# Check for argument
if [ -z "$1" ]; then
  echo "Usage: $0 <file_path>"
  exit 1
fi

FILE_PATH="$1"

# Expand ~ manually
if [[ "$FILE_PATH" == ~* ]]; then
  FILE_PATH="${FILE_PATH/#\~/$HOME}"
fi

# Check if file exists
if [ ! -f "$FILE_PATH" ]; then
  echo "Error: File not found -> $FILE_PATH"
  exit 1
fi

# Detect OS
UNAME_OUT="$(uname -s)"
case "${UNAME_OUT}" in
    Darwin*)
        # macOS
        if ! command -v pbcopy >/dev/null 2>&1; then
          echo "Error: 'pbcopy' is not installed. It should be available by default on macOS."
          exit 1
        fi
        tr -d '\n' < "$FILE_PATH" | pbcopy
        echo "✅ Copied to clipboard using pbcopy (macOS)."
        ;;
    Linux*)
        # Linux
        if command -v xclip >/dev/null 2>&1; then
            xclip -sel clip < "$FILE_PATH"
            echo "✅ Copied to clipboard using xclip (Linux)."
        else
            echo "Error: 'xclip' is not installed."
            echo "Install it with: sudo apt install xclip    # Debian/Ubuntu"
            echo "           or: sudo dnf install xclip     # Fedora"
            exit 1
        fi
        ;;
    MINGW*|MSYS*|CYGWIN*)
        # Git Bash on Windows
        if ! command -v clip >/dev/null 2>&1; then
          echo "Error: 'clip' command not found. It should be available in Git Bash or PowerShell."
          exit 1
        fi
        cat "$FILE_PATH" | clip
        echo "✅ Copied to clipboard using clip (Windows Git Bash)."
        ;;
    *)
        echo "Unsupported OS: $UNAME_OUT"
        exit 1
        ;;
esac

