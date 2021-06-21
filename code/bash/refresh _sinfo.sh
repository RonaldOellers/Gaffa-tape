#!/bin/bash
module load slurm
while 1>0; do
clear
sinfo -o "%.9n %.9P %.13C %.8O %.7m %.7e"
sleep 30s
done