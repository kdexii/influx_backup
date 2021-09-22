#!/bin/bash

#   folder from which we want to restore 
path='/20-09-2021_10:46'
#   list database
arr=("test1" "test2" "test3")

: 'Doing a restore from a folder'

mainPath='/var/tmp/'
function restoreBackUp {
    
    x=0

    while [ $x -lt 3 ]
    do
        directory="$mainPath${arr[$x]}"

        newPath=$directory$path

        echo $newPath

        influxd restore -portable -db ${arr[$x]} $newPath
        x=$(( $x + 1 ))

    done
}
restoreBackUp