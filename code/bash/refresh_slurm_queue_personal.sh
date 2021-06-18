#!/bin/bash
#Note you will have to replace the corresponding section with your cluster user name
module load slurm
while 1>0; do
clear
squeue -o "%.10i %.9P %.25j %.8u %.2t %.11M %.4C %.5m %.5D %R" -u #REPLACE_THIS_WITH_YOUR_USERNAME
sleep 30s
done