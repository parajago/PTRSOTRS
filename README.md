#PTRSOTRS

Readme:
This repository contains the scripts and results for the project developing prognostic scores for breast cancer incorporating germline risk data + transcriptomic data.


In this project, we calculated three scores for European ancestry: 
* a polygenic score
* a “predicted transcriptome” score
* an “observed transcriptome” score

Documentation on stepwise Methods is available on Google Docs (please ask to be added if you are part of this project)

(1) INPUT/
-AA-summarystats: Raw summary statistics from the AABC, AMBER, Root and Ghana meta-analyses

-clinical-raw: Raw clinical data used in R for processing
	* GDC-BRCA-clinical-raw: Raw data directly from GDC for comparison
	* Cell2018-BRCA-clinical-raw: Clinical information as taken from Liu et al. (https://www.cell.com/cell/pdf/S0092-8674(18)30229-0.pdf)
	* CBioportal-BRCA-clinical-raw: Processed file of 2018 Cell paper data from CBioportal for importing
	* Supplementary Tables 1-4: TCGA tumor subtyping data/PAM50 data
	* nature_communications_ethnicities: Contains PCA-derived ethnic ancestries/PAM50 data

-EA-summarystats: 
	* CIMBA, Oncoarray summary statistics for 2018, 2020
	* Subtype sub-analyses (TNBC, Lum A, Lum B and HER2) and survival (2017)

-FAM: .fam and .pheno files for European, AA patients (see step 7 in Methods)
-ids: 	AFR (BRCA.AFR.aliquot)
		EUR ()
			* BRCA.EUR.aliquot: Based on PCA by Zhenyu and Jiamao
			* BRCA-694: Patients with clinical + predixcan data 
			* TCGAERpositive: IDs of patients with this subtype among TCGA European ancestry patients
			* TCGAERnegative: IDs of patients with this subtype among TCGA European ancestry patients
			* TCGATPBCpositive: IDs of patients with this subtype among TCGA European ancestry patients
			* TCGATNBCpositive: IDs of patients with this subtype among TCGA European ancestry patients
			* TCGAHRpositive: IDs of patients with this subtype among TCGA European ancestry patients
			* TCGAHER2positive:				
		* TCGA-BRCA-allIDs-regex: Temporary file used to sort BRCA IDs from long form to short form (Step 2 of methods)
		* TCGA-BRCA-allIDs: All patients, short form of ID (Step 2 of methods)
		* brca.samples.tsv: Original PCA by Zhenyu and Jiamao 	

-predixcan-predicted-output: Predicted expression of OS, PFS using PredictDB breast GTEx models
 
-PRS-betas: Betas taken from Mavaddat et al. AJHG 2019 (https://www.sciencedirect.com/science/article/pii/S0002929718304051)
-PRS-snps: Text files of Hg19 SNP locations (step 3 in Methods)
-PRS-dosage: Dosage files for PRS across TCGA EUR breast patients (see Step 8 in Methods)

-spredixcan-output: 
* Breast GTEx Predict DB database (.db) + covariance (.txt.gz) files
* S-Predixcan results for summary statistics for risk GWAS that are used for weighting (Overall, survival, HER2, LumA, LumB, TNBC + 2018 results)
* Bhattacharya 2020 model results for future use
* EURsamples.txt: Used in running predixcan to generate the predicted transcriptome

-TCGA-BRCA-mRNA: Normalized RSEM mRNA values (step 17 in Methods)

-clinical_formatted: Clinical information imported for use in PTRSOTRS project
	* cbioportal-formatted.csv: Formatted TCGA clinical and survival data used for this project (Step 6 of Methods)
	* clinical694.csv: Formatted TCGA clinical and survival data used with patients in PrediXcan scoring
	* subtypes.csv: Subtype-specific information

-PTRSOTRSInputformatting.Rmd -> To process summary statistics files to get weights

(2) OUTPUT/
-1modelnaive: Naive model of the score. 
 * PRS OS and PFS univariate results
 * 2020-PTRS-OS and PFS univariate results
 * 2020-OTRS-OS and PFS univariate results
 * 2020-overallsurvivalscore, 2020-recurrencesurvivalscore -> in conjunction with clinical data
 
-2survandsubtype: Application of the naive model of the score to survival GWAS and subtype-specific GWAS
 * 2020-OTRS-OS and PFS survival univariate results
 * 2020-PTRS-subype univariate results
 * 2020-PTRS-subtype involvement vs. overall score (PTRS-conditionsubtype-interaction, PTRS-conditionsubtype)
 * Score cutoff models
 
-GCTA: Supplemental results regarding use of GCTA and contribution towards variance of outcome (OS/PFS) as a binary variable
* Application files = gcta_1.93.1beta_mac, gcta64, gctacode.txt
* Genome: PLINK files required to run GCTA to assess whole genome heritability (as imputed from TCGA)
* Genome_PRS: PLINK files required to run GCTA to assess heritability of PRS risk alone in patients having already inherited disease + assessing outcome
* ptranscriptome: PTRS score with R files required to process GCTA run and results
* otranscriptome: OTRS score with R files required to process GCTA run and results
*BRCA-OS-EUR.pheno, BRCA-PFS-EUR.pheno and clinical694.csv are copied from Input folder*

-3modelcoxnet: Score development with regularized Cox regression with cross validation (results)
* OTRS-OS, OTRS-PFS Coxnet results
* PTRS-OS, PTRS-PFS Coxnet results

-4OSmachinelearning: BGLM-Cox, BGLM-Weibull

-5PFSmachinelearning: MSR-RF / Boosted Trees


ANALYSIS:
* TRSscorecalculator.Rmd: Score calculator and performance


CODE:
* PTRSOTRSinputformatting: R script on risk GWAS to format for harmonization and S-PrediXcan
* generateweights: S-PrediXcan script on risk GWAS to generate weights for score (bash)

[workflowr]: https://github.com/jdblischak/workflowr