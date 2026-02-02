#!/bin/bash

usage() {
    cat <<EOF

    USAGE: $0 [OPTIONS]

    This script converts all images types to webp.
    It is essential if you want your images to 
    store as few as possible.

    OPTIONS
    PARAMS:                  The param 
    -i | --images <DIR>      Directory of images 
    -m | --mdir   <DIR>      Directory of all md files  
    -h | --help              Show this help message 

    EXAMPLES:
    $0 -i ./assets -m ./notes
    $0 --images ./photos ./icons -m ./docs   
    $0 --mdir ./vault -i ./media
    $0 --mdir ./vault ./vault2 --images ./media

EOF
}

IMAGE_DIR=()
MD_DIR=()

parsing() {
    while [ ! $# -eq 0 ]; do
        case "$1" in

        -i | --images)
            shift
            while [[ "$1" != -* ]] && [[ -n "$1" ]]; do
                check_dir "$1"
                IMAGE_DIR+=("$1")
                shift
            done
            ;;

        -m | --mdir)
            shift
            while [[ "$1" != -* ]] && [[ -n "$1" ]]; do
                check_dir "$1"
                MD_DIR+=("$1")
                shift
            done
            ;;

        -h | --help)
            usage
            exit
            ;;

        *)
            usage
            exit
            ;;
        esac
    done

    if [ ${#IMAGE_DIR[@]} -eq 0 ] || [ ${#MD_DIR[@]} -eq 0 ]; then
        usage
        echo "Error: you forgot mdir and/or images dir"
        exit 1
    fi
}

check_dir() {
    if [ ! -d "$1" ] || [ -z "$1" ]; then
        echo "By the way, the directory $1 is invalid."
        exit 1
    fi
}
