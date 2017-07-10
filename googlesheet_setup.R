
# Initialise --------------------------------------------------------------


# Clear workspace (optional) and load packages
#rm(list=ls())
library(googlesheets)
library(dplyr)
library(DT)
# Set working directory
source("setwd.r")


# Load sheet --------------------------------------------------------------



#list <- gs_ls()
sheet_key <- read.csv("Data/googlesheet.csv")
sheet_key <- as.character(sheet_key[1,1])
sheet <- gs_key(sheet_key,lookup=FALSE, visibility = "private")

gs_ws_ls(sheet)

scores <- sheet %>% gs_read("scores")
matches <- sheet %>% gs_read("matches")
players <- sheet %>% gs_read("players")

list_players <- as.list(players$player_name)
names(list_players) <- players$player_name

list_positions <- as.list(c("voor","achter"))
names(list_positions) <- c("voor", "achter")

#Optional: test if input has worked
#summary(players)

#gs_add_row(sheet,ws="players",input=c("Thomas",0),verbose=F)
