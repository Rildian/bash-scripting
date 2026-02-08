#!/bin/bash

git_commit() {
    git add .
    git commit -m "up $(date)"
    git push origin main &>/dev/null
}
