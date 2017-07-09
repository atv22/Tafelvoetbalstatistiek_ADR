server <- function(input, output,session) {

  
rv <- reactiveValues(score=paste("A 0","-","0 B"),
                       matches="")  
source("googlesheet_setup.r")
    
# tab1: New Match ---------------------------------------------------------
observeEvent(input$newMatch,{
  rv$matches <- sheet %>% gs_read("matches")
  df <- data.frame(match_id=max(matches$match_id)+1,
                   date=Sys.time(),
                   player_a1="testa1",
                   position_a1="voor",
                   player_a2="testa2",
                   position_a2="achter",
                   player_b1="testb1",
                   position_b1="achter",
                   player_b2="testa1",
                   position_b2="voor")
  gs_add_row(sheet,ws="matches",input=df[1,],verbose=F)
  rv$matches <- sheet %>% gs_read("matches")

  })


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
    }
  
  observeEvent(input$score_a1,{
    df <- data.frame(t = Sys.time(),match_id=max(rv$matches$match_id),score_a1=1,score_a2=0,score_b1=0,score_b2=0)
    gs_add_row(sheet,ws="scores",input=df[1,],verbose=F)
    scores <- sheet %>% gs_read("scores")
    RecalculateScore()
    Sys.sleep(1)
    rv$score <- paste("A", scores_match$team_a ,"-",scores_match$team_b,"B")
  })
  
  observeEvent(input$score_a2,{
    df <- data.frame(t = Sys.time(),match_id=max(rv$matches$match_id),score_a1=0,score_a2=1,score_b1=0,score_b2=0)
    gs_add_row(sheet,ws="scores",input=df[1,],verbose=F)
    scores <- sheet %>% gs_read("scores")
    RecalculateScore()
    Sys.sleep(1)
    rv$score <- paste("A", scores_match$team_a ,"-",scores_match$team_b,"B")
  })
  
  observeEvent(input$score_b1,{
    df <- data.frame(t = Sys.time(),match_id=max(rv$matches$match_id),score_a1=0,score_a2=0,score_b1=1,score_b2=0)
    gs_add_row(sheet,ws="scores",input=df[1,],verbose=F)
    scores <- sheet %>% gs_read("scores")
    RecalculateScore()
    Sys.sleep(1)
    rv$score <- paste("A", scores_match$team_a ,"-",scores_match$team_b,"B")
  })
    
  observeEvent(input$score_b2,{
    df <- data.frame(t = Sys.time(),match_id=max(rv$matches$match_id),score_a1=0,score_a2=0,score_b1=0,score_b2=1)
    gs_add_row(sheet,ws="scores",input=df[1,],verbose=F)
    scores <- sheet %>% gs_read("scores")
    RecalculateScore()
    rv$score <- paste("A", scores_match$team_a ,"-",scores_match$team_b,"B")
    Sys.sleep(1)
  })
    
output$score <- renderText(rv$score)

# tab 3: Add player -------------------------------------------------------


# tab 4: statistics -------------------------------------------------------


  
}
