#!/bin/bash
ScriptDir="/home/matthewn/Documents/Macros/Slurm/FTOF/RGF_Summer20_Inbending"
cd $ScriptDir

for NUMBER in `seq $1 $2`;

do

rm process_FTOF"$NUMBER".sh

touch process_FTOF"$NUMBER".sh

echo 'gROOT->ProcessLine(".L ~/Documents/Macros/FTOF_Efficiency_Studies/FTOF_Unified_2D_Edep.C");' >> process_FTOF"$NUMBER".sh
echo 'gROOT->ProcessLine("FTOF_Unified_2D_Edep(\"/cache/clas12/rg-f/production/recon/summer2020/torus-1_solenoid-0.745/pass1v0/dst/recon/0'$NUMBER'/*.hipo\",\"/volatile/clas12/matthewn/FTOF/RGF_Summer20_Inbending_13062022_01/RGF_Summer20_Inbending_'$NUMBER'.root\",\"Inbending\",\"/volatile/clas12/matthewn/FTOF/RGF_Summer20_Inbending_13062022_01/RGF_Summer20_'$NUMBER'_Inbending_13062022_01.txt\")");' >> process_FTOF"$NUMBER".sh
# echo 'gROOT->ProcessLine("FTOF_Unified_2D_Edep(\"/cache/clas12/rg-a/production/recon/spring2019/torus-1/pass1/v0/dst/recon/00'$NUMBER'/*.hipo\",\"/volatile/clas12/matthewn/FTOF/RGA_Spring19_Inbending_Compare_2pi_singletrack_25052022_01/RGA_Spring19_Inbending_'$NUMBER'.root\",\"Inbending\")");' >> process_FTOF"$NUMBER".sh

echo "Made process_FTOF"$NUMBER".sh"

done
