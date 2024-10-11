# activating respositories-----
setRepositories()
#installing packages----
install.packages("readxl", dependencies = TRUE)
library(readxl)
install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)
install.packages("corrplot", dependencies = TRUE)
library(corrplot)
#importing data----
df <- iris
#normality check----
#using histogram
hist(iris$Sepal.Length) #sepal length is not normal

hist(iris$Sepal.Width) #sepal width is normal 

hist(iris$Petal.Length) #petal length is not normal

hist(iris$Petal.Width) #petal width is not normal 
#qqnorm
qqnorm(iris$Sepal.Length) #sepal length is not normal

qqnorm(iris$Sepal.Width) #sepal width is normal 

qqnorm(iris$Petal.Length) #petal length is not normal

qqnorm(iris$Petal.Width) #petal width is not normal

#using shapiro wilk test
shapiro.test(iris$Sepal.Length) #sepal length is not normal


shapiro.test(iris$Sepal.Width) #sepal width is normal 


shapiro.test(iris$Petal.Length) #petal length is not normal


shapiro.test(iris$Petal.Width) #petal width is not normal

#correlation using iris data ----
df2 <- select(df, Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
df3 <- cor(df2)
corrplot(df3)
corrplot(df3, method = "shade")
corrplot(df3, method = "shade", type = "upper")
corrplot(df3, method = "ellipse", type = "lower")
corrplot(df3, method = "shade", type = "full", order = "hclust", addrect = 3)
