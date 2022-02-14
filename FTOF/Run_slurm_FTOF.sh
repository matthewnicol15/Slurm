#!/bin/bash
ScriptDir="/home/matthewn/Documents/Macros/Slurm/FTOF/RGA_Fall18_Outbending"
cd $ScriptDir

for NUMBER in `seq 5422 5666`;

do

sbatch slurm_FTOF_$NUMBER.sh

sleep 15

done
