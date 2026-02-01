#!/bin/bash

source ./utils.sh

main() {
    parsing "$@"

    echo "Image Dirs: ${IMAGE_DIR[*]}"
    echo "Md Dirs:    ${MD_DIR[*]}"
}

main "$@"
