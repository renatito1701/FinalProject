library(shiny)
library(ggplot2)
library(dplyr)


#first page
page_one <- tabPanel(
  "First Page", 
  titlePanel("Main factors contributing to Happiness"), 
  
  #sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "select_factor",
        label = "Factors",
        choices = c("Freedom", "GDP", "")
      )
    ),
    mainPanel(
      h3("Factors Correlating to Happiness"),
      plotOutput("freeplot")
    )
  )
)

#second page
page_two <- tabPanel(
  "Second Page", 
  titlePanel("Percentage of Poverty per County"),
  
  #sidebar layout
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        inputId = "age_group",
        label = "Age Group",
        choices = c("percadultpoverty", "percelderlypoverty") 
      ),
      radioButtons(
        inputId = "color",
        label = "color Separation",
        choices = c("white", "black") 
      )
    ),
    mainPanel(
      h3("Plot"),
      plotOutput("plot2")
    )
  )
)

# pages
ui <- navbarPage(
  "World Happiness Project",
  page_one,         
  page_two
)
