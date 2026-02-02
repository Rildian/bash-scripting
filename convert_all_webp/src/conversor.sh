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

    local PATTERN="\.(jpg|jpeg|png|tiff|tif|bmp|gif|heic|heif|webp|svg|ico|raw|arw|cr2|nef|dng)"

    for dir in "${MD_DIR[@]}"; do
        for file in "$dir"/*.md; do
            sed -i -E "s/$PATTERN/.webp/gI" "$file" &>/dev/null
        done
    done

}
