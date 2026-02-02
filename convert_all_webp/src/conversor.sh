#!/bin/bash

conversor() {

    md_modifier
    image_conversor
}

image_conversor() {

    for dir in "${IMAGE_DIR[@]}"; do
        for file in "$dir"/*; do
            cwebp -lossless "$file" -o "${file%.*}.webp" &>/dev/null && rm "$file"
        done
    done
}

md_modifier() {
    echo "MD DIRECTORY (conversor): ${MD_DIR[*]}"
}
