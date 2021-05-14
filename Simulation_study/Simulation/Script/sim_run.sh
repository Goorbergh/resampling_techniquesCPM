#!/bin/sh
#!/bin/bash
#SBATCH --time=60:00:00
#SBATCH --mem=10G
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=r.vandengoorbergh@gmail.com
#SBATCH --array=1-24



/<YOURLOCALPATH>/Research_archive/Simulation_study/Simulation/Script/simulation_run.R $SLURM_ARRAY_TASK_ID 1-24






