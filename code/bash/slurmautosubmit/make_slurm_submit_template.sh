#!/bin/bash

#ask how many template files are needed
read -e -p "How many template scripts do you want to create? " num
for ((i=1;i<=$num;i++))
do 
#source where the template will be copied from (please edit this to match the location of the slurmsubmit_template.sh
cp /home/USER/Gaffa-tape/code/bash/slurmautosubmit/slurmsubmit_template.sh slurmsubmit_template-$i.sh  
done

echo "$num template scripts have been created"
