#!/bin/bash

cd "$1" || exit 1

git_commit() {
    git add .
    git commit -m "up $(date)" &>/dev/null
    git push origin main &>/dev/null
}

git_commit
