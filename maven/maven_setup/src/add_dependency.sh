#!/bin/bash

add_dependency() {
    read -e -r -p "Type the directory of the project: " dir_project

    dir_project=$(path_conversor "$dir_project")
    check_dir "$dir_project"

    cd "$dir_project" || return 1

    does_pom_exist
    local pom="pom.xml"

    echo "----------------------------------------------------"
    echo "Paste your <dependency> block."
    echo "1. Paste the text."
    echo "2. Press ENTER."
    echo "3. Press Ctrl+D."
    echo "----------------------------------------------------"

    local dep_block
    dep_block=$(cat)
    dep_block=$(echo "$dep_block" | sed 's/\xc2\xa0/ /g' | tr -d '\r')

    local escaped_block
    escaped_block="${dep_block//$'\n'/\\$'\n'}"

    local last_line
    last_line=$(grep -n '</dependencies>' "$pom" | tail -1 | cut -d: -f1)

    if [[ -z "$last_line" ]]; then
        if grep -q "<dependencies/>" "$pom"; then
            echo "Found self-closing <dependencies/>. Expanding it..."
            sed -i 's|<dependencies/>|<dependencies>\n</dependencies>|' "$pom"
            last_line=$(grep -n '</dependencies>' "$pom" | tail -1 | cut -d: -f1)
        else
            echo "Error: No <dependencies> tag found in pom.xml"
            return 1
        fi
    fi

    sed -i "${last_line}i\\
$escaped_block" "$pom"

    echo "Dependency added successfully at $(pwd)!"
    echo "Building..."
    build_project
}
