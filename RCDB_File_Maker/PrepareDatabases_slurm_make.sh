#!/bin/bash
ScriptDir="/home/matthewn/Documents/Macros/Slurm/RCDB_File_Maker/RGA_Spring19_Inbending"
cd $ScriptDir

for NUMBER in `seq $1 $2`;

do

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

done
