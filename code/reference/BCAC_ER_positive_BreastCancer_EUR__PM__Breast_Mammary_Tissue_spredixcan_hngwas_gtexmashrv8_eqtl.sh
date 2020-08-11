#!/bin/bash
#PBS -N BCAC_ER_positive_BreastCancer_EUR__PM__Breast_Mammary_Tissue_spredixcan_hngwas_gtexmashrv8_eqtl
#PBS -S /bin/bash
#PBS -l walltime=0:30:00
#PBS -l mem=2gb
#PBS -l nodes=1:ppn=1

#PBS -o logs_hn_mashr_eqtl/${PBS_JOBNAME}.o${PBS_JOBID}.log
#PBS -e logs_hn_mashr_eqtl/${PBS_JOBNAME}.e${PBS_JOBID}.err

module load gcc/6.2.0
module load python/2.7.13

export MKL_NUM_THREADS=1
export OPEN_BLAS_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export OMP_NUM_THREADS=1

cd $PBS_O_WORKDIR 

/gpfs/data/im-lab/nas40t2/abarbeira/software/MetaXcan/software/MetaXcan.py \
--gwas_file /gpfs/data/im-lab/nas40t2/Data/SummaryResults/formatted_gwas_hg38_1.2/BCAC_ER_positive_BreastCancer_EUR.txt.gz \
--snp_column panel_variant_id --effect_allele_column effect_allele --non_effect_allele_column non_effect_allele --zscore_column zscore \
--model_db_path /gpfs/data/im-lab/nas40t2/abarbeira/projects/gtex_v8/models_v1/eqtl/mashr/mashr_Breast_Mammary_Tissue.db \
--covariance /gpfs/data/im-lab/nas40t2/abarbeira/projects/gtex_v8/models_v1/eqtl/mashr/mashr_Breast_Mammary_Tissue.txt.gz \
--keep_non_rsid --additional_output --model_db_snp_key varID \
--throw \
--output_file results/sp_harmonized_n_gwas_gtexv8_mashr_eqtl/spredixcan_hngwas_gtexmashrv8_BCAC_ER_positive_BreastCancer_EUR__PM__Breast_Mammary_Tissue.csv