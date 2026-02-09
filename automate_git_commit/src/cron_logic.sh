#!/bin/bash

cron_scheduele() {
    local dir="$1"
    local tag="$2"
    SIZE=5

    cron_help
    echo "Scheduele the repo $(dir) w/ the tag ${tag}"
    echo "ARGS:         MIN  HOUR  DOM   MONTH DOW"
    echo "BOUNDARIES: (0-59, 0-23, 1-31, 1-12, 1-7"
    read -r -p "Provide the 5 args: " -a cron_arr

    if [ "${#cron_arr[@]}" -ne "$SIZE" ]; then
        echo "You must provide exactly 5 arguments"
        exit 1
    fi

    for ((i = 0; i < "$SIZE"; i++)); do
        cron_arr[i]=$(change_value "${cron_arr[i]}")
    done

    verify_input_boundaries "${cron_arr[@]}"
    local new_job="${cron_arr[*]} ${MAIN_ROOT}/src/git_commit.sh \"$dir\" # TAG: $tag"

    (
        crontab -l 2>/dev/null
        echo "$new_job"
    ) | crontab -
}

add_repositories() {

    DIR=()
    read -e -r -p "Path(s) to repository: " -a raw_dir
    read -r -p "Tag(s) to repository " -a TAG

    for path in "${raw_dir[@]}"; do
        expanded_path="${path/#\~/$HOME}"
        check_dir "${expanded_path}"
        full_path=$(realpath "$expanded_path")
        DIR+=("$full_path")
    done

    if [ "${#DIR[@]}" -ne "${#TAG[@]}" ]; then
        echo "The amount of directory and tags must be the same. They are not."
        echo "Directories found: ${#DIR[@]}"
        echo "Tags found: ${#TAG[@]}"
        exit 1
    fi

    clear
    CRONTAB=$(crontab -l 2>/dev/null || true)

    for tag in "${TAG[@]}"; do
        pattern="# TAG: $tag$"
        if echo "$CRONTAB" | grep -q "$pattern"; then
            echo "The tag ${tag} already exists."
            exit 1
        fi
    done

    for sch in "${!DIR[@]}"; do
        cron_scheduele "${DIR[sch]}" "${TAG[sch]}"
    done

}

remove_directories() {
    # OPTION 3
    # RECEIVES TAGS
    # VERIFIES IF THE TAG EXISTS
    # REMOVE THE TAGS
    exit 0
}

consult_tags() {
    # OPTION 2
    # RETURN ALL REPOSITORIES SCHEDUELED
    exit 0
}
