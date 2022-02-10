#!/bin/bash

for NUMBER in `seq 10 69`;

do

rm slurm_d_pip_pim_PID"$NUMBER".sh

touch slurm_d_pip_pim_PID"$NUMBER".sh

echo '#!/bin/bash' >> slurm_d_pip_pim_PID"$NUMBER".sh
echo '#SBATCH --nodes=1' >> slurm_d_pip_pim_PID"$NUMBER".sh
echo '#SBATCH --ntasks=1' >> slurm_d_pip_pim_PID"$NUMBER".sh
echo '#SBATCH --mem-per-cpu=3000' >> slurm_d_pip_pim_PID"$NUMBER".sh
echo '#SBATCH --job-name=d_pip_pim_6'$NUMBER'' >> slurm_d_pip_pim_PID"$NUMBER".sh
echo '#SBATCH --partition=production' >> slurm_d_pip_pim_PID"$NUMBER".sh
echo '#SBATCH --account=clas12' >> slurm_d_pip_pim_PID"$NUMBER".sh
echo '/bin/more process_d_pip_pim_PID'$NUMBER'.sh | clas12root -b' >> slurm_d_pip_pim_PID"$NUMBER".sh

echo "Made slurm_d_pip_pim_PID"$NUMBER".sh"

done
