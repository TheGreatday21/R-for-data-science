#using an inbuilt data set to do some easy work init

setwd("D:/Elijah/languages_practice/R/learning/year2")

getwd()

install.packages("tidyverse")

library(tidyverse)

#loading the inbuilt dataset 
view(starwars)
  
#using the glimpse function to see a detailed analysis of our data set 
glimpse(starwars)
#shows the columns downwards and the data on the side

#using the class function to determine the type of data 
class(starwars$gender)#this sshows that the data in this field is " character "

#turning this column into a factor 
starwars$gender <- as.factor(starwars$gender)

#selecting specific variables from our dataset 
starwars %>% select(name,height, ends_with("color")) %>% names() #this will show us the columns that end with the word color in our dataset 

#the %>%  is a syntax referred to as piping 
#therefore the above code means that "from the starwars dataset select fields  from and including  name and height that end with the word color and pipe them to only show their names "

#selecting the code tp show them 
starwars %>% select(name,height, ends_with("color"))

#using the unique function to determine the unique values in a given column
unique(starwars$hair_color)

####FILTER OPTIONS 
#using the filter function 
starwars %>% select(name,height, ends_with("color")) %>% filter(hair_color %in% c("blonde","brown"))
#here we use the new syntax of %in% - to mean the data in  


#handling missing data 
mean(starwars$height)
    #this returns NA because there is missing data 

#we use the mean function again to determine how many rows have missing information
mean(starwars$height, na.rm = TRUE)

#printing out these rows to see the missing values 
starwars %>% select(name,gender,hair_color,height)

#this command removes all the missing data but this is not advised cause alot of important data may be lost 
starwars %>% select(name,gender,color,height) %>% na.omit()

#this command selects the fields and filter out the missing data and replaces it with the .
starwars %>% select(name,gender,color,height) %>% filter(complete.cases(.))