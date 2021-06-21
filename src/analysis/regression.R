library(stargazer)

# Estimate models

## Model 1

as.data.frame(data)

model_1 <- lm(rating_count_tot ~ price + user_rating + prime_genre + lang.num, data = data)


## Model 2

### Create dummy variable
data$free_app <- ifelse(data$price == 0, 1, 0)

### Estimate model 2
model_2 <- lm(rating_count_tot ~ free_app + user_rating + prime_genre + lang.num, data = data)


# Create regression table

stargazer(model_1, model_2,
          title = "Figure 1: Regression analysis",
          dep.var.caption = "Total Nr. of ratings",  
          dep.var.labels = "",  
          covariate.labels = c("Price"),  
          column.labels = c("Model 1", "Model 2"),
          notes.label = "Significance levels",  
          type="html",
          out="gen/analysis/regression.html" 
)
