#!/bin/bash

MAIN_ROOT="$(cd "$(dirname "$0")" && pwd)"
export MAIN_ROOT

. "$MAIN_ROOT/src/parsing.sh"
. "$MAIN_ROOT/src/menu.sh"
. "$MAIN_ROOT/src/utils.sh"

main() {
    menu
}

main
