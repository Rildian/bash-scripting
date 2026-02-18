#!/bin/bash

create_project() {

    read -e -r -p "Directory: " dir
    dir="${dir/#\~/$HOME}"
    check_dir "$dir"

    read -r -p "Organization/Package Name: " org_name
    check_string "$org_name"

    read -r -p "Project Name: " project_name
    check_string "$project_name"

    read -r -p "Java Version " java_version
    check_string "$java_version"

    cd "$dir" || exit 1

    mvn -q archetype:generate \
        -DgroupId="com.$org_name" \
        -DartifactId="$project_name" \
        -DarchetypeArtifactId=maven-archetype-quickstart \
        -DarchetypeVersion=1.5 \
        -DinteractiveMode=false

    cd "$project_name" || exit 1

    sed -i "s|<maven.compiler.release>.*</maven.compiler.release>|<maven.compiler.release>${java_version}</maven.compiler.release>|" pom.xml
    sed -i "s|<maven.compiler.source>.*</maven.compiler.source>|<maven.compiler.source>${java_version}</maven.compiler.source>|" pom.xml
    sed -i "s|<maven.compiler.target>.*</maven.compiler.target>|<maven.compiler.target>${java_version}</maven.compiler.target>|" pom.xml

}
