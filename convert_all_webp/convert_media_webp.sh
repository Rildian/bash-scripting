#!/bin/bash

DIR=$1

if [[ ! -d $DIR ]]; then
    echo "The directory given is invalid."
    exit 1
fi

for file in "$DIR"/*; do
    cwebp -lossless "$file" -o "${file%.*}.webp" &>/dev/null && rm "$file"
done
