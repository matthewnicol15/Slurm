#!/bin/bash
# Where you want your slurm outputs to go
SlurmOut="/u/home/matthewn/Documents/Macros/Slurm/FTOF/RGA_Fall18_Inbending"
cd $SlurmOut
# Efficiency macro location
MacroLoc="/home/matthewn/Documents/Macros/FTOF_Efficiency_Studies"
# Where the data is stored
DataDir="/cache/clas12/rg-a/production/recon/fall2018/torus-1/pass1/v0/dst/recon"
# Where you want the output ROOT file to be saved
OutputDir="/volatile/clas12/matthewn/FTOF/RGA_Fall18_Inbending_12072022_01"
mkdir $OutputDir
# Output name, this is followed by the sequence number automatically
OutputName="RGA_Fall18_Inbending"
# use Inbending/inbending or Outbending/outbending
Polarity="Inbending"


for NUMBER in `seq $1 $2`;

do

rm process_FTOF"$NUMBER".sh

touch process_FTOF"$NUMBER".sh

echo 'gROOT->ProcessLine(".L '$MacroLoc'/FTOF_Efficiency.C");' >> process_FTOF"$NUMBER".sh
echo 'gROOT->ProcessLine("FTOF_Efficiency(\"'$DataDir'/00'$NUMBER'/*.hipo\",\"'$OutputDir'/'$OutputName$NUMBER'.root\",\"'$Polarity'\")");' >> process_FTOF"$NUMBER".sh

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

sbatch slurm_FTOF_$NUMBER.sh

sleep 4

rm process_FTOF"$NUMBER".sh
rm slurm_FTOF_$NUMBER.sh

done
