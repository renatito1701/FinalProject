library(shiny)
library(ggplot2)
library(dplyr)

#second page
front_page <- tabPanel(
  "Overview", 
  titlePanel("Project overview")
  
)


#first interactive page
question_2 <- tabPanel(
  "Second Question", 
  titlePanel("Main factors contributing to Happiness"), 
  
  #sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "select_factor",
        label = "Factors",
        choices = c("Freedom", "GDP", "Health")
      )
    ),
    mainPanel(
      h3("Factors Correlating to Happiness"),
      plotOutput("freePlot")
    )
  )
)

#second interative page
question_1 <- tabPanel(
  "First Question", 
  titlePanel("Average Happiness Scores per Continent"),
  
  #sidebar layout
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        inputId = "extra_factor",
        label = "extra factor",
        choices = c("GDP", "Life Expectancy", "Trust in Government") 
      )
    ),
    mainPanel(
      h3("Average Happiness by Continent"),
      plotOutput("averagePlot")
    )
  )
)

# pages
ui <- navbarPage(
  "World Happiness Project",
  front_page,         
  question_1,
  question_2
)
