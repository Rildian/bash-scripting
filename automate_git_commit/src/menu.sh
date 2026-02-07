#!/bin/bash

intro() {

    cat <<EOF
    
    This script is to simply create a cronjob to 
    periodically commit a repository to github.
    I primarely use it on a private repository.
    You can add one or a bunch of repositories 

EOF
}

help() {

    cat <<EOF
    USAGE OF EACH OPTION: 

    1 - Given a directory and its ID, you create a cronjob 
    that schedueles to commit it with "up" as a message. 
    Addtionally, you may provide when the backup must occur.
    
    NOTE: If you provide more than one repo at once, 
    they will backup at the same time. 


    2 - Return all cronjobs with repositores schedueled. 
    
    3 - Given an ID, you can delete that line that schedueled a cronjob.
    If you do not know your ID, might as well press the option 2.

    4 - Display the usage  message that details every option and its arguments. 
    
    5 - Display the general usage of the script. 

   -1 - Closes the program.

EOF

}

usage() {

    cat <<EOF

    USAGE:

    Select one of the options provided by the menu: 
    1 - Create a cronjob to backup a repository.
    e.g: 
    --dir/-d dir1/ dir2/ -t/--tag <tag_dir1 tag_dir2 
    
    2 - Return all the jobs schedueled, it shows the 
    directory chosen and its ID 

    3 - Delete the job schedueled. 
    e.g 
    -rm/--remove <tag(s)> 
    -rm/--remove tag_dir1 tag_dir2

    4 - Display the usage  message that details every option and its arguments. 
    
    5 - Display the general usage of the script. 

   -1 - Closes the program.

EOF
}

menu() {
    intro
    usage
    read -r input

    case $input in

    1)
        add_repositories
        ;;

    2)
        consult_tags
        ;;

    3)
        remove_repositories
        ;;

    4)
        usage
        ;;

    5)
        help
        ;;

    -1)
        exit 0
        ;;

    *)
        echo "Unknown command"
        help
        ;;
    esac

}
