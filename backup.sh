#!/bin/bash


#   massive with database list
arr=("test1" "test2" "test3")

#   inactive function, but may come in handy
function checkFolder {
    if ! [ -d $directory ]; then #  check directory
        echo 'Directory not found, create...'
        mkdir $directory #  if not = create
    else
        echo 'folder is ready' #    or the folder exists
    fi
}

function makeBackUp {

    x=0
    
    while [ $x -lt 3 ]  #   default while count
    do
        directory="/home/kdexii/tmp/${arr[$x]}"
        if ! [ -d $directory ]; then    #   check directory
            echo 'Directory not found, create...'
            mkdir $directory # if not = create
            sleep 2s
        else
            echo 'Directory found' # or the folder exists
            sleep 2s
        fi
        # echo "count: $x"
            # echo ${arr[$x]}
            echo 'Backup database: '${arr[$x]}
            influxd backup -portable -database ${arr[$x]} $directory
            x=$(( $x + 1 ))
            sleep 1s
    done
}
# checkFolder
makeBackUp
echo 'run time script(sec): '$SECONDS