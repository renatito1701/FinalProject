library(ggplot2)
library(shiny)
library(dplyr)
library(countrycode)
library(ggrepel)

#question 2 wrangling
happ17 <- read.csv("data/2017.csv")
free_data <- select(happ17, Freedom, Happiness.Score, Trust..Government.Corruption.)
gdp_data <- select(happ17, Economy..GDP.per.Capita., Happiness.Score, Trust..Government.Corruption.)
health_data <- select(happ17, Health..Life.Expectancy., Happiness.Score, Trust..Government.Corruption.)


#question 1 wrangling
new <- happ17 %>%
  mutate(continent = countrycode(sourcevar = Country,
                                 origin = "country.name",
                                 destination = "continent")) %>%
  group_by(continent) %>%
  summarize(average_happy = mean(Happiness.Score),
            average_gdp = mean(Economy..GDP.per.Capita.),
            average_health = mean(Health..Life.Expectancy.),
            average_corrup = mean(Trust..Government.Corruption.)) %>%
  arrange(average_happy)


my_server <- function(input, output) {
  
  #plot for question 2
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
  
  #plot for question 1
  output$averagePlot <- renderPlot({
    
    
    if(input$extra_factor == "GDP") {
      ggplot(data = new) +
        geom_smooth(aes(x = average_happy, y = average_gdp )) +
        geom_point(aes(x = average_happy, y = average_gdp )) +
        geom_label_repel(mapping = aes(x = average_happy,
                                       y = average_gdp,
                                       label = paste(continent,", ", round(average_happy, digits = 3))))+
        labs(
          title = "Average Happiness Score by Continent: Economy", 
          x = "Average Happiness Score", 
          y = "GDP Score" 
        )
      
    } else if (input$extra_factor == "Life Expectancy") {
      ggplot(data = new) +
        geom_smooth(aes(x = average_happy, y = average_health )) +
        geom_point(aes(x = average_happy, y = average_health )) +
        geom_label_repel(mapping = aes(x = average_happy,
                                       y = average_health,
                                       label = paste(continent,", ", round(average_happy, digits = 3))))+
        labs(
          title = "Average Happiness Score by Continent: Life Expectancy", 
          x = "Average Happiness Score", 
          y = "Life Expectancy score" 
        )
    } else {
      ggplot(data = new) +
        geom_smooth(aes(x = average_happy, y = average_corrup )) +
        geom_point(aes(x = average_happy, y = average_corrup )) +
        geom_label_repel(mapping = aes(x = average_happy,
                                       y = average_corrup,
                                       label = paste(continent,", ", round(average_happy, digits = 3))))+
        labs(
          title = "Average Happiness Score by Continent: Government Trust", 
          x = "Average Happiness Score", 
          y = "Trust in Government" 
        )
    }
    
  })
  
}
