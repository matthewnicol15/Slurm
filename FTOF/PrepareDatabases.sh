#!/bin/bash
# Run over DSTs

# Where you want your slurm outputs to go
SlurmOut="/home/matthewn/Documents/Macros/Slurm/RCDB_File_Maker/Test"
cd $SlurmOut
# Efficiency macro location
MacroLoc="/home/matthewn/Documents/Macros"
# Where the data is stored
DataDir="/cache/clas12/rg-b/production/recon/spring2019/torus-1/pass1/v0/dst/recon"
# Where you want the output ROOT file to be saved
OutputDir="/w/hallb-scshelf2102/clas12/users/matthewn/RCDB_Files/Test"
mkdir $OutputDir
# Output name, this is followed by the sequence number automatically
OutputName="RGB_PrepareDatabases_Spring19_Inbending"

for NUMBER in `seq $1 $2`;

do

rm process_PrepareDatabases_"$NUMBER".sh

touch process_PrepareDatabases_"$NUMBER".sh

echo 'gROOT->ProcessLine(".L '$MacroLoc'/PrepareDatabases.C");' >> process_PrepareDatabases_"$NUMBER".sh
echo 'gROOT->ProcessLine("PrepareDatabases(\"'$DataDir'/00'$NUMBER'/*.hipo\",\"'$OutputDir'/'$OutputName'_'$NUMBER'.root\")");' >> process_PrepareDatabases_"$NUMBER".sh

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
echo 'SBATCH --begin=now+60' >> slurm_PrepareDatabases_"$NUMBER".sh
echo '/bin/more process_PrepareDatabases_'$NUMBER'.sh | clas12root -b' >> slurm_PrepareDatabases_"$NUMBER".sh

echo "Made slurm_PrepareDatabases_"$NUMBER".sh"

sbatch slurm_PrepareDatabases_$NUMBER.sh

sleep 2

rm slurm_PrepareDatabases_"$NUMBER".sh
rm process_PrepareDatabases_"$NUMBER".sh

done
