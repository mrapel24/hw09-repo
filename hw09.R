# HW 09 

#Packages 
library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)

#Upload datafile 
dat <- read.csv("SP2022.csv")

#In a single piping operation, you will generate a table that summarizes the
#total number of courses for each day of the week for Spring 2022.

courses_by_day <- dat %>%
  mutate(M = str_detect(Days, "M"),
         T = str_detect(Days, "T"),
         W = str_detect(Days, "W"),
         R = str_detect(Days, "R"),
         F = str_detect(Days, "F")) %>%
  pivot_longer( cols = c(M, T, W, R, F), names_to = "Day", 
                values_to = "on_day") %>%
  mutate(Day = factor(Day, levels = c("M", "T", "W", "R", "F")) %>%
  group_by(Day) %>%
  summarise(Sum = sum(on_day), na.rm = TRUE)
  

  
  
  