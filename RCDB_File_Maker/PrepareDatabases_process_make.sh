#!/bin/bash
ScriptDir="/home/matthewn/Documents/Macros/Slurm/RCDB_File_Maker/RGA_Spring19_Inbending"
cd $ScriptDir

for NUMBER in `seq $1 $2`;

do

rm process_PrepareDatabases_"$NUMBER".sh

touch process_PrepareDatabases_"$NUMBER".sh

echo 'gROOT->ProcessLine(".L /home/matthewn/Documents/Macros/PrepareDatabases.C");' >> process_PrepareDatabases_"$NUMBER".sh
echo 'gROOT->ProcessLine("PrepareDatabases(\"/cache/clas12/rg-a/production/recon/spring2019/torus-1/pass1/v0/dst/recon/00'$NUMBER'/*.hipo\",\"/w/hallb-scshelf2102/clas12/users/matthewn/RCDB_Files/RGA_Spring19_Inbending/RGA_PrepareDatabases_Spring19_Inbending_'$NUMBER'.root\")");' >> process_PrepareDatabases_"$NUMBER".sh

echo "Made process_PrepareDatabases_"$NUMBER".sh"

done
