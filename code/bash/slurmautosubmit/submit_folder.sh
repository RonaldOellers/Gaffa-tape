#!/bin/bash
#code modified from:https://github.com/TobiasHohl/WD40
# Read current directory and make logdir if missing
folder=$(pwd)
logdir=$folder/logs
mkdir -p ./logs/
echo "------------------------------------------------------------------------"
echo "Folder: $folder"
echo "logs: $logdir"
echo "------------------------------------------------------------------------"
#make default variable variables
USER="oellers"
EXNODES="deep12,deep17"

# Ask user input for cores per job and RAM per cores as well as user to monitor and how many jobs should be used
read -e -p "Cores per job: " cores
read -e -p "RAM per core (write 6G for 6 gigabytes per core): " RAM
read -e -p "How many jobs in parallel: " JOBS
read -e -p "which user to monitor (necessary if restricting jobs): " USER
read -e -p "do you want to exclude certain nodes? (Y/N): " -r EXCLN
if [[ $EXCLN =~ ^[Yy]$ ]]
then
	echo $EXCLN
	read -e -p "Which nodes to exclude? (provide a comma serperated list e.g. deep12,deep17): " EXNODES
fi
 
#configure variables
if (($JOBS==0))
then
	jobsout="unlimited"
else
	jobsout=$JOBS
fi

#output configuration
echo "-----------------------Configuration Section---------------------------"
echo "A maximum of $jobsout Jobs will be submitted with $cores cores and $RAM RAM per core per job."
echo "The following nodes will be excluded: $EXNODES"
read -e -p "Confirm submission to slurm que? (Y/N): " -r START
if [[ $START =~ ^[Yy]$ ]]
then
	echo "Thank you $USER for using Gaffa-tape"
	echo "------------------------------------------------------------------------"
	#starting slurm submission
	# Load slurm module and list all bash scripts in directory
	module load slurm
	files=`ls *.sh`

	# Test if there is a job limitation and within that limit submit all bash scripts to slurm 	queue
	for file in $files
	do
		if [[ $JOBS -gt 0 ]]
		then
			currentjobs=`squeue -u $USER | wc -l`
			currentjobs=`expr $currentjobs - 1`
			if [[ $currentjobs -ge $JOBS ]]
			then
				echo "Maximum number of jobs reached! Pausing Submission of jobs"
			fi
			while [[ $currentjobs -ge $JOBS ]]
			do
				currentjobs=`squeue -u $USER | wc -l`
				currentjobs=`expr $currentjobs - 1`
				sleep 1m
			done
		fi
 		echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
		fn=`basename $file .sh`
		SlurmEasy -t $cores -m $RAM -l $logdir -n $fn -k -v -x $EXNODES "bash $folder/$file"
		echo "Submitted $file to Slurm queue"
	done

	# Finisher
	echo "------------------------------------------------------------------------"
	echo 'All scripts submitted.'
else
	echo "Aborting submission"
	echo "Thank you $USER for using Gaffa-tape"
	echo "------------------------------------------------------------------------"
	rm -r $logdir
fi
