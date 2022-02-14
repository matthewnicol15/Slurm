#!/bin/bash
ScriptDir="/home/matthewn/Documents/Macros/Slurm/FTOF/RGA_Fall18_Outbending"
cd $ScriptDir

for NUMBER in `seq 5422 5666`;

do

rm process_FTOF"$NUMBER".sh

touch process_FTOF"$NUMBER".sh

echo 'gROOT->ProcessLine(".L ~/Documents/Macros/FTOF_Efficiency_Studies/FTOF_Unified_2D.C++");' >> process_FTOF"$NUMBER".sh
echo 'gROOT->ProcessLine("FTOF_Unified_2D(\"/cache/clas12/rg-a/production/recon/fall2018/torus+1/pass1/v0/dst/recon/00'$NUMBER'/*.hipo\",\"/volatile/clas12/matthewn/FTOF/RGA_Fall18_Outbending/RGA_Fall18_Outbending_'$NUMBER'.root\",\"Outbending\")");' >> process_FTOF"$NUMBER".sh

echo "Made process_FTOF"$NUMBER".sh"

done
