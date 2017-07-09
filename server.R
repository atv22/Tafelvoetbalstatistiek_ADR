server <- function(input, output,session) {
source("googlesheet_setup.r")
  
  rv <- reactiveValues(score=paste("A 0","-","0 B"))  
  
# tab1: New Match ---------------------------------------------------------



# tab 2: Keep score -------------------------------------------------------
  scores_match <- scores %>%
    filter(match_id==max(match_id)) %>%
    select(player_a1,player_a2,player_b1,player_b2)%>%
    summarise_all(funs(sum))%>%
    mutate(team_a= player_a1+player_a2, team_b=player_b1+player_b2)
  
  RecalculateScore <- function(){
    scores_match <- scores %>%
      filter(match_id==max(match_id)) %>%
      select(player_a1,player_a2,player_b1,player_b2)%>%
      summarise_all(funs(sum))%>%
      mutate(team_a= player_a1+player_a2, team_b=player_b1+player_b2)
    rv$score <- paste("A", scores_match$team_a ,"-",scores_match$team_b,"B")
    }
  
  observeEvent(input$score_a1,{
    df <- data.frame(t = Sys.time(),match_id=0,score_a1=1,score_a2=0,score_b1=0,score_b2=0)
    gs_add_row(sheet,ws="scores",input=df[1,],verbose=F)
    scores <- sheet %>% gs_read("scores")
    RecalculateScore()
  })
  
  observeEvent(input$score_a2,{
    df <- data.frame(t = Sys.time(),match_id=0,score_a1=0,score_a2=1,score_b1=0,score_b2=0)
    gs_add_row(sheet,ws="scores",input=df[1,],verbose=F)
    scores <- sheet %>% gs_read("scores")
    RecalculateScore()
  })
  
  observeEvent(input$score_b1,{
    df <- data.frame(t = Sys.time(),match_id=0,score_a1=0,score_a2=0,score_b1=1,score_b2=0)
    gs_add_row(sheet,ws="scores",input=df[1,],verbose=F)
    scores <- sheet %>% gs_read("scores")
    RecalculateScore()
  })
    
  observeEvent(input$score_b2,{
    df <- data.frame(t = Sys.time(),match_id=0,score_a1=0,score_a2=0,score_b1=0,score_b2=1)
    gs_add_row(sheet,ws="scores",input=df[1,],verbose=F)
    scores <- sheet %>% gs_read("scores")
    RecalculateScore()
  })
    
observe({
 output$score <- renderText(rv$score) 
})  


# tab 3: Add player -------------------------------------------------------


# tab 4: statistics -------------------------------------------------------


  
}
