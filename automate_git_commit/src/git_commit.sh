#!/bin/bash

cd "$1" || exit 1

if [ -z "$1" ]; then
    echo "Error: No repository path provided."
    exit 1
fi

git_commit() {
    git add .
    git commit -m "up $(date)" &>/dev/null
    git push origin main &>/dev/null
}

git_commit
