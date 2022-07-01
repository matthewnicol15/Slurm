#!/bin/bash
ScriptDir="/home/matthewn/Documents/Macros/Slurm/FTOF/RGF_Summer20_Inbending"
cd $ScriptDir

for NUMBER in `seq $1 $2`;

do

sbatch slurm_FTOF_$NUMBER.sh

sleep 4

done
