#!/bin/bash

check_dir() {
    if [ ! -d "$1" ] || [ -z "$1" ]; then
        echo "The dir ${1} is invalid."
        exit 1
    fi
}

check_string() {
    if [ -z "$1" ]; then
        echo "Invalid arg: $1"
        exit 1
    fi
}
