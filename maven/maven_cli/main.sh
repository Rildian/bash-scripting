#!/bin/bash

CLASS="$1"

if [ -z "$CLASS" ]; then
    echo "Usage: $0 com.<packagename>.ClassName [Scope]"
    echo "e.g: $0 com.rildian.classes.MovieTest test"
    echo "Note: Scope is optional. Defaults to 'compile' (or 'test' if class ends in 'Test')."
    exit 1
fi

if [ -n "$2" ]; then
    SCOPE="$2"
elif [[ "$CLASS" == *Test ]]; then
    SCOPE="test"
else
    SCOPE="compile"
fi

if [ "$SCOPE" == "test" ]; then
    mvn -q test-compile
else
    mvn -q compile
fi

mvn -q exec:java -Dexec.mainClass="$CLASS" -Dexec.classpathScope="$SCOPE"
