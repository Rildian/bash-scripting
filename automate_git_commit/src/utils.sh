#!/bin/bash

check_dir() {
    if [ ! -d "$1" ] || [ -z "$1" ]; then
        echo "The dir ${1} is invalid."
        exit 1
    fi
}

change_value() {
    local var="$1"

    if [ "$var" == -1 ]; then
        echo "*"
    else
        echo "$var"
    fi
}

verify_input_boundaries() {
    local cron_arr=("$@")

    local min_limits=(0 0 1 1 1)
    local max_limits=(59 23 31 12 7)

    for ((i = 0; i < SIZE; i++)); do
        val="${cron_arr[$i]}"
        min="${min_limits[$i]}"
        max="${max_limits[$i]}"

        if [ "$val" == "*" ]; then continue; fi

        if ! [[ $val =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
            echo "The value '$val' is an invalid number."
            exit 1
        fi

        if ((val < min || val > max)); then
            echo "The value '$val' is out of bounds. Must be in range ($min-$max)"
            exit 1
        fi
    done

    echo "Scheduled Cron Expression: ${cron_arr[*]}"

}
