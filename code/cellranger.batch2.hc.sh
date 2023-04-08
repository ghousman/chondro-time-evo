#!/bin/bash
sbatch <<EOT
#!/bin/bash

# sbatch submission script to run main snakemake process
# submits individual jobs from the compute node

#SBATCH --job-name=cellranger_${1}
#SBATCH --output=cellranger.batch2.hc.${1}.out
#SBATCH --error=cellranger.batch2.hc.${1}.err
#SBATCH --time=36:00:00
#SBATCH --partition=broadwl
#SBATCH --mem=48G
#SBATCH --tasks-per-node=12

/project2/gilad/kenneth/software/cellranger-7.0.0/bin/cellranger count --id human_chimp_chondro_time_batch2_hc \
                                                								       --transcriptome=/project2/gilad/kenneth/References/HumanChimpCellranger/cellranger4.0/HumanOrthoV2_and_ChimpOrthoV2 \
                                                								       --fastqs=./../fastq \
                                                								       --sample=$1 \
                                                								       --localcores 12 \
                                                								       --localmem 48

EOT
