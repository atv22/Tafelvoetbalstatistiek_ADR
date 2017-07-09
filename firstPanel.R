firstPanel <- tabPanel("New match",
    fluidPage(
      column(2,
      selectInput("select", label = h3("Select box"), 
                         choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
                         selected = 1),
      actionButton("newMatch", label = "Start new match"))
    )
)

