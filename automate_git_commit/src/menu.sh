#!/bin/bash

menu() {
    intro
    usage
    read -r input

    case $input in

    1)
        add_repository
        ;;

    2)
        consult_tag
        ;;

    3)
        remove_repository
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
