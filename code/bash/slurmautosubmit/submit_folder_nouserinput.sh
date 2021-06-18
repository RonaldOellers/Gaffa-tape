#!/bin/bash

folder=$(pwd)
logdir=$folder/logs

mkdir -p ./logs/

echo "Folder: $folder"
echo "logs: $logdir"

module load slurm
#cd $folder
files=`ls *.sh`

for file in $files
do
	echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
	fn=`basename $file .sh`
	SlurmEasy -t 20 -m 10G -l $logdir -n $fn -k -v -x deep12,deep17 "bash $folder/$file"
	echo "Submitted $file to Slurm queue"
done

echo 'all scripts submitted'
