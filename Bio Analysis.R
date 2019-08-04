library(dplyr)
library(ggplot2)

#data cleaning
raw <- read.csv("Bio.csv")
raw$X <- NULL
raw$X.1 <- NULL
cleaned <- na.omit(raw)

#let's see the most efficient group size
#we want to find the average success rate of each group size
#we can use group by and summerise to get the avg success rate(Y) of each group size (X)

team_size <- group_by(cleaned, Players) %>%  
  summarise(runs = n())

#what if we do amount of wins(V)/attempts by group size(total ^), this will be more accurate
wins <- filter(cleaned, Win.Fail == "W")
teamsw <- group_by(wins, Players) %>%  
  summarise(wins = n())
efficiency = teamsw$wins / team_size$runs
team_size$wins <- teamsw$wins
team_size$efficiency <- efficiency