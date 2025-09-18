#first set your worrking directory 
setwd("D:/Elijah/languages_practice/R/learning/year2")
#viewing our workinf directory 
getwd()

#loading the neccessary library 
install.packages("readxl")
install.packages("tidyverse")
library(readxl)
#importing the dataset 
excercise1 <- read_excel("D:/Elijah/Year_2/Data_and_Big_Data_in_R/data_sets/Bike_Sales.xlsx")

#viewing our imported dataset
View(exercise1)

getwd()
