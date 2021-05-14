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
	baseHREF<br>
	├── Case_study<br>
	│   ├── Data<br>
	│   ├── Output<br>
	│   │   ├── calibration_plots.jpeg<br>
	│   │   └── cases_study_results.RDS<br>
	│   ├── README.md<br>
	│   └── Script<br>
	│   &nbsp;&nbsp;&nbsp; └── performance_measures.R<br>
	├── Documents<br>
	│   ├── Supplementary_material.pdf<br>
	│   ├── Thesis_rvdg_v1.0.pdf<br>
	│   └── approval_UU.pdf<br>
	├── README.md<br>
	├── Simulation_study<br>
	│   ├── Analysis<br>
	│   │   ├── Data<br>
	│   │   ├── Output<br>
	│   │   └── Script<br>
	│   ├── Post_simulation_data_separation_check<br>
	│   │   ├── Data<br>
	│   │   ├── Output<br>
	│   │   └── Script<br>
	│   ├── Pre_simulation<br>
	│   │   ├── Output<br>
	│   │   └── Script<br>
	│   ├── README.md<br>
	│   └── Simulation<br>
	│   &nbsp;&nbsp;&nbsp; ├── Output<br>
	│   &nbsp;&nbsp;&nbsp; └── Script<br>
	├── Software.txt<br>
	└── Supplementary_material.pdf<br>
	<br><br>
	</p>
	<p>

20 directories, 11 files
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

