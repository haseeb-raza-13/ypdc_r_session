#activating repositories----
setRepositories()
#installing packages----
install.packages("readxl", dependencies = TRUE)
install.packages("tidyverse", dependencies = TRUE)
install.packages("writexl", dependencies = TRUE) #already covered
library(readxl)
library(tidyverse)
library(writexl) #already covered
#importing data from xl----
df <- read_excel("correlation.xlsx", range = "A1:F49")
View(df)
?writexl
write_xlsx(iris, "iris_dataset.xlsx")
#data transformation----
dplyr::tbl_df(iris) %>% print(n=20)
tibble::as_tibble(iris)
dplyr::glimpse(iris)
#pipe operator = ctrl+shift+m #short key for pipe operator
summary(iris)
avg <- mean
iris%>%
  group_by(Species)%>%
  summarise(avg= mean(Sepal.Width))%>%
  arrange(avg)

iris%>%
  group_by(Species)%>%
  summarise(avg= mean(Sepal.Width))%>%
  arrange(desc(avg)) #to arrange averages in desc order 

#using nycflights13 data----
install.packages("nycflights13", dependencies = TRUE)

library(nycflights13)
nycflights13::flights
remove(df) # it was used to remove iris data set 
df <- flights
View(df)
summary(df)
glimpse(df)
#filtering data set----
january <- filter(df, month==1)
feb <- filter(df, month==2)
march <- filter(df, month==3, day==1) 
april <- filter(df, month==4 , day==1)
jan_feb <- filter(df, month==1,2) #wrong command 

jan_feb <- filter(df, month==1&2) #conditions on both sides should be fulfilled 

jan_feb <- filter(df, month %in% c(1,2))

jan_feb_mar <- filter(df, month %in% c(1,2) | month==3)

jan_feb <- filter(df, month == 1 | month==2)

jan_feb_mar2 <- filter(df,  month==3 | month %in% c(1,2) )

df1 <- filter(df, dest == "IAH" | dest == "HOU")
df1 <- filter(df, dest %in% c("IAH", "HOU"))


df2 <- filter(df, month >= 7, month <= 9) #for month 7,8 and 9 

df2 <- filter(df, month == 7 | month == 9)#for month 7 and 9

df2 <- filter(df, month == c(7:9)) #wrong command 

#using select for transformation----
df1 <- select(df, dep_time, sched_dep_time,arr_time,sched_arr_time)
View(df1)
df2 <- select(df,contains("time"))
View(df2)
df3 <- select(df, ends_with("lay"))
View(df3)

#data transformation practice using mindfulness data----
library(readr)
df <- read_csv("mindfulness.csv")
View(df)
summary(df)
unique(df$age)
unique(df$gender)
df %>% select(contains("mind"))
df %>% mutate(mindfulness=rowSums(select(.,contains("mind"))))
# mindfulness for age group 18 
df %>% filter(age==18) %>% mutate(mindfulness=rowSums( select(.,contains("mind"))),
                                   stress = rowSums(select(.,contains("stress"))),
                                   depression = rowSums(select(.,contains("dep")))
) %>% select(mindfulness, stress, depression, age, gender) %>%
  group_by(gender= gender) %>% arrange(gender) %>%
  summarise(avg= mean(mindfulness)) %>% arrange(desc(avg))

df3 %>% filter(age==19) %>% mutate(mindfulness=rowSums( select(.,contains("mind"))),
                                   stress = rowSums(select(.,contains("stress"))),
                                   depression = rowSums(select(.,contains("dep")))
) %>% select(mindfulness, stress, depression, age, gender) %>%
  group_by(gender= gender) %>% arrange(gender) %>% 
  summarise(avg= mean(stress)) %>% arrange(desc(avg))                              



df3 %>% filter(age==19) %>% mutate(mindfulness=rowSums( select(.,contains("mind"))),
                                   stress = rowSums(select(.,contains("stress"))),
                                   depression = rowSums(select(.,contains("dep")))
) %>% select(mindfulness, stress, depression, age, gender) %>%
  group_by(gender= gender) %>% arrange(gender) %>%
  summarise(avg= mean(depression)) %>% arrange(desc(avg))    

df3 %>% filter(age==19) %>% mutate(mindfulness=rowSums( select(.,contains("mind"))),
                                   stress = rowSums(select(.,contains("stress"))),
                                   depression = rowSums(select(.,contains("dep")))
) %>% select(mindfulness, stress, depression, age, gender) %>%
  group_by(gender= gender) %>% arrange(gender) %>%  
  summarise(sd=sd(stress)) %>% arrange(desc(sd))    
