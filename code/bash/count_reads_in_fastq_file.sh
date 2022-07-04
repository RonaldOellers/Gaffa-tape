#!/bin/bash
#This script can give you the number of reads in your .fastq.gz files either for all of them in a folder or for a single one that you specify

input=$1

if [ -d $input ]
then
    for file in $(ls $input)
    do
        if [[ $file == *.fastq.gz ]]
        then
            linecount=`zcat $input/$file | wc -l`
            readnumber=$(($linecount/4))
            echo "${file} contains ${readnumber} reads"
        fi
    done

elif [ -f $input ]
then
    if [[ $input == *.fastq.gz ]]
    then
        linecount=`zcat $input | wc -l`
        readnumber=$(($linecount/4))
        echo "${input} contains ${readnumber} reads"
    fi
fi
