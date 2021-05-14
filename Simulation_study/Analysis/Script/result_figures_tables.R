########################################
########### Analysis ###################
########################################
library(tidyverse)
library(xtable)
setwd("/<YOURLOCALFILEPATH/Research_archive/Simulation_study/Analysis")

scenarios <- c('data_2_10_18.RDS','data_4_12_20.RDS','data_6_14_22.RDS','data_8_16_24.RDS', 'data_1_9_17.RDS','data_3_11_19.RDS','data_5_13_21.RDS','data_7_15_23.RDS')

# Import results
res <- list()
for (i in 1:length(scenarios)){
  res[[i]]<- readRDS(paste0("Data/",scenarios[i]))
}
########################################
########### Tables #####################
########################################

# Summarize results
results <- list()
sc_prev_0.3 <- c(2,4,6,8, 1,3,5,7) # Store scenarios with prevalence = 0.3
sc_prev_0.1 <- c(10,12,14,16,9,11,13,15) # Store scenarios with prevalence = 0.1

for (i in 1:length(res)) {
  results[[i]] <- res[[i]] %>% 
    mutate(prev = as_factor(if_else(scenario == paste0("scenario ", sc_prev_0.3[i]), 0.3, # Create variable indicated target prevalence
                                    if_else(scenario == paste0("scenario ", sc_prev_0.1[i]), 0.1, 0.01)))) %>% 
    group_by(imbalance,model, prev) %>%  #
    dplyr::summarize(Accuracy = median(as.numeric(as.character(accuracy))),
                     Sensitivity = median(as.numeric(as.character(sensitivity))),
                     Specificity = median(as.numeric(as.character(specificity))),
                     F1 = mean(as.numeric(as.character(F1))),
                     C_statistic = median(as.numeric(as.character(c_statistic))),
                     Calibration_intercept = median(as.numeric(as.character(cal_intercept))),
                     Calibration_slope = median(as.numeric(as.character(cal_slope)), na.rm = TRUE)) %>% 
    mutate(recal = if_else(str_detect(as.character(imbalance), "_"), "recal/threshold_move", 'no_recal')) %>% # create variable indicating if the model is recalirated
    mutate(imbalance = str_replace(imbalance, "_recal", "")) %>% # Create variable indicating obnly imbalance
    mutate(imbalance = str_replace(imbalance,"threshold_move", "unadjusted")) %>% 
    mutate(imbalance = factor(imbalance, levels = c("unadjusted", "RUS", "ROS", "SMOTE"), labels = c("Unadjusted", "RUS", "ROS", "SMOTE"))) %>% 
    mutate(model = factor(model, levels = c("ML", "RID", "RF"), labels = c("LR", "RID", "RF"))) %>% 
    mutate(recal = as_factor(recal)) %>% 
    dplyr::select(imbalance, recal, everything())
}

# Binding all results in one data frame
results_2 <- rbind(results[[1]],results[[2]],results[[3]],results[[4]],
                   results[[5]],results[[6]],results[[7]],results[[8]])

# Creating table with performance of all original models (Table 4 in paper)
results_final <- results_2 %>% 
  filter(recal == "no_recal") %>% 
  group_by(model, imbalance, prev) %>% 
  dplyr::summarize(Accuracy = mean(Accuracy),
                   Sensitivity = mean(Sensitivity),
                   Specificity = mean(Specificity),
                   C_statistic = mean(C_statistic),
                   Calibration_intercept = mean(Calibration_intercept),
                   Calibration_slope = mean(Calibration_slope))
 

results_final %>% 
  select(model, everything()) %>% 
    xtable::xtable()

# Creating table with performance of all recalibrated/threshold moved models (Table 5 in paper)
results_recal <- results_2 %>% 
  filter(recal == "recal/threshold_move") %>% 
  group_by(model, imbalance, prev) %>% 
  
  dplyr::summarize(Accuracy = mean(Accuracy),
                   Sensitivity = mean(Sensitivity),
                   Specificity = mean(Specificity),
                   C_statistic = mean(C_statistic),
                   Calibration_intercept = mean(Calibration_intercept),
                   Calibration_slope = mean(Calibration_slope))

results_recal %>% 
  dplyr::select(model, everything()) %>% 
  xtable::xtable()

########################################
############## Figures #################
########################################

theme_set(theme_bw(base_size = 11))

### Plot 1: effect data adjustment on performance ####
c_statistic <- results[[3]] %>% 
  filter(recal == "no_recal") %>% 
  ggplot(aes(y = C_statistic, x = prev, col = imbalance)) +
  geom_point() +
  geom_line(aes(group = imbalance)) +
  ylim(c(0.6,0.8))+
  facet_wrap(~model, nrow = 3, ncol = 1)  +
  xlab("Prevalence")+
  ylab("C-statistic") +
  ggtitle("C-statistic")+
  theme(plot.title = element_text(hjust=0.5, size = 14, face = "bold")) 

c_intercept <- results[[3]] %>% 
  filter(recal == "no_recal") %>% 
  ggplot(aes(y = Calibration_intercept, x = prev, col = imbalance)) +
  geom_point() +
  geom_line(aes(group = imbalance)) +
  facet_wrap(~model, nrow = 3, ncol = 1) +
  geom_hline(aes(yintercept = 0, linetype = 'Ideal intercept'))+
  scale_linetype_manual(name = "",values = 'dotted')+
  xlab("Prevalence")+
  ylab("Calibration intercept")+
  ylim(c(-6, 3))+
  ggtitle("Calibration intercept")+
  theme(plot.title = element_text(hjust=0.5, size = 14, face = "bold"))

c_slope <- results[[3]] %>% 
  filter(recal == "no_recal") %>% 
  ggplot(aes(y = Calibration_slope, x = prev, col = imbalance)) +
  geom_point() +
  geom_line(aes(group = imbalance)) +
  facet_wrap(~model, nrow = 3, ncol = 1) +
  geom_hline(aes(yintercept = 1, linetype = 'Ideal intercept/slope'))+
  scale_linetype_manual(name = "",values = 'dotted')+
  xlab("Prevalence")+
  ylab("Calibration slope")+
  ylim(c(0, 2.5))+
  ggtitle("Calibration slope")+
  theme(plot.title = element_text(hjust=0.5, size = 14, face = "bold"))



legend<- cowplot::get_legend(
  # create some space to the left of the legend
  c_slope + 
    guides(color = guide_legend(nrow = 1)) +
    theme(legend.position = 'bottom')
)

grid<- cowplot::plot_grid(
  c_intercept + theme(legend.position="none"),
  c_statistic + theme(legend.position="none"),
  c_slope+  theme(legend.position="none"), ncol = 3)

grid<- cowplot::plot_grid(grid, legend, ncol = 1,rel_heights = c(0.5, .1))

ggsave("Output/performance_grid.jpeg", grid)

#### Plot 2: effect of recalibration ####
c_intercept_recal <- results[[3]] %>% 
  filter(recal == "recal/threshold_move") %>% 
  mutate(model = paste(model, "recalibrated")) %>% 
  mutate(model = factor(model, levels = c("LR recalibrated", "RID recalibrated", "RF recalibrated"))) %>% 
  ggplot(aes(y = Calibration_intercept, x = prev, col = imbalance)) +
  geom_point() +
  geom_line(aes(group = imbalance)) +
  facet_wrap(~model, nrow = 3, ncol = 1) +
  geom_hline(aes(yintercept = 0, linetype = 'Ideal intercept'))+
  scale_linetype_manual(name = "",values = 'dotted')+
  xlab("Prevalence")+
  ylim(c(-6, 3))+
  ylab("Calibration intercept")+
  ggtitle("Calibration intercept")+
  theme(plot.title = element_text(hjust=0.5, size = 14, face = "bold"))


c_statistic_recal <- results[[3]] %>% 
  filter(recal == "recal/threshold_move") %>% 
  mutate(model = paste(model, "recalibrated")) %>% 
  mutate(model = factor(model, levels = c("LR recalibrated", "RID recalibrated", "RF recalibrated"))) %>% 
  ggplot(aes(y = C_statistic, x = prev, col = imbalance)) +
  geom_point() +
  geom_line(aes(group = imbalance)) +
  facet_wrap(~model, nrow = 3, ncol = 1)  +
  xlab("Prevalence")+
  ylab("C-statistic") +
  ylim(c(0.6,0.8))+
  ggtitle("C-statistic")+
  theme(plot.title = element_text(hjust=0.5, size = 14, face = "bold")) 



c_slope_recal <- results[[3]] %>% 
  filter(recal == "recal/threshold_move") %>% 
  mutate(model = paste(model, "recalibrated")) %>% 
  mutate(model = factor(model, levels = c("LR recalibrated", "RID recalibrated", "RF recalibrated"))) %>% 
  ggplot(aes(y = Calibration_slope, x = prev, col = imbalance)) +
  geom_point() +
  geom_line(aes(group = imbalance)) +
  facet_wrap(~model, nrow = 3, ncol = 1) +
  geom_hline(aes(yintercept = 1, linetype = 'Ideal intercept/slope'))+
  scale_linetype_manual(name = "",values = 'dotted')+
  xlab("Prevalence")+
  ylab("Calibration slope")+
  ylim(c(0, 2.5))+
  ggtitle("Calibration slope")+
  theme(plot.title = element_text(hjust=0.5, size = 14, face = "bold"))



legend_recal<- cowplot::get_legend(
  # create some space to the left of the legend
  c_slope_recal + 
    guides(color = guide_legend(nrow = 1)) +
    theme(legend.position = 'bottom')
)

grid_recal<- cowplot::plot_grid(
  c_intercept_recal + theme(legend.position="none"),
  c_statistic_recal + theme(legend.position="none"),
  c_slope_recal+  theme(legend.position="none"), ncol = 3)

grid_recal<- cowplot::plot_grid(grid_recal, legend_recal, ncol = 1,rel_heights = c(0.5, .1))

ggsave("Output/performance_grid_recal.jpeg", grid_recal)



## Plot 3: variability RUS with low prevalence ##
rus_c_statistic <- res[[3]] %>% 
  filter(scenario == 'scenario 22') %>% 
  filter(!str_detect(imbalance, "_")) %>% 
  mutate(model = factor(model, levels = c("ML", "RID", "RF"), labels = c("LR", "RID", "RF"))) %>%
  mutate(imbalance = factor(imbalance, levels = c("unadjusted", "RUS", "ROS", "SMOTE"), labels = c("Unadjusted", "RUS", "ROS", "SMOTE"))) %>% 
  ggplot(aes(x = imbalance, y = as.numeric(as.character(c_statistic)))) +
  
  #geom_quasirandom(method = "quasirandom", alpha = 0.05, color = 'red')+
  geom_boxplot(outlier.shape = NA) +
  ylim(c(0.55, 0.8))+
  facet_wrap(~model) +
  ylab("C-statistic")

rus_c_intercept <- res[[3]] %>% 
  filter(scenario == 'scenario 22') %>% 
  
  filter(!str_detect(imbalance, "_")) %>% 
  mutate(model = factor(model, levels = c("ML", "RID", "RF"), labels = c("LR", "RID", "RF"))) %>%
  mutate(imbalance = factor(imbalance, levels = c("unadjusted", "RUS", "ROS", "SMOTE"), labels = c("Unadjusted", "RUS", "ROS", "SMOTE"))) %>% 
  ggplot(aes(x = imbalance, y = as.numeric(as.character(cal_intercept)))) +
  
  #geom_quasirandom(method = "quasirandom", alpha = 0.05, color = 'red')+
  geom_boxplot(outlier.shape = NA) +
  facet_wrap(~model)+
  ylab("Calibration intercept")

rus_comb <- cowplot::plot_grid(rus_c_intercept,
                               rus_c_statistic,
                               
                               ncol = 1)

ggsave("Output/vari_RUS.png", rus_comb)
rus_c_slope <- res[[3]] %>% 
  filter(scenario == 'scenario 22') %>% 
  filter(!str_detect(imbalance, "_")) %>% 
  mutate(model = factor(model, levels = c("ML", "RID", "RF"), labels = c("LR", "RID", "RF"))) %>%
  mutate(imbalance = factor(imbalance, levels = c("unadjusted", "RUS", "ROS", "SMOTE"), labels = c("Unadjusted", "RUS", "ROS", "SMOTE"))) %>% 
  ggplot(aes(x = imbalance, y = as.numeric(as.character(cal_slope)))) +
  #geom_quasirandom(method = "quasirandom", alpha = 0.05, color = 'red')+
  geom_boxplot(outlier.shape = NA) +
  facet_wrap(~model)+
  ylim(c(0,3))+
  theme_bw(base_size = 11)+
  ylab("Calibration slope")

ggsave("Output/vari_RUS_slope.png", rus_c_slope)

