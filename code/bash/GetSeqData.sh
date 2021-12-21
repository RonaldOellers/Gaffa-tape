#!/bin/bash
# make static variables
emptystring=""
fastq="./FASTQs/"
# Ask user input for cores per job and RAM per cores as well as user to monitor and how many jobs should be used
read -e -p "Input Files Parent directory: " input
read -e -p "Directory to link input to:" output
mkdir -p $output/FASTQs/
echo "------------------------------------------------------------------------"
echo "Parent Data Dir: $input"
echo "Link to: $output"
echo "------------------------------------------------------------------------"

files=`find $input | egrep *fastq.gz | awk '!/optical_duplicates/'`

for file in $files
	do
 		echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
		ln -s $file* $output/FASTQs/
		echo "Linking $file to $output/FASTQs"	
	done

# Write all file names into .txt file for your convenience
find $output/FASTQs/ | sed 's/.\/FASTQs\///g' | sed '/^[[:space:]]*$/d' > $output/FASTQ_names.txt
