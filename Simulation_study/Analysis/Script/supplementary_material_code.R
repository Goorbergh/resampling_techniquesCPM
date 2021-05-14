#### Generation of supplementry material ####
library(tidyverse)
library(xtable)

setwd("/<YOURLOCALFILEPATH/Research_archive/Simulation_study/Analysis")



#### Supplementary Tables ####
# Binding the results

scenarios <- c('data_2_10_18.RDS','data_4_12_20.RDS','data_6_14_22.RDS','data_8_16_24.RDS', 'data_1_9_17.RDS','data_3_11_19.RDS','data_5_13_21.RDS','data_7_15_23.RDS')
for (i in 1:length(scenarios)){
  res[[i]]<- readRDS(scenarios[i])
}

results <- list()
sc_prev_0.3 <- c(2,4,6,8, 1,3,5,7)
sc_prev_0.1 <- c(10,12,14,16,9,11,13,15)

for (i in 1:length(res)) {
  results[[i]] <- res[[i]] %>% 
    mutate(prev = as_factor(if_else(scenario == paste0("scenario ", sc_prev_0.3[i]), 0.3,
                                    if_else(scenario == paste0("scenario ", sc_prev_0.1[i]), 0.1, 0.01)))) %>% 
    group_by(imbalance,model, prev) %>% 
    dplyr::summarize(Accuracy = median(as.numeric(as.character(accuracy))),
                     Sensitivity = median(as.numeric(as.character(sensitivity))),
                     Specificity = median(as.numeric(as.character(specificity))),
                     C_statistic = median(as.numeric(as.character(c_statistic))),
                     Calibration_intercept = median(as.numeric(as.character(cal_intercept))),
                     Calibration_slope = median(as.numeric(as.character(cal_slope)), na.rm = TRUE)) %>% 
    mutate(recal = if_else(str_detect(as.character(imbalance), "_"), "recal/threshold_move", 'no_recal')) %>% 
    mutate(imbalance = str_replace(imbalance, "_recal", "")) %>% 
    mutate(imbalance = str_replace(imbalance,"threshold_move", "unadjusted")) %>% 
    mutate(imbalance = factor(imbalance, levels = c("unadjusted", "RUS", "ROS", "SMOTE"), labels = c("Unadjusted", "RUS", "ROS", "SMOTE"))) %>% 
    mutate(model = factor(model, levels = c("ML", "RID", "RF"), labels = c("LR", "RID", "RF"))) %>% 
    mutate(recal = as_factor(recal)) %>% 
    dplyr::select(imbalance, recal, everything())
}

# Tables originals models

results_supplement <- list()

for (i in 1:length(results)){
  results_supplement[[i]] <- results[[i]] %>% 
    filter(recal == "no_recal") %>% 
    group_by(model, imbalance, prev) %>% 
    dplyr::summarize(Accuracy = median(Accuracy),
                   Sensitivity = median(Sensitivity),
                   Specificity = median(Specificity),
                   C_statistic = median(C_statistic),
                   Calibration_intercept = median(Calibration_intercept),
                   Calibration_slope = median(Calibration_slope))
}

names(results_supplement) <- c("sce_n5000_r3","sce_n5000_r6","sce_n5000_r12","sce_n5000_r24",
                               "sce_n2500_r3","sce_n2500_r6","sce_n2500_r12","sce_n2500_r24")

# Get Latex code for tables
for(i in 1:8){
results_supplement[[i]] %>% 
  dplyr::select(model, everything()) %>% 
  xtable::xtable()
}

# Tables re-calibrated models

results_supplement_recal <- list()

for (i in 1:length(results)){
  results_supplement_recal[[i]] <- results[[i]] %>% 
    filter(recal == "recal/threshold_move") %>% 
    group_by(model, imbalance, prev) %>% 
    dplyr::summarize(Accuracy = median(Accuracy),
                     Sensitivity = median(Sensitivity),
                     Specificity = median(Specificity),
                     C_statistic = median(C_statistic),
                     Calibration_intercept = median(Calibration_intercept),
                     Calibration_slope = median(Calibration_slope))
}


# Get Latex code for tables
for(i in 1:8){
  results_supplement_recal[[i]] %>% 
    dplyr::select(model, everything()) %>% 
    xtable::xtable()
}

#### Supplementary figures ####

scenario_001 <- c(18,20,22,24,17,19,21,23)

for(i in 1:8){
rus_c_statistic <- res[[i]] %>% 
  filter(scenario == paste0("scenario ", scenario_001[i])) %>% 
  filter(!str_detect(imbalance, "_")) %>% 
  mutate(model = factor(model, levels = c("ML", "RID", "RF"), labels = c("LR", "RID", "RF"))) %>%
  mutate(imbalance = factor(imbalance, levels = c("unadjusted", "RUS", "ROS", "SMOTE"), labels = c("Unadjusted", "RUS", "ROS", "SMOTE"))) %>% 
  ggplot(aes(x = imbalance, y = as.numeric(as.character(c_statistic)))) +
  geom_boxplot(outlier.shape = NA) +
  ylim(c(0.55, 0.8))+
  facet_wrap(~model) +
  ylab("C-statistic")

rus_c_intercept <- res[[i]] %>% 
  filter(scenario == paste0("scenario ", scenario_001[i])) %>% 
  filter(!str_detect(imbalance, "_")) %>% 
  mutate(model = factor(model, levels = c("ML", "RID", "RF"), labels = c("LR", "RID", "RF"))) %>%
  mutate(imbalance = factor(imbalance, levels = c("unadjusted", "RUS", "ROS", "SMOTE"), labels = c("Unadjusted", "RUS", "ROS", "SMOTE"))) %>% 
  ggplot(aes(x = imbalance, y = as.numeric(as.character(cal_intercept)))) +
  geom_boxplot(outlier.shape = NA) +
  ylim(c(-7.5, 1))+
  facet_wrap(~model)+
  ylab("Calibration intercept")

rus_comb <- cowplot::plot_grid(rus_c_intercept,
                               rus_c_statistic,
                               
                               ncol = 1)

ggsave(paste0("vari_RUS_",scenario_001[i],".png"), rus_comb)

rus_c_slope <- res[[i]] %>% 
  filter(scenario ==  paste0("scenario ", scenario_001[i])) %>% 
  filter(!str_detect(imbalance, "_")) %>% 
  mutate(model = factor(model, levels = c("ML", "RID", "RF"), labels = c("LR", "RID", "RF"))) %>%
  mutate(imbalance = factor(imbalance, levels = c("unadjusted", "RUS", "ROS", "SMOTE"), labels = c("Unadjusted", "RUS", "ROS", "SMOTE"))) %>% 
  ggplot(aes(x = imbalance, y = as.numeric(as.character(cal_slope)))) +
  geom_boxplot(outlier.shape = NA) +
  facet_wrap(~model)+
  ylim(c(0,3))+
  theme_bw(base_size = 11)+
  ylab("Calibration slope")

ggsave(paste0("vari_RUS_slope_",scenario_001[i],".png"), rus_c_slope)

}
