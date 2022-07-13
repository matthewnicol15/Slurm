#!/bin/bash

############################################################################
# User defined variables
############################################################################

# Where you want your slurm outputs to go
SlurmOut="/home/matthewn/Documents/Macros/Slurm/FTOF/Test"
mkdir $SlurmOut
cd $SlurmOut
#############
# RCDB variables
#############
# Efficiency macro location
MacroLoc="/home/matthewn/Documents/Macros"
# Where the data is stored
DataDir="/cache/clas12/rg-a/production/recon/fall2018/torus-1/pass1/v0/dst/recon"
# Target mass
targetMass=0.93827
# Where you want the output ROOT file to be saved
RCDBOutputDir="/w/hallb-scshelf2102/clas12/users/matthewn/RCDB_Files/Test"
mkdir $RCDBOutputDir
# Output name, this is followed by the sequence number automatically
RCDBOutputName="RGA_PrepareDatabases_Fall18_Inbending"
#############
# TOF variables
#############
TOFMacroLoc="/home/matthewn/Documents/Macros/FTOF_Efficiency_Studies"
# Where you want the output ROOT file to be saved
OutputDir="/volatile/clas12/matthewn/FTOF/RGA_Fall18_Inbending_13072022_01"
mkdir $OutputDir
# Output name, this is followed by the sequence number automatically
OutputName="RGA_Fall18_Inbending"
# use Inbending/inbending/In/in or Outbending/outbending/Out/out
Polarity="Inbending"

############################################################################
# Making RCDB files
############################################################################

for NUMBER in `seq $1 $2`;

do

rm process_PrepareDatabases_"$NUMBER".sh

touch process_PrepareDatabases_"$NUMBER".sh

echo 'gROOT->ProcessLine(".L '$MacroLoc'/PrepareDatabases.C");' >> process_PrepareDatabases_"$NUMBER".sh
echo 'gROOT->ProcessLine("PrepareDatabases(\"'$DataDir'/00'$NUMBER'/*.hipo\",\"'$RCDBOutputDir'/'$RCDBOutputName'_'$NUMBER'.root\")");' >> process_PrepareDatabases_"$NUMBER".sh

echo "Made process_PrepareDatabases_"$NUMBER".sh"


rm slurm_PrepareDatabases_"$NUMBER".sh
touch slurm_PrepareDatabases_"$NUMBER".sh

echo '#!/bin/bash' >> slurm_PrepareDatabases_"$NUMBER".sh
echo '#SBATCH --nodes=1' >> slurm_PrepareDatabases_"$NUMBER".sh
echo '#SBATCH --ntasks=1' >> slurm_PrepareDatabases_"$NUMBER".sh
echo '#SBATCH --mem-per-cpu=3000' >> slurm_PrepareDatabases_"$NUMBER".sh
echo '#SBATCH --job-name=PrepareDatabases_6'$NUMBER'' >> slurm_PrepareDatabases_"$NUMBER".sh
echo '#SBATCH --partition=production' >> slurm_PrepareDatabases_"$NUMBER".sh
echo '#SBATCH --account=clas12' >> slurm_PrepareDatabases_"$NUMBER".sh
echo '/bin/more process_PrepareDatabases_'$NUMBER'.sh | clas12root -b' >> slurm_PrepareDatabases_"$NUMBER".sh

echo "Made slurm_PrepareDatabases_"$NUMBER".sh"

# Running the RCDB file creating
RES=$(sbatch slurm_PrepareDatabases_$NUMBER.sh)
#Getting the slurm jobID
echo ${RES##* }


sleep 2

############################################################################
# Making FTOF efficieny files
############################################################################

rm process_FTOF"$NUMBER".sh
touch process_FTOF"$NUMBER".sh


echo 'gROOT->ProcessLine(".L '$TOFMacroLoc'/FTOF_Efficiency.C");' >> process_FTOF"$NUMBER".sh
echo 'gROOT->ProcessLine("FTOF_Efficiency(\"'$RCDBOutputDir'/'$RCDBOutputName'_'$NUMBER'.root\",\"'$DataDir'/00'$NUMBER'/*.hipo\",\"'$OutputDir'/'$OutputName$NUMBER'.root\",\"'$Polarity'\",\"'$targetMass'\")");' >> process_FTOF"$NUMBER".sh

echo "Made process_FTOF"$NUMBER".sh"

rm slurm_FTOF_$NUMBER.sh
touch slurm_FTOF_$NUMBER.sh

echo '#!/bin/bash' >> slurm_FTOF_$NUMBER.sh
echo '#SBATCH --nodes=1' >> slurm_FTOF_$NUMBER.sh
echo '#SBATCH --ntasks=1' >> slurm_FTOF_$NUMBER.sh
echo '#SBATCH --mem-per-cpu=3000' >> slurm_FTOF_$NUMBER.sh
echo '#SBATCH --job-name=FTOF_'$NUMBER'' >> slurm_FTOF_$NUMBER.sh
echo '#SBATCH --partition=production' >> slurm_FTOF_$NUMBER.sh
echo '#SBATCH --account=clas12' >> slurm_FTOF_$NUMBER.sh
echo '/bin/more process_FTOF'$NUMBER'.sh | clas12root -b' >> slurm_FTOF_$NUMBER.sh

echo "Made /slurm_FTOF_"$NUMBER".sh"

sbatch --dependency=afterok:${RES##* } slurm_FTOF_$NUMBER.sh

sleep 2

done

sleep 600
rm slurm_PrepareDatabases_"$NUMBER".sh
rm process_PrepareDatabases_"$NUMBER".sh
rm slurm_FTOF_"$NUMBER".sh
rm process_FTOF"$NUMBER".sh
