#!/bin/bash

MAIN_ROOT="$(cd "$(dirname "$0")" && pwd)"
export MAIN_ROOT

. "$MAIN_ROOT/src/usage.sh"
. "$MAIN_ROOT/src/menu.sh"
. "$MAIN_ROOT/src/utils.sh"
. "$MAIN_ROOT/src/git_commit.sh"
. "$MAIN_ROOT/src/cron_logic.sh"

main() {
    menu
}

main
