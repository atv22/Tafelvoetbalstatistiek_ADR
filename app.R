library(shiny)
library(dplyr)


# Define UI for application
source("ui.r")

# Define server logic
source("server.r")

# Run the application 
shinyApp(ui = ui, server = server)

