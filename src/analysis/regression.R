library(ggplot2)
library(broom)
library(dplyr)

##Model 1
#Linear Regression
df <-read.csv(file = 'data.csv')
model1 <- lm(rating_count_tot ~ price + user_rating + prime_genre, data=df)
summary(model1)

##Model 2
#Create dummy for multi_language
df$multi_lang <- ifelse(df$lang.num > 1, 1, 0)

#Linear Regression
model2 <- lm(rating_count_tot ~ price + user_rating + prime_genre + multi_lang, data=df)
summary(model2)

#Load package and display table of results
install.packages("stargazer")
library(stargazer)

models <- list(model1, model2)
stargazer(models,
          type = "html",
          keep.stat = c("n","rsq"))