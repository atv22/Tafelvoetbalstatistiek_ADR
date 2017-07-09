secondPanel <- tabPanel("Keep score",
    fluidPage(
              # column 1 - team A 
              column(2,
              actionButton("score_a1", label = "Score a1"),
              br(),
              actionButton("score_a2", label = "Score a2")),
              
              column(2,h3(textOutput("score"))),
              
              column(2,
                     actionButton("score_b1", label = "Score b1"),
                     br(),
                     actionButton("score_b2", label = "Score b2"))
              )
)