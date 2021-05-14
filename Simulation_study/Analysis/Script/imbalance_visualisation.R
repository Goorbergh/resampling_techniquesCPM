# In this script, the Figure (Figure 1) visualizing different resampling methods are generated.


source("/<YOURLOCALFILEPATH>/Research_archive/Simulation_study/Simulation/Script/data_generation.R")
source("/<YOURLOCALFILEPATH>/Research_archive/Simulation_study/Simulation/Script/imbalance_functions.R")
source("/<YOURLOCALFILEPATH>/Research_archive/Simulation_study/Simulation/Script/performance_measures_wo_eci.R") 
simlist_total <- readRDS("/Users/ruben/GitHub/Research_archive/Simulation_study/Simulation/Script/simlist_total.RDS")

library(tidyverse)
library(MASS)
set.seed(123)



simlist <- simlist_total$`scenario 17`$development # select scenario with prev = 0.01, R = 3 and N = 2500
data <- gen_TOTAL(simlist_total$`scenario 17`$development) # Generate data
ALL_data <- bal_data(data[[1]]) # Generate resampled data


plot_titles <- c("Unadjusted data", "ROS data", "RUS data", "SMOTE data")



###### SMOTE PLOT ####
smote_data <- ALL_data$SMOTE 

min_cases <- ALL_data$unadjusted %>% 
  filter(y == '1') 


smote_plot <- ggplot(data = smote_data, aes(x = V2, y = V3)) +
  layer(geom = 'point', stat = 'identity', position = 'identity', 
        data = smote_data %>%  
          dplyr::filter(y == '0'),
        params = list(size = 0.5), aes(color = 'Majority class')) +
  layer(geom = 'point', stat = 'sum', position = 'identity', 
        data = smote_data %>%  
          filter(y == '1'),
        params = list(size = 0.5 ), aes(color = 'Synthetic minority data')) +
  layer(geom = 'point', stat = 'sum', position = 'identity', 
        data = min_cases,
        params = list(size = 0.5 ), aes(color = 'Original minority data')) +
  scale_color_manual(values=c("Red","#000000","#777A8E")) +
  xlab("Variable 1") +
  ylab("Variable 2") +
  xlim(c(-4, 4)) +
  ylim(c(-4, 4)) +
  theme_bw(base_size = 11)+
  ggtitle(label = paste0(plot_titles[4])) +
  theme(plot.title = element_text(hjust=0.5, size = 14, face = "bold")) 


#### ROS ####
ros_plot <- ggplot(data = ALL_data$ROS,aes(x = V2, y = V3)) +
  layer(geom = 'point', stat = 'sum', position = 'identity', 
        data = ALL_data$ROS %>%  
          filter(y == '0'),
        params = list( size = 0.5), aes(color = 'Majority class')) +
  layer(geom = 'point', stat = 'sum', position = 'identity', 
        data = ALL_data$ROS %>%  
          filter(y == '1'),
        aes(color = "Resampled minority class")) +
  layer(geom = 'point', stat = 'identity', position = 'identity', 
        data = min_cases,
        params = list( size = 0.5),
        aes(color = "Original minority class")) +
  xlab("Variable 1") +
  ylab("Variable 2") +
  xlim(c(-4, 4)) +
  ylim(c(-4, 4)) +
  theme_bw(base_size = 11)+
  ggtitle(label = paste0(plot_titles[2])) +
  theme(plot.title = element_text(hjust=0.5, size = 14, face = "bold")) +
    scale_size_area(breaks  = c(1,100),
                    labels = c("1", "~100")) +
    labs(size = "Number of observations", colour = "Class")+
    scale_color_manual(values=c("red","#000000","#777A8E"),
                       aesthetics = c("colour"))





#### RUS plot ####
rus_plot <- ggplot(data = ALL_data$RUS,aes(x = V2, y = V3)) +
    layer(geom = 'point', stat = 'identity', position = 'identity', 
          data = ALL_data$RUS %>%  
            filter(y == '0'),
          params = list( size = 0.5), aes(color = 'Majority class')) +
    layer(geom = 'point', stat = 'identity', position = 'identity', 
          data = ALL_data$RUS %>%  
            filter(y == '1'),
          params = list( size = 0.5),
          aes(color = "Minority class")) +
    xlab("Variable 1") +
    ylab("Variable 2") +
    xlim(c(-4, 4)) +
    ylim(c(-4, 4)) +
    theme_bw(base_size = 11)+
    ggtitle(label = paste0(plot_titles[3])) +
    theme(plot.title = element_text(hjust=0.5, size = 14, face = "bold")) +
    scale_size_area(breaks  = c(1,~100))+
    scale_color_manual(values=c("red","#000000"))

#### Unadjusted plot ####
unad_plot <- ggplot(data = ALL_data$unadjusted,aes(x = V2, y = V3)) +
  layer(geom = 'point', stat = 'identity', position = 'identity', 
        data = ALL_data$unadjusted %>%  
          filter(y == '0'),
        params = list( size = 0.5), aes(color = 'Majority class')) +
  layer(geom = 'point', stat = 'identity', position = 'identity', 
        data = ALL_data$unadjusted %>%  
          filter(y == '1'),
        params = list( size = 0.5),
        aes(color = "Minority class")) +
  xlab("Variable 1") +
  ylab("Variable 2") +
  xlim(c(-4, 4)) +
  ylim(c(-4, 4)) +
  ggtitle(label = paste0(plot_titles[1])) +
  theme_bw(base_size = 11)+
  theme(plot.title = element_text(hjust=0.5, size = 14, face = "bold")) +
  scale_size_area(breaks  = c(1,100))+
  scale_color_manual(values=c("red","#000000"))


## Combining plots
library(cowplot)
theme_set(theme_bw(base_size = 11))
p <- cowplot::plot_grid(unad_plot+ theme(legend.position="none"),
                        rus_plot+ theme(legend.position="none"),
                        ros_plot+ theme(legend.position="none"),
                        smote_plot+ theme(legend.position="none"))

legend <- cowplot::get_legend(
  # create some space to the left of the legend
  ros_plot + 
    guides(color = guide_legend(nrow = 1)) +
    theme(legend.position = 'bottom')
)

plot_001 <- cowplot::plot_grid(p, legend, ncol = 1,rel_heights = c(0.5, .1))

ggsave2("Output/plot_imbalance_001.jpeg", plot_001)







