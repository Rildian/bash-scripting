#!/bin/bash

usage() {

    cat <<EOF
    
    USAGE: 

    Select one of the options:

    1: Create a Java Project. 
    You'll be asked to provide:
    
    * Where you want to create the project 
    * Name of the organization / package  
    * Name of the project 
    * Java version 

    2: Add a library on your project:
    You'll be asked to provide: 
    * Directory of the pom.xml 
    * The whole pile of code to add 
    on the pom.xml 

    3:  Display the usage 
    
    -1: Ends the program:

EOF
}
