#!/bin/bash

intro() {

    cat <<EOF
    
    This script is to simply create a cronjob to 
    periodically commit a repository to github.
    I primarely use it on a private repository.
    You can add one or a bunch of repositories 

EOF
}

usage() {

    cat <<EOF

    USAGE:

    Select one of the options provided by the menu: 

    1 - Create a cronjob to backup a repository.
    Provide one or more repositories and tags 
    to each repository.
   
    
    2 - Return all the repositories schedueled. 

    3 - Delete the repository schedueled by providing its tag.
    
    4 - Display the general usage of the script. 

   -1 - Closes the program.

EOF
}

cron_help() {
    cat <<EOF
    
    USAGE: 
        * * * * * 
      # | | | | |
      # | | | | day of the week (0–6) (Sunday to Saturday); 
      # | | | month (1–12)             
      # | | day of the month (1–31)
      # | hour (0–23)
      # minute (0–59)
        

      If you don't want to specify some argument,
      hit -1 or *. It'll be "*" by default. But you must provide all the 5 arguments. 
      Left to right (minute to day)
    
EOF
}
