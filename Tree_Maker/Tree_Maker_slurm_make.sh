#!/bin/bash
ScriptDir="/volatile/clas12/matthewn/Slurm/Tree_Maker/Strange_Tree_RGB_Spring19_Inbending_290622"
cd $ScriptDir

for NUMBER in `seq $1 $2`;

do

rm slurm_Tree_Maker_$NUMBER.sh
touch slurm_Tree_Maker_$NUMBER.sh

echo '#!/bin/bash' >> slurm_Tree_Maker_$NUMBER.sh
echo '#SBATCH --nodes=1' >> slurm_Tree_Maker_$NUMBER.sh
echo '#SBATCH --ntasks=1' >> slurm_Tree_Maker_$NUMBER.sh
echo '#SBATCH --mem-per-cpu=3000' >> slurm_Tree_Maker_$NUMBER.sh
echo '#SBATCH --job-name=Tree_Maker_'$NUMBER'' >> slurm_Tree_Maker_$NUMBER.sh
echo '#SBATCH --partition=production' >> slurm_Tree_Maker_$NUMBER.sh
echo '#SBATCH --account=clas12' >> slurm_Tree_Maker_$NUMBER.sh
echo '/bin/more '$ScriptDir'/process_Tree_Maker'$NUMBER'.sh | clas12root -b' >> slurm_Tree_Maker_$NUMBER.sh

echo "Made /slurm_Tree_Maker_"$NUMBER".sh"

done
