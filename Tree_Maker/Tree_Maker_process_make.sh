#!/bin/bash
ScriptDir="/volatile/clas12/matthewn/Slurm/Tree_Maker/Strange_Tree_RGB_Spring19_Inbending_290622"
cd $ScriptDir

for NUMBER in `seq $1 $2`;

do

rm process_Tree_Maker"$NUMBER".sh

touch process_Tree_Maker"$NUMBER".sh

# echo 'gROOT->ProcessLine(".L ~/Documents/Macros/Hexaquark/Tree_Maker.C++");' >> process_Tree_Maker"$NUMBER".sh
echo 'gROOT->ProcessLine(".L /volatile/clas12/matthewn/Slurm/Tree_Maker/Macro/Tree_Maker_PureMC.C++");' >> process_Tree_Maker"$NUMBER".sh
# echo 'gROOT->ProcessLine("Tree_Maker(\".L /home/matthewn/Documents/Macros/Loader.C+\",\"/cache/clas12/rg-a/production/recon/spring2019/torus-1/pass1/v0/dst/recon/00'$NUMBER'/*.hipo\",\"/volatile/clas12/matthewn/Tree_Maker/RGA_Spring19_Inbending_20062022_01/Strange_Tree_RGA_Spring19_Inbending_'$NUMBER'.root\",\"/w/hallb-scshelf2102/clas12/users/matthewn/RCDB_Files/RGA_Spring19_Inbending/RGA_PrepareDatabases_Spring19_Inbending_'$NUMBER'.root\")");' >> process_Tree_Maker"$NUMBER".sh
echo 'gROOT->ProcessLine("Tree_Maker_PureMC(\".L /home/matthewn/Documents/Macros/Loader.C+\",\"/volatile/clas12/matthewn/osg_output/S3_Deuteron_Target/S3_CascadeSigma_Acceptance_Sim_job4936_Deuteron_Target_270622.hipo\",\"/volatile/clas12/matthewn/Tree_Maker/S3_CascadeSigma_Acceptance_Sim_job4936_Deuteron_Target_290622_01/S3_CascadeSigma_Acceptance_Sim_job4936_MC_Deuteron_Target_290622_01.root\",\"/w/hallb-scshelf2102/clas12/users/matthewn/RCDB_Files/RGB_Spring19_Inbending/RGB_PrepareDatabases_Spring19_Inbending_6235.root\",\"Deuteron\")");' >> process_Tree_Maker"$NUMBER".sh

echo "Made process_Tree_Maker"$NUMBER".sh"

done
