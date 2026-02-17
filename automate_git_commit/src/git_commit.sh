#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: No repository path provided."
    exit 1
fi

cd "$1" || exit 1

git_commit() {
    git add . &>/dev/null
    git commit -m "up $(date)" &>/dev/null
    git push origin main &>/dev/null
}

git_commit
