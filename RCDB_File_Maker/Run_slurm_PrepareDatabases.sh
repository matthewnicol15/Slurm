#!/bin/bash
ScriptDir="/home/matthewn/Documents/Macros/Slurm/RCDB_File_Maker/RGA_Spring19_Inbending"
cd $ScriptDir

for NUMBER in `seq $1 $2`;

do

sbatch slurm_PrepareDatabases_$NUMBER.sh

sleep 2

done
