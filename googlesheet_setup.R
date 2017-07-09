
# Initialise --------------------------------------------------------------


# Clear workspace (optional) and load packages
#rm(list=ls())
library(googlesheets)
library(dplyr)
library(DT)
# Set working directory
setwd("C:/Users/Arthur/Dropbox/Apps/Tafelvoetbalstatistiek_ADR")


# Load sheet --------------------------------------------------------------



#list <- gs_ls()
sheet_key <- read.csv("Data/googlesheet.csv")
sheet_key <- as.character(sheet_key[1,1])
sheet <- gs_key(sheet_key,lookup=FALSE, visibility = "private")

gs_ws_ls(sheet)

scores <- sheet %>% gs_read("scores")
matches <- sheet %>% gs_read("matches")
players <- sheet %>% gs_read("players")

#Optional: test if input has worked
#summary(players)

#gs_add_row(sheet,ws="players",input=c("Thomas",0),verbose=F)