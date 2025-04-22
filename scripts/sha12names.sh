#!/bin/bash
# ┌─────────────────────────────────────────────────────────────┐
# │ sha12names.sh                                               │
# └─────────────────────────────────────────────────────────────┘
# Description:
#   - Computes the first 12 characters of the SHA256 hash
#     of each file (not directories) in the current directory.
#   - Displays the results in a nicely formatted, colorized table.
#   
# Author: Indrajit Ghosh
# Created On: Apr 22, 2025
#
# To use this script from any directory:
#   1. Place this script in a folder (e.g., ~/Documents/hello_world/HowTo/scripts)
#   2. Add that folder to your PATH by editing your ~/.bashrc or ~/.zshrc:
#
#       export PATH="$PATH:/home/indrajit/Documents/hello_world/HowTo/scripts"
#
#   3. Reload your shell config:
#
#       source ~/.bashrc   # or source ~/.zshrc
#
#   4. Now you can run the script from anywhere like:
#
#       sha12names.sh
#
# Make sure the script is executable:
#       chmod +x sha12names.sh
# ───────────────────────────────────────────────────────────────
#
#
# Colors and styles
BOLD='\033[1m'
NC='\033[0m'        # No Color
GREEN='\033[0;32m'
CYAN='\033[0;36m'
GREY='\033[0;90m'

# Header
echo -e "${BOLD}SHA256 (12-char) Filename Hash Summary${NC}"
echo -e "${GREY}Scanning files in: $(pwd)${NC}"
echo ""

# Table header
printf "${BOLD}%-40s | %-12s${NC}\n" "Filename" "Hash"
printf "%s\n" "-----------------------------------------|--------------"

# Loop through regular files only
for file in *; do
  [ -f "$file" ] || continue

  hash=$(echo -n "$file" | sha256sum | cut -c1-12)

  # Print filename and hash
  printf "${CYAN}%-40s${NC} | ${GREEN}%-12s${NC}\n" "$file" "$hash"
done
