#!/bin/bash
ScriptDir="/volatile/clas12/matthewn/Slurm/Tree_Maker/Strange_Tree_RGB_Spring19_Inbending_290622"
cd $ScriptDir

for NUMBER in `seq $1 $2`;

do

sbatch slurm_Tree_Maker_$NUMBER.sh

sleep 20

done
