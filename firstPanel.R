firstPanel <- tabPanel("New match",
    fluidPage(
      column(2,
      selectInput("selecta1", label = h3("Select a1"), 
                         choices = list_players, 
                         selected = "Dave"),
      selectInput("selecta2", label = h3("Select a2"), 
                  choices = list_players, 
                  selected = "Dave"),
      selectInput("selectb1", label = h3("Select b1"), 
                  choices = list_players, 
                  selected = "Dave"),
      selectInput("selectb2", label = h3("Select b2"), 
                  choices = list_players, 
                  selected = "Dave")),
      column(2,
             selectInput("selecta1_pos", label = h3("Select position a1"), 
                         choices = list_positions, 
                         selected = "voor"),
             selectInput("selecta2_pos", label = h3("Select position a2"), 
                         choices = list_positions, 
                         selected = "achter"),
             selectInput("selectb1_pos", label = h3("Select position b1"), 
                         choices = list_positions, 
                         selected = "voor"),
             selectInput("selectb2_pos", label = h3("Select position b2"), 
                         choices = list_positions, 
                         selected = "achter"),
                    
      actionButton("newMatch", label = "Start new match")       
             )
      
      
      
    )
)

