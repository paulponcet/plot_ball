
library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Draw a ball in the 2-dimensional space"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("radius",
                  "Radius:",
                  min = 1,
                  max = 100,
                  value = 40), 
      sliderInput("x", 
                  "Center, x coordinate:", 
                  min = 0, 
                  max = 100, 
                  value = 50), 
      sliderInput("y", 
                  "Center, y coordinate:", 
                  min = 0, 
                  max = 100, 
                  value = 50), 
      sliderInput("p", 
                  "p:", 
                  min = 0.5, 
                  max = 10,
                  step = 0.5, 
                  value = 2) #, 
      #sliderInput("resolution", 
      #            "Resolution:", 
      #            min = 100, 
      #            max = 2000, 
      #            value = 100)
      ),
    
    mainPanel(
      tabsetPanel(id = "tabs", selected = "d", 
                  tabPanel("Usual metric", value = "d", 
                           uiOutput("text"), 
                           uiOutput("ggvis_ui"),
                           ggvisOutput("ggvis")),
                  tabPanel("Zeroth intrinsic metric", value = "d0", 
                           uiOutput("text0"), 
                           uiOutput("ggvis0_ui"),
                           ggvisOutput("ggvis0")),
                  tabPanel("First intrinsic metric", value = "d1", 
                           uiOutput("text1"), 
                           uiOutput("ggvis1_ui"),
                           ggvisOutput("ggvis1")), 
                  tabPanel("Second intrinsic metric", value = "d2", 
                           uiOutput("text2"), 
                           uiOutput("ggvis2_ui"), 
                           ggvisOutput("ggvis2"))
      )      
    )
  )
))