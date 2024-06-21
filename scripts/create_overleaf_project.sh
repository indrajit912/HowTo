#!/bin/bash
# A script to create an Overleaf Project from an existing git repo.
# Author: Indrajit Ghosh
# Created On: Jun 21, 2024
# 

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
