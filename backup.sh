#!/bin/bash

#   massive with database list

arr=("test1" "test2" "test3");

#   path to backup folder
path='/var/tmp/'

function makeBackUp {

    x=0
    
    while [ $x -lt 3 ]  #   default while count
    do

        : 'Does the folder exist, check'
        
        directory="$path${arr[$x]}"
        if ! [ -d $directory ]; then    #   check directory
            echo 'Directory not found, create...'
            echo $directory
            mkdir $directory

            sleep 2s
        else
            echo 'Directory found'
            sleep 2s            
        fi

            : 'Backup of each database'

            echo 'Backup database: '${arr[$x]}

            outDate="$(date +"%d-%m-%Y_%H:%M")"

            mkdir $directory'/'$outDate

            newPath=$directory'/'$outDate
            influxd backup -portable -database ${arr[$x]} $newPath
            x=$(( $x + 1 ))
            sleep 1s
    done
}


makeBackUp
echo 'run time script(sec): '$SECONDS