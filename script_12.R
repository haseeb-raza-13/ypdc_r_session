setRepositories()
library(readxl)
library(tidyverse)
library(palmerpenguins)
df <- palmerpenguins::penguins
View(df)
select(df, flipper_length_mm)

df %>% 
  group_by(species) %>% 
  select(., flipper_length_mm) %>% 
  drop_na() %>% 
  summarise(avg = mean(flipper_length_mm))
