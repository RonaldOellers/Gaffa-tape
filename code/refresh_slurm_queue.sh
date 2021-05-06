#!/bin/bash
module load slurm
while 1>0; do
clear
squeue -o "%%.10i %.9P %.25j %.8u %.2t %.11M %.4C %.5m %.5D %R"
sleep 30s
done

