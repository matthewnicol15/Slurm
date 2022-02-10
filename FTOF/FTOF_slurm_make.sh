#!/bin/bash

for NUMBER in `seq 5032 5419`;

do

rm slurm_FTOF_"$NUMBER".sh

touch slurm_FTOF_"$NUMBER".sh

echo '#!/bin/bash' >> slurm_FTOF_"$NUMBER".sh
echo '#SBATCH --nodes=1' >> slurm_FTOF_"$NUMBER".sh
echo '#SBATCH --ntasks=1' >> slurm_FTOF_"$NUMBER".sh
echo '#SBATCH --mem-per-cpu=3000' >> slurm_FTOF_"$NUMBER".sh
echo '#SBATCH --job-name=FTOF_'$NUMBER'' >> slurm_FTOF_"$NUMBER".sh
echo '#SBATCH --partition=production' >> slurm_FTOF_"$NUMBER".sh
echo '#SBATCH --account=clas12' >> slurm_FTOF_"$NUMBER".sh
echo '/bin/more process_FTOF'$NUMBER'.sh | clas12root -b' >> slurm_FTOF_"$NUMBER".sh

echo "Made slurm_FTOF_"$NUMBER".sh"

done
