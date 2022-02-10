#!/bin/bash

for NUMBER in `seq 10 69`;

do

sbatch slurm_d_pip_pim_PID$NUMBER.sh

sleep 30

done
