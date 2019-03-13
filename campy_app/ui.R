#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)



# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Contributing Factors to Happiness"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("select_factor", 
                  ("Select Contributing Factor"), 
                  choices = c("Freedom", 
                              "Health",
                              "GDP"
                  ),
                  selected = free_data)),
    
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("freePlot")
    )
  )
)
)
