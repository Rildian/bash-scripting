#!/bin/bash

source ./src/conversor.sh
source ./src/utils.sh

main() {
    parsing "$@"
    conversor
}

main "$@"
