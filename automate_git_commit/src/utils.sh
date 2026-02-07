#!/bin/bash

check_dir() {
    if [ ! -d "$1" ] || [ -z "$1" ]; then
        echo "The dir ${1} is invalid."
        exit 1
    fi
}

schedule_repo() {
    DIR="$1"
    TAG="$2"

    echo "You are schedueling the scheduling the ${DIR} with the tag ${TAG} correct?"
}
