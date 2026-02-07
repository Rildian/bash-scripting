#!/bin/bash

add_repositories() {

    DIR=()
    read -e -p "Path(s) to repository: " -a raw_dir
    read -p "Tag(s) to repository " -a TAG

    for path in "${raw_dir[@]}"; do
        expanded_path="${path/#\~/$HOME}"
        check_dir "${expanded_path}"
        DIR+=("$expanded_path")
    done

    if [ "${#DIR[@]}" -ne "${#TAG[@]}" ]; then
        echo "The amount of directory and tags must be the same. They are not."
        echo "Directories found: ${#DIR[@]}"
        echo "Tags found: ${#TAG[@]}"
        exit 1
    fi

    CRONTAB=$(crontab -l 2>/dev/null || true)

    for tag in "${TAGS[@]}"; do
        if grep -q "# TAG:$tag$" <<<"$(CRONTAB)"; then
            echo "The tag $(tag) already exists."
            exit 1
        fi
    done

    for sch in "${!DIR[@]}"; do
        schedule_repo "${DIR[sch]}" "${TAG[sch]}"
    done

    # after that, ask the scheduele to each dir. And actually, must write the push.sh
    # MAKE A FOOR LOOP TO VERIFY IF A TAG EXISTS IN CRONTAB}

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
