#!/bin/bash
#This script can give you the number of reads in your .fastq.gz files either for all of them in a folder or for a single one that you specify

input=$1

if [ -d $input ]
then
    for file in $(ls $input)
    do
        if [[ $file == *.fastq.gz ]]
        then
            readnumber=echo $(zcat $input/$file | wc -l)/4|bc
            echo "${file} contains ${readnumber} reads"
        fi
    done

elif [ -f $input ]
then
    if [[ $input == *.fastq.gz ]]
    then
        readnumber=echo $(zcat $input |  wc -l)/4|bc
        echo "${input} contains ${readnumber} reads"
    fi
fi
