#!/bin/bash

menu() {
    usage

    read -r input

    case $input in
    1)
        create_project
        exit 0
        ;;
    2)
        add_dependency
        exit 0
        ;;

    3)
        usage
        exit 0
        ;;

    4)
        delete_project
        exit 0
        ;;

    -1)
        exit 0
        ;;

    *)
        echo "Unknow
        command."
        usage
        exit 0
        ;;
    esac
}
