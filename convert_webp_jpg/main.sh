#!/bin/bash

DIR=$1

if [[ ! -d $DIR ]]; then
    echo "The directory given is invalid."
    exit 1
fi

for file in "$DIR"/*.webp; do
    convert "$file" "${file%.*}.jpg" && rm "$file"
done
