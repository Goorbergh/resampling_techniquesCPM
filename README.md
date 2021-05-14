# resampling_techniquesCPM: Research Master Thesis Archive

This repository accompanies my research master thesis:
The harm of SMOTE and other resampling techniques in clinical prediction models: a simulation study

Version 1.0, 14-5-2021

*Abstract* 
Methods to adjust for outcome imbalance, i.e. imbalance between the number of events and non-events, such as synthetic minority oversampling (SMOTE) are receiv- ing increasing interest in the field of clinical prediction modelling. In this paper, the effect of imbalance correction methods in the form of resampling techniques on the performance of (ridge) logistic regression and random forest is examined, before and after re-calibration. The effect of resampling techniques is illustrated in the context of ovarian tumours. Then, Monte Carlo simulations are presented to evaluate the discriminative performance as well as the calibration of the different models with respect to different resampling techniques adjusting data imbalance. The results show that the calibration of the models is substantially affected by resampling techniques. The simulations further reveal that logistic regression models do not benefit from resampling techniques. The results suggest that Random forest may benefit from imbalance adjustments in terms of a slightly improved c-statistic, especially when the prevalence is very low. The results further show that random undersampling can lead to various problems that are associated with small data sets. Conclusively, cliical prediction modellers should refrain from applying data adjustment methods to imbalanced data, especially when the calibration of the model is of interest.

# Folder Structure
This archive is structured as follows: The three main folders contain the different main parts of the study (case study and simulation study) and the accompanying documents. Each main folder contains a README.md file discribing the content of the folder (and its subfolders) and how to use this content to reproduce (a part of) the results. 

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="Author" content="Made by 'tree'">
 <meta name="GENERATOR" content="$Version: $ tree v1.8.0 (c) 1996 - 2018 by Steve Baker, Thomas Moore, Francesc Rocher, Florian Sesser, Kyosuke Tokoro $">
 <title>Directory Tree</title>
 <style type="text/css">
  <!-- 
  BODY { font-family : ariel, monospace, sans-serif; }
  P { font-weight: normal; font-family : ariel, monospace, sans-serif; color: black; background-color: transparent;}
  B { font-weight: normal; color: black; background-color: transparent;}
  A:visited { font-weight : normal; text-decoration : none; background-color : transparent; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  A:link    { font-weight : normal; text-decoration : none; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  A:hover   { color : #000000; font-weight : normal; text-decoration : underline; background-color : yellow; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  A:active  { color : #000000; font-weight: normal; background-color : transparent; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  .VERSION { font-size: small; font-family : arial, sans-serif; }
  .NORM  { color: black;  background-color: transparent;}
  .FIFO  { color: purple; background-color: transparent;}
  .CHAR  { color: yellow; background-color: transparent;}
  .DIR   { color: blue;   background-color: transparent;}
  .BLOCK { color: yellow; background-color: transparent;}
  .LINK  { color: aqua;   background-color: transparent;}
  .SOCK  { color: fuchsia;background-color: transparent;}
  .EXEC  { color: green;  background-color: transparent;}
  -->
 </style>
</head>
<body>
	<h1>Directory Tree</h1><p>
	<a href="baseHREF">baseHREF</a><br>
	├── <a href="baseHREF/Case_study/">Case_study</a><br>
	│   ├── <a href="baseHREF/Case_study/Data/">Data</a><br>
	│   ├── <a href="baseHREF/Case_study/Output/">Output</a><br>
	│   │   ├── <a href="baseHREF/Case_study/Output/calibration_plots.jpeg">calibration_plots.jpeg</a><br>
	│   │   └── <a href="baseHREF/Case_study/Output/cases_study_results.RDS">cases_study_results.RDS</a><br>
	│   ├── <a href="baseHREF/Case_study/README.md">README.md</a><br>
	│   └── <a href="baseHREF/Case_study/Script/">Script</a><br>
	│   &nbsp;&nbsp;&nbsp; └── <a href="baseHREF/Case_study/Script/performance_measures.R">performance_measures.R</a><br>
	├── <a href="baseHREF/Documents/">Documents</a><br>
	│   ├── <a href="baseHREF/Documents/Supplementary_material.pdf">Supplementary_material.pdf</a><br>
	│   ├── <a href="baseHREF/Documents/Thesis_rvdg_v1.0.pdf">Thesis_rvdg_v1.0.pdf</a><br>
	│   └── <a href="baseHREF/Documents/approval_UU.pdf">approval_UU.pdf</a><br>
	├── <a href="baseHREF/README.md">README.md</a><br>
	├── <a href="baseHREF/Simulation_study/">Simulation_study</a><br>
	│   ├── <a href="baseHREF/Simulation_study/Analysis/">Analysis</a><br>
	│   │   ├── <a href="baseHREF/Simulation_study/Analysis/Data/">Data</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Data/data_1_9_17.RDS">data_1_9_17.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Data/data_2_10_18.RDS">data_2_10_18.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Data/data_3_11_19.RDS">data_3_11_19.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Data/data_4_12_20.RDS">data_4_12_20.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Data/data_5_13_21.RDS">data_5_13_21.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Data/data_6_14_22.RDS">data_6_14_22.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Data/data_7_15_23.RDS">data_7_15_23.RDS</a><br>
	│   │   │   └── <a href="baseHREF/Simulation_study/Analysis/Data/data_8_16_24.RDS">data_8_16_24.RDS</a><br>
	│   │   ├── <a href="baseHREF/Simulation_study/Analysis/Output/">Output</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Output/Supplement/">Supplement</a> [16 entries exceeds filelimit, not opening dir]<br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Output/performance_grid.jpeg">performance_grid.jpeg</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Output/performance_grid_recal.jpeg">performance_grid_recal.jpeg</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Output/plot_imbalance_001.jpeg">plot_imbalance_001.jpeg</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Analysis/Output/vari_RUS.png">vari_RUS.png</a><br>
	│   │   │   └── <a href="baseHREF/Simulation_study/Analysis/Output/vari_RUS_slope.png">vari_RUS_slope.png</a><br>
	│   │   └── <a href="baseHREF/Simulation_study/Analysis/Script/">Script</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Analysis/Script/imbalance_visualisation.R">imbalance_visualisation.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Analysis/Script/result_figures_tables.R">result_figures_tables.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; └── <a href="baseHREF/Simulation_study/Analysis/Script/supplementary_material_code.R">supplementary_material_code.R</a><br>
	│   ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/">Post_simulation_data_separation_check</a><br>
	│   │   ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Data/">Data</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Data/res_1_9_17.RDS">res_1_9_17.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Data/res_2_10_18.RDS">res_2_10_18.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Data/res_3_11_19.RDS">res_3_11_19.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Data/res_4_12_20.RDS">res_4_12_20.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Data/res_5_13_21.RDS">res_5_13_21.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Data/res_6_14_22.RDS">res_6_14_22.RDS</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Data/res_7_15_23.RDS">res_7_15_23.RDS</a><br>
	│   │   │   └── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Data/res_8_16_24.RDS">res_8_16_24.RDS</a><br>
	│   │   ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Output/">Output</a> [17 entries exceeds filelimit, not opening dir]<br>
	│   │   └── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/">Script</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/data_generation.R">data_generation.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/dependencies.R">dependencies.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/fitting_models_wo_xgb.R">fitting_models_wo_xgb.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/imbalance_functions.R">imbalance_functions.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/performance_measures_wo_eci.R">performance_measures_wo_eci.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/remove_separated_data.R">remove_separated_data.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/scen_seed.RDS">scen_seed.RDS</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/seed.RDS">seed.RDS</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/separation_detection.R">separation_detection.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/separation_simulation.R">separation_simulation.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/sim_sep_run.sh">sim_sep_run.sh</a><br>
	│   │   &nbsp;&nbsp;&nbsp; └── <a href="baseHREF/Simulation_study/Post_simulation_data_separation_check/Script/simlist_total.RDS">simlist_total.RDS</a><br>
	│   ├── <a href="baseHREF/Simulation_study/Pre_simulation/">Pre_simulation</a><br>
	│   │   ├── <a href="baseHREF/Simulation_study/Pre_simulation/Output/">Output</a><br>
	│   │   │   ├── <a href="baseHREF/Simulation_study/Pre_simulation/Output/betas_2.rData">betas_2.rData</a><br>
	│   │   │   └── <a href="baseHREF/Simulation_study/Pre_simulation/Output/simlist_total.RDS">simlist_total.RDS</a><br>
	│   │   └── <a href="baseHREF/Simulation_study/Pre_simulation/Script/">Script</a><br>
	│   │   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Pre_simulation/Script/optim_beta.R">optim_beta.R</a><br>
	│   │   &nbsp;&nbsp;&nbsp; └── <a href="baseHREF/Simulation_study/Pre_simulation/Script/simulation_scenarios.R">simulation_scenarios.R</a><br>
	│   ├── <a href="baseHREF/Simulation_study/README.md">README.md</a><br>
	│   └── <a href="baseHREF/Simulation_study/Simulation/">Simulation</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Output/">Output</a><br>
	│   &nbsp;&nbsp;&nbsp; │   ├── <a href="baseHREF/Simulation_study/Simulation/Output/OUT/">OUT</a> [24 entries exceeds filelimit, not opening dir]<br>
	│   &nbsp;&nbsp;&nbsp; │   ├── <a href="baseHREF/Simulation_study/Simulation/Output/res_1_9_17.RDS">res_1_9_17.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; │   ├── <a href="baseHREF/Simulation_study/Simulation/Output/res_2_10_18.RDS">res_2_10_18.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; │   ├── <a href="baseHREF/Simulation_study/Simulation/Output/res_3_11_19.RDS">res_3_11_19.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; │   ├── <a href="baseHREF/Simulation_study/Simulation/Output/res_4_12_20.RDS">res_4_12_20.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; │   ├── <a href="baseHREF/Simulation_study/Simulation/Output/res_5_13_21.RDS">res_5_13_21.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; │   ├── <a href="baseHREF/Simulation_study/Simulation/Output/res_6_14_22.RDS">res_6_14_22.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; │   ├── <a href="baseHREF/Simulation_study/Simulation/Output/res_7_15_23.RDS">res_7_15_23.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; │   └── <a href="baseHREF/Simulation_study/Simulation/Output/res_8_16_24.RDS">res_8_16_24.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; └── <a href="baseHREF/Simulation_study/Simulation/Script/">Script</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/data_generation.R">data_generation.R</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/dependencies.R">dependencies.R</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/fitting_models_wo_xgb.R">fitting_models_wo_xgb.R</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/imbalance_functions.R">imbalance_functions.R</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/model_validation_wo_xgb_ECI.R">model_validation_wo_xgb_ECI.R</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/performance_measures_wo_eci.R">performance_measures_wo_eci.R</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/result_binding_code.R">result_binding_code.R</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/scen_seed.RDS">scen_seed.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/seed.RDS">seed.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/sim_run.sh">sim_run.sh</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/simlist_total.RDS">simlist_total.RDS</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ├── <a href="baseHREF/Simulation_study/Simulation/Script/simulation_run.R">simulation_run.R</a><br>
	│   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; └── <a href="baseHREF/Simulation_study/Simulation/Script/single_run_wo_eci.R">single_run_wo_eci.R</a><br>
	├── <a href="baseHREF/Software.txt">Software.txt</a><br>
	└── <a href="baseHREF/Supplementary_material.pdf">Supplementary_material.pdf</a><br>
	<br><br>
	</p>
	<p>

22 directories, 72 files
	<br><br>
	</p>
	<hr>
	<p class="VERSION">
		 tree v1.8.0 © 1996 - 2018 by Steve Baker and Thomas Moore <br>
		 HTML output hacked and copyleft © 1998 by Francesc Rocher <br>
		 JSON output hacked and copyleft © 2014 by Florian Sesser <br>
		 Charsets / OS/2 support © 2001 by Kyosuke Tokoro
	</p>
</body>
</html>


# Software
Details of the software used for this study can be found in [this file](Software.txt). Installing this packages will invoke installing dependencies needed.


# License 

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.



# Maintenance
The maintenance and creation of this archive are the responsibility Ruben van den Goorbergh. All files are created and saved by the author. In line with the license, this archive is completely Open Access, so anyone can access the archive for an unspecified amount of time.

