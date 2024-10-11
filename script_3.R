#activating repositories----
setRepositories()
#installing packages----
install.packages("readxl", dependencies = TRUE)
install.packages("tidyverse", dependencies = TRUE)
install.packages("writexl", dependencies = TRUE)
library(readxl)
library(tidyverse)
library(writexl)
#importing data from xl----
df <- read_excel("correlation.xlsx", range = "A1:F49")
View(df)
?writexl
write_xlsx(iris, "iris_dataset.xlsx")
#data transformation----
dplyr::tbl_df(iris) %>% print(n=20)
tibble::as_tibble(iris)
dplyr::glimpse(iris)
#pipe operator = ctrl+shift+m
summary(iris)
avg <- mean
iris%>%
  group_by(Species)%>%
  summarise(avg= mean(Sepal.Width))%>%
  arrange(avg)
#using nycflights13 data----
install.packages("nycflights13", dependencies = TRUE)

library(nycflights13)
nycflights13::flights
remove(df)
df <- flights
View(df)
summary(df)
