#!/bin/bash

check_dir() {
    if [ ! -d "$1" ] || [ -z "$1" ]; then
        echo "The project ${1} is invalid."
        exit 1
    fi
}

check_string() {
    if [ -z "$1" ]; then
        echo "Invalid arg: $1"
        exit 1
    fi
}

path_conversor() {
    dir_received="$1"
    dir_received="${dir_received/#\~/$HOME}"
    check_dir "$dir_received"

    echo "$dir_received"
}

delete_project() {
    read -e -r -p "Type the project to remove: " project_to_remove

    project_to_remove=$(path_conversor "$project_to_remove")

    if [[ "$project_to_remove" == "$HOME" ]] || [[ "$project_to_remove" == "/" ]]; then
        echo "CRITICAL ERROR: You are trying to delete your Home or Root directory!"
        return 1
    fi

    echo "You're going to remove $project_to_remove, ok?"
    read -r -p "y/N: " answer
    answer="${answer,,}"
    if [ "$answer" == "y" ]; then
        rm -rf "$project_to_remove"
    elif [ "$answer" == "n" ]; then
        echo "okay. Cancelled."
        exit 0
    else
        echo "Invalid answer."
        exit 1
    fi

}

does_pom_exist() {
    POM="pom.xml"

    if [ ! -e "$POM" ]; then
        echo "pom.xml does not exists on this directory."
        exit 1
    fi
}
