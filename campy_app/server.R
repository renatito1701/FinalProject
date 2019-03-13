#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(ggplot2)
library(shiny)
library(dplyr)
happ17 <- read.csv("../data/2017.csv")
free_data <- select(happ17, Freedom, Happiness.Score, Trust..Government.Corruption.)
gdp_data <- select(happ17, Economy..GDP.per.Capita., Happiness.Score, Trust..Government.Corruption.)
health_data <- select(happ17, Health..Life.Expectancy., Happiness.Score, Trust..Government.Corruption.)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$freePlot <- renderPlot({
    
    if(input$select_factor == "Freedom") {
      ggplot(data = happ17) +
        geom_smooth(aes(x = Freedom, y = Happiness.Score)) +
        geom_point(aes(x = Freedom, y = Happiness.Score, color = Trust..Government.Corruption.)) +
        scale_color_gradient(low = "yellow", high = "blue") +
        labs(
          title = "Correlations: Happiness, Freedom, and Government Trust", 
          x = "Freedom", 
          y = "Happiness Score", # y-axis label (with units!)
          color = "Trust in Gov."
        )
    }
    else if (input$select_factor == "GDP") {
      ggplot(data = happ17) +
        geom_smooth(aes(x = Economy..GDP.per.Capita., y = Happiness.Score)) +
        geom_point(aes(x = Economy..GDP.per.Capita., y = Happiness.Score, color = Trust..Government.Corruption.)) +
        scale_color_gradient(low = "yellow", high = "blue") +
        labs(
          title = "Correlations: Happiness, GDP, and Government Trust", 
          x = "GDP", 
          y = "Happiness Score", # y-axis label (with units!)
          color = "Trust in Gov."
        )
    }
    else {
      ggplot(data = happ17) +
        geom_smooth(aes(x = Health..Life.Expectancy., y = Happiness.Score)) +
        geom_point(aes(x = Health..Life.Expectancy., y = Happiness.Score, color = Trust..Government.Corruption.)) +
        scale_color_gradient(low = "yellow", high = "blue") +
        labs(
          title = "Correlations: Happiness, Health, and Government Trust", 
          x = "Health", 
          y = "Happiness Score", # y-axis label (with units!)
          color = "Trust in Gov."
        )
    }
    
      
    
    
    
  })
  
})
