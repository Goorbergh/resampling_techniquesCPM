# resampling_techniquesCPM: Research Master Thesis Archive

This repository accompanies my research master thesis:
[The harm of SMOTE and other resampling techniques in clinical prediction models: a simulation study](Documents/Thesis_rvdg_v1.0.pdf)

Version 1.0, 14-5-2021

*Abstract* <br /> 
Methods to adjust for outcome imbalance, i.e. imbalance between the number of events and non-events, such as synthetic minority oversampling (SMOTE) are receiving increasing interest in the field of clinical prediction modelling. In this paper, the effect of imbalance correction methods in the form of resampling techniques on the performance of (ridge) logistic regression and random forest is examined, before and after re-calibration. The effect of resampling techniques is illustrated in the context of ovarian tumours. Then, Monte Carlo simulations are presented to evaluate the discriminative performance as well as the calibration of the different models with respect to different resampling techniques adjusting data imbalance. The results show that the calibration of the models is substantially affected by resampling techniques. The simulations further reveal that logistic regression models do not benefit from resampling techniques. The results suggest that Random forest may benefit from imbalance adjustments in terms of a slightly improved c-statistic, especially when the prevalence is very low. The results further show that random undersampling can lead to various problems that are associated with small data sets. Conclusively, cliical prediction modellers should refrain from applying data adjustment methods to imbalanced data, especially when the calibration of the model is of interest.

# Folder Structure
This archive is structured as follows: The three main folders contain the different main parts of the study (case study and simulation study) and the accompanying documents. Each main folder contains a README.md file discribing the content of the folder (and its subfolders) and how to use this content to reproduce (a part of) the results. For each phase, the intermediate results are stored. This means that each simulation phase can be replicated without the need of running all previous phases, which is done to ease the preplication proces. 

NOTE2: To replicate results, this whole archive should be downloaded without altering the folder structure or folder names. In the following files, the user has replace `<YOURLOCALFILEPATH>` with the local path to the research archive folder: script_case_study.R, simulation_scenarios.R, optim_beta.R, simulation_run.R, separation_simulation.R, imbalance_visualisation.R, results_figures_tables.R, supplementary_material_code.R.

```
├── Case_study (All info on case study)
│   ├── Data
│   ├── Output
│   │   ├── calibration_plots.jpeg
│   │   └── cases_study_results.RDS
│   ├── README.md
│   └── Script
│       └── performance_measures.R
├── Documents (Manuscript & Approval ethics boards)
│   ├── Supplementary_material.pdf
│   ├── Thesis_rvdg_v1.0.pdf
│   └── approval_UU.pdf
├── README.md
├── Simulation_study (All info on simulation study)
│   ├── Analysis
│   │   ├── Data
│   │   ├── Output
│   │   └── Script
│   ├── Post_simulation_data_separation_check
│   │   ├── Data
│   │   ├── Output
│   │   └── Script
│   ├── Pre_simulation
│   │   ├── Output
│   │   └── Script
│   ├── README.md
│   └── Simulation
│       ├── Output
│       └── Script
├── Software.txt (Info on used software)

```


# Software
Details of the software used for this study can be found in [this file](Software.txt). Installing these packages will invoke installing dependencies needed.


# License 

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.



# Maintenance
The maintenance and creation of this archive are the responsibility Ruben van den Goorbergh. All files are created and saved by the author. In line with the license, this archive is completely Open Access, so anyone can access the archive for an unspecified amount of time.

