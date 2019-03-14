library(shiny)
library(ggplot2)
library(dplyr)

#first page
front_page <- tabPanel(
  "Overview", 
  titlePanel("World Happiness & Contributing Factors"),
  tags$br(),
  tags$h1(tags$strong("Project Overview")),
  tags$br(),

  tags$p("In our project we looked at the ",
    tags$a(href="https://www.kaggle.com/unsdsn/world-happiness", "world happiness datasets"), "from the website Kaggle. 
    The datasets given included a happiness score, happiness rank, and multiple contributing
    factors like GDP, freedom, generosity, government trust, ect. We will be using the
    2015, 2016, and 2017 happiness dataset. In our project we looked to answer two main questions:"),
  tags$br(),

  tags$ul(
    tags$li("What main factors help contribute to higher happiness scores in 2017"), 
    tags$li("What the average happiness score is by continent and or region?")
  )

  
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
      h4("What the main factors contributing to the happiness score?"),
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
        label = "Extra Factor",
        choices = c("GDP", "Life Expectancy", "Trust in Government") 
      )
    ),
    mainPanel(
      h3("Average Happiness by Continent"),
      h4("What the average happiness score is by continent and or region?"),
      plotOutput("averagePlot")
    )
  )
)

# pages
ui <- navbarPage( theme = "bootstrap.css",
  "World Happiness Project",
  front_page,         
  question_1,
  question_2
)