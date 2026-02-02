#!/bin/bash

source ./src/conversor.sh
source ./src/parsing.sh

main() {
    parsing "$@"
    conversor
}

main "$@"
