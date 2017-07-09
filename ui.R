source("firstPanel.r")
source("secondPanel.r")
source("thirdPanel.r")
source("fourthPanel.r")
ui <- 
  navbarPage("ADR Tafelvoetbalstatistiek",
             firstPanel,
             secondPanel,
             thirdPanel,
             fourthPanel
  )
