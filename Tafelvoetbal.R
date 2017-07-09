rm(list=ls())
library(googlesheets)
library(dplyr)

#list <- gs_ls()
test <- gs_key("1eW9bnLfGTGxKAP0agd-DmjTRCMom2AQW3rsnvNOmAIs",lookup=FALSE, visibility = "private")

gs_ws_ls(test)

test_data <- test %>% gs_read("wedstrijden")

summary(test_data)