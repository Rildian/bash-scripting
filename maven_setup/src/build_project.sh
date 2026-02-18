#!/bin/bash

build_project() {
    if [ -z "$dir_project" ]; then
        read -e -r -p "Type the directory of the project: " dir_project
        dir_project=$(path_conversor "$dir_project")
    else
        echo "Using current project: $dir_project"
    fi

    check_dir "$dir_project"
    cd "$dir_project" || return 1
    does_pom_exist

    echo "----------------------------------------------------"
    echo "       Compiling and Running Application            "
    echo "----------------------------------------------------"

    local main_file
    main_file=$(grep -lR "public static void main" src/main/java 2>/dev/null | head -n 1)

    if [ -z "$main_file" ]; then
        echo "Warning: No 'public static void main' found."
        echo "Running standard 'mvn package' instead..."
        mvn package
        return
    fi

    local package_name
    package_name=$(awk '/^package/ {print $2}' "$main_file" | tr -d ';')

    local class_name
    class_name=$(basename "$main_file" .java)

    local full_class="${package_name}.${class_name}"

    if mvn -q clean compile exec:java -Dexec.mainClass="$full_class"; then
        echo "Succesfully build."
    else
        echo "Build failed."
    fi
}
