#!/bin/bash

# ┌─────────────────────────────────────────────────────────────┐
# │create_overleaf_project.sh                                   │
# └─────────────────────────────────────────────────────────────┘
# Description:
#   - A script to create an Overleaf project from an existing git repository.
#   - This script will:
#     1. Checkout the `master` branch.
#     2. Add the Overleaf git repository as a remote.
#     3. Pull the `master` branch from the Overleaf repository (allowing unrelated histories).
#     4. Stage, commit, revert, and push the changes to Overleaf.
#
# Author: Indrajit Ghosh
# Created On: Jun 21, 2024
#
# Usage:
#   - Run the script with the Overleaf Git URL as the argument:
#
#     ./overleaf_project_setup.sh <OVERLEAF_GIT_URL>
#
# Example:
#   ./overleaf_project_setup.sh https://git.overleaf.com/<project-id>
#
# Important Notes:
#   - This script assumes that you have a local git repository already set up.
#   - Make sure that your local repository has the necessary git history before running.
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
#       overleaf_project_setup.sh
#
# Make sure the script is executable:
#       chmod +x overleaf_project_setup.sh
#
# ───────────────────────────────────────────────────────────────

# Check if the user has provided the OVERLEAF_GIT_URL as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <OVERLEAF_GIT_URL>"
    exit 1
fi

# Assign the argument to the OVERLEAF_GIT_URL variable
OVERLEAF_GIT_URL=$1

# Step 1: Checkout the master branch
echo "Checking out the master branch..."
git checkout master

# Step 2: Add the Overleaf remote repository
echo "Adding the Overleaf remote repository..."
git remote add overleaf $OVERLEAF_GIT_URL

# Step 3: Pull the master branch from the Overleaf remote repository, allowing unrelated histories
echo "Pulling the master branch from Overleaf, allowing unrelated histories..."
git pull overleaf master --allow-unrelated-histories

# Step 4: Stage all changes for commit
echo "Staging all changes..."
git add .

# Step 5: Commit the changes with a message
echo "Committing the changes..."
git commit -m "allowed unrelated histories"

# Step 6: Revert the latest commit
echo "Reverting the latest commit..."
git revert --mainline 1 HEAD

# Step 7: Push the changes to the Overleaf master branch
echo "Pushing the changes to Overleaf..."
git push overleaf master

echo "Script execution completed."
