#!/bin/bash



function checkFolder {
    if ! [ -d $directory ]; then
        echo 'No directory, create...'
        mkdir $directory
    else
        echo 'folder is ready'
    fi
}
function makeBackUp {
    arr=("test1" "test2" "test3")
    
    x=0
    while [ $x -lt 3 ]
    do
        directory="/home/kdexii/tmp/${arr[$x]}"
        if ! [ -d $directory ]; then
        echo 'No directory, create...'
        mkdir $directory
        else
            echo 'folder is ready'
        fi
        # echo "count: $x"
        echo ${arr[$x]}
        influxd backup -portable -database ${arr[$x]} $directory
        x=$(( $x + 1 ))

    done
}
# checkFolder
makeBackUp
echo 'run time script: '$SECONDS