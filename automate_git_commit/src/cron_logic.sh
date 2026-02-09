#!/bin/bash

add_repository() {

    DIR=()
    read -e -r -p "Path(s) to repository: " -a raw_dir
    read -r -p "Tag(s) to repository: " -a TAG

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
    local curr_cron=$(crontab -l 2>/dev/null || true)

    for tag in "${TAG[@]}"; do
        pattern="# TAG: $tag$"
        if echo "$curr_cron" | grep -q "$pattern"; then
            echo "The tag ${tag} already exists."
            exit 1
        fi
    done

    for sch in "${!DIR[@]}"; do
        cron_scheduele "${DIR[sch]}" "${TAG[sch]}"
    done
}

consult_tag() {

    clear
    echo "Repositories scheduled:"
    local curr_cron=$(crontab -l 2>/dev/null || true)
    local pattern="# TAG:"
    echo "$curr_cron" | grep -e "$pattern"
}

remove_repository() {

    local tag
    local curr_cron=$(crontab -l 2>/dev/null || true)
    echo "Type the tag of the repository you want to remove:"
    read -r tag

    if ! echo "$curr_cron" | grep -q "$tag"; then
        echo "This tag does not exist."
        exit 1
    fi

    echo "$curr_cron" | grep -v "# TAG: $tag$" | crontab -
    echo "Repository with tag '$tag' removed."
}

cron_scheduele() {

    local dir="$1"
    local tag="$2"
    SIZE=5

    cron_help
    echo "Schedule the repo ${dir} w/ the tag ${tag}"
    echo "ARGS:          MIN  HOUR  DOM   MONTH DOW"
    echo "BOUNDARIES: (0-59, 0-23, 1-31, 1-12, 0-6)"
    read -r -a cron_arr

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
