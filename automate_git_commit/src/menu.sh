#!/bin/bash

menu() {
    intro
    usage
    read -r input

    case $input in

    1)
        add_repositories
        ;;

    2)
        consult_tags
        ;;

    3)
        remove_repositories
        ;;

    4)
        usage
        ;;

    -1)
        exit 0
        ;;

    *)
        echo "Unknown command"
        help
        ;;
    esac
}
