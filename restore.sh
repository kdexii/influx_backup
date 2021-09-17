#!/bin/bash

function restoreBackUp {
    arr=("test1" "test2" "test3")
    
    x=0
    while [ $x -lt 3 ]
    do
        directory="/home/kdexii/tmp/${arr[$x]}"
        # echo "count: $x"
        # echo ${arr[$x]}
        # influxd backup -portable -database ${arr[$x]} $directory
        influxd restore -portable -db ${arr[$x]} -newdb ${arr[$x]} /home/kdexii/tmp/${arr[$x]}
        x=$(( $x + 1 ))

    done
}
restoreBackUp