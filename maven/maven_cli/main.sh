#!/bin/bash

#eg. com.rildian.classes.MovieTest test

CLASS="$1"
SCOPE="$2"

if [ -z "$CLASS" ] || [ -z "$SCOPE" ]; then
    echo "Usage: $0 com.<packagename>.ClassName <Scope>"
    echo "e.g: $0 com.rildian.classes.MovieTest test"
    exit 1

fi

mvn -q exec:java -Dexec.mainClass="$CLASS" -Dexec.classpathScope="$SCOPE"
