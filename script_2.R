#to activate repositories----
setRepositories()
install.packages("readxl", dependencies = TRUE)
library(readxl)
install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)
install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)
#plotting using ggplot2----
data()
data(iris)
View(iris)
force(iris)
head(iris)
tail(iris)
print(iris, n=10)
summary(iris)m
ggplot(data=iris, mapping = aes(x=Sepal.Length, y=Petal.Length))+geom_point()
ggplot(data=iris, mapping = aes(x=Sepal.Length, y=Petal.Length, col=Species))+geom_point()
ggplot(data=iris, mapping = aes(x=Sepal.Length, y=Petal.Length, col=Species))+geom_point()+geom_ribbon()
data(volcano)

ggplot(data=iris, mapping = aes(x=Sepal.Length, y=Petal.Length, col=Species))+geom_point(size=4)+
  theme_classic()+labs(title = "YPDC's Second Plot", x="Sepan Length", y="Petal Length")+
  facet_wrap(~Species)+geom_line()


p <- ggplot(data=iris, mapping = aes(x=Sepal.Length, y=Petal.Length, col=Species))+geom_point(size=4)+
  theme_classic()+labs(title = "YPDC's Second Plot", x="Sepan Length", y="Petal Length")+
  facet_wrap(~Species)+geom_line()

#pdf men save krnay ka tareeka

ggsave("YPDC's 4th Plot.pdf", plot = p, width = 8, height = 11, units = "in" )


#png men save krnay ka tareeka 

ggsave("YPDC's 5th Plot.png", plot = p, width = 8, height = 11, units = "in", dpi = 300)


m <- p






