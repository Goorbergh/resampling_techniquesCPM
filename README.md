# resampling_techniquesCPM: Research Master Thesis Archive

This repository accompanies my research master thesis:
The harm of SMOTE and other resampling techniques in clinical prediction models: a simulation study

Version 1.0, 14-5-2021

*Abstract* 
Methods to adjust for outcome imbalance, i.e. imbalance between the number of events and non-events, such as synthetic minority oversampling (SMOTE) are receiv- ing increasing interest in the field of clinical prediction modelling. In this paper, the effect of imbalance correction methods in the form of resampling techniques on the performance of (ridge) logistic regression and random forest is examined, before and after re-calibration. The effect of resampling techniques is illustrated in the context of ovarian tumours. Then, Monte Carlo simulations are presented to evaluate the discriminative performance as well as the calibration of the different models with respect to different resampling techniques adjusting data imbalance. The results show that the calibration of the models is substantially affected by resampling techniques. The simulations further reveal that logistic regression models do not benefit from resampling techniques. The results suggest that Random forest may benefit from imbalance adjustments in terms of a slightly improved c-statistic, especially when the prevalence is very low. The results further show that random undersampling can lead to various problems that are associated with small data sets. Conclusively, cliical prediction modellers should refrain from applying data adjustment methods to imbalanced data, especially when the calibration of the model is of interest.

# Folder Structure
This archive is structured as follows: The three main folders contain the different main parts of the study (case study and simulation study) and the accompanying documents. Each main folder contains a README.md file discribing the content of the folder (and its subfolders) and how to use this content to reproduce (a part of) the results. 

├── Case_study<br />
│   ├── Data<br />
│   ├── Output<br />
│   │   ├── calibration_plots.jpeg<br />
│   │   └── cases_study_results.RDS<br />
│   ├── README.md<br />
│   └── Script<br />
│       └── performance_measures.R<br />
├── Documents<br />
│   ├── Supplementary_material.pdf<br />
│   ├── Thesis_rvdg_v1.0.pdf<br />
│   └── approval_UU.pdf<br />
├── README.md<br />
├── Simulation_study<br />
│   ├── Analysis<br />
│   │   ├── Data<br />
│   │   ├── Output<br />
│   │   └── Script<br />
│   ├── Post_simulation_data_separation_check<br />
│   │   ├── Data<br />
│   │   ├── Output<br />
│   │   └── Script<br />
│   ├── Pre_simulation<br />
│   │   ├── Output<br />
│   │   └── Script<br />
│   ├── README.md<br />
│   └── Simulation<br />
│       ├── Output<br />
│       └── Script<br />
├── Software.txt<br />
└── Supplementary_material.pdf<br />


.
├── data                    <- Data about the simulation settings (PG)
│   └── simulation settings <- The simulation studies as defined in the thesis (RO)
├── docs                    <- Documentation notebook for users + supplementary material (HW)
│   ├── manuscript          <- Manuscript source, e.g., LaTeX, Markdown, etc. (HW)
|   ├── suppl. material     <- A document containing the supplementary information (RO)
│   └── reports             
|       ├── Proposal        <- Research proposal (HW)
|       └── Research report <- Research report (HW)            
├── results                 
│   ├── figures             <- Figures for the manuscript (PG)
│   └── output              <- Other output for the manuscript or reports (PG)
|       ├── estimands       <- Estimands for each simulation run (PG)
|       └── performance     <- Performance measures for each simulation run (PG)           
├── src                     <- Source code for this project (HW)
├── .gitignore              <- Files that are not taken into account when commiting (RO)
├── CITATION.md             <- How to cite my work (RO)
├── LICENSE.md              <- License for my project (RO)
├── README.md               <- The document you are reading right now (RO)
└── requirements.txt        <- Which packages are needed to run the scripts? (RO)



# Software
Details of the software used for this study can be found in [this file](Software.txt). Installing this packages will invoke installing dependencies needed.


# License 

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.



# Maintenance
The maintenance and creation of this archive are the responsibility Ruben van den Goorbergh. All files are created and saved by the author. In line with the license, this archive is completely Open Access, so anyone can access the archive for an unspecified amount of time.

