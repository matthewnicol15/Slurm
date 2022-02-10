#!/bin/bash

for NUMBER in `seq 5032 5419`;

do

sbatch slurm_FTOF_$NUMBER.sh

sleep 30

done
