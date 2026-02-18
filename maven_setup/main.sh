#!/bin/bash

MAIN_ROOT="$(cd "$(dirname "$0")" && pwd)"
export MAIN_ROOT

. "$MAIN_ROOT/src/usage.sh"
. "$MAIN_ROOT/src/menu.sh"
. "$MAIN_ROOT/src/create_project.sh"
. "$MAIN_ROOT/src/add_lib.sh"
. "$MAIN_ROOT/src/utils.sh"

main() {
    menu
}

main
