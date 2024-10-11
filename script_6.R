setRepositories()
install.packages("readxl", dependencies = TRUE)
library(readxl)
install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)

install.packages("colorspace", dependencies = TRUE)











#normality check-----
df <- iris
s <- shapiro.test(iris$Sepal.Width)
summary(s)
print(s)
remove(s)







#one sample t test----
summary(df)
t.test(df$Sepal.Width, mu=5)

#two sample t test----
unique(df$Species)
#unpaired t test
filter(df, df$Species=="setosa" | df$Species=="versicolor")

t.test(df$Sepal.Width ~ df$Species %in% c("setosa", "versicolor") )
t.test(df$Sepal.Width ~ df$Species=="setosa" |df$Species=="versicolor")
#paired 
pre_treatment <- c(rnorm(2000, mean = 140, sd=10 ))
tibble(pre_treatment)
post_treatment <- c(rnorm(2000, mean = 160, sd=10))
tibble(post_treatment)
t.test(pre_treatment, post_treatment, paired = TRUE)


#ANOVA ----
install.packages("palmerpenguins")
library(palmerpenguins)
df <- penguins
unique(df$species)
unique(df$island)
unique(df$sex)
t.test(df$body_mass_g ~ df$species=="Adelie" |df$species=="Chinstrap")
ggplot(df, mapping = aes(x=species, y=body_mass_g))+geom_boxplot()
#ANOVA

df1 <- df %>% select(species, flipper_length_mm) %>% drop_na()
df1 %>% group_by(species) %>% summarise(avg =mean(flipper_length_mm)) 

ggplot(df1, mapping= aes(x=species, y=flipper_length_mm, fill = species))+
  geom_boxplot()


hist(df1$flipper_length_mm)
qqnorm(df1$flipper_length_mm)


shapiro.test(df1$flipper_length_mm)


df2 <- df1 %>% group_by(species) %>% 
  summarise(shapiro_pvalue = shapiro.test(flipper_length_mm)$p.value)
#anova----
res_aov <- aov(df1$flipper_length_mm ~ df1$species, data= df1)
summary(res_aov)
#normality 
install.packages("car", dependencies = TRUE)
library(car)
library(tidyverse)

hist(res_aov$residuals)

qqnorm(res_aov$residuals)

shapiro.test(res_aov$residuals)
leveneTest(df1$flipper_length_mm ~ df1$species, data = df1)
#to check the homogeneity  of data----
install.packages("lattice", dependencies = TRUE)

library(lattice)

dotplot(df1$flipper_length_mm ~ df1$species, data = df1)
ggplot(df1, mapping = aes(x=df1$species, y=df1$flipper_length_mm, fill = df1$species))+geom_boxplot()

#----
aggregate(df1$flipper_length_mm ~ df1$species , data = df1,
          function(x) round(c(mean= mean(x), sd= sd(x)), 2))

df %>% group_by(species) %>% 
  summarise(mean = mean(flipper_length_mm, na.rm = TRUE),
            sd = sd(flipper_length_mm, na.rm= TRUE))

#another way for anova----
oneway.test(df1$flipper_length_mm ~ df1$species,  data = df1, var.equal = TRUE)
res_aov <- aov(df1$flipper_length_mm ~ df1$species, data= df1)

#applying post hoc test----
install.packages("multcomp", dependencies = TRUE)
library(multcomp)
post_test <- glht(res_aov, linfct =  mcp("tukey" = "Tukey"))
plot(TukeyHSD(res_aov))
summary(res_aov)


# Assuming you have already conducted an ANOVA
model <- aov(response ~ factor, data = your_data)

# Perform Tukey's HSD test
tukey_result <- TukeyHSD(res_aov)

# View the results
summary(tukey_result)
