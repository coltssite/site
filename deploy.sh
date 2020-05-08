#!/bin/bash
 
# If a command fails then the deploy stops
set -euo pipefail
 
PUBLIC_SITE_REPO="https://github.com/coltssite/coltssite.github.io"
PUBLIC_SITE_LOCAL_REPO="public/"
 
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"
 
# Build the project.
hugo -t hyde # if using a theme, replace with `hugo -t hyde`
 
# Go To Public folder
pushd "${PUBLIC_SITE_LOCAL_REPO}"
 
# Add changes to git.
git add .
 
# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
        msg="$*"
fi
git commit -m "$msg"
 
# Push source and build repos.
git push origin master
 
printf "\033[0;32mCompleted deploying updates to ${PUBLIC_SITE_REPO}...\033[0m\n"
 
popd
