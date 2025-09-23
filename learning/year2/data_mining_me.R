#this script will show us how we can data mine using r \

install.packages(c("quantmod","ff","foreign","R.matlab"))

#calling the libraries
library(tidyverse)
library(ff)
library(foreign)
library(R.matlab)

#importing a csv file 
data <- read.csv("C:/Users/STUDENTS/Desktop/Elijah_Kaizzi_B29158/R_programming/datasets")

#Importing data from a txt file we use the delim function 
data2<- read.delim("",header =F) #this is the criteria


#importing json files
install.packages("rjson")
library(rjson)
JsonData <- fromJSON(file = 'script.json')
print(JsonData[1])

#to use it we have to convert it into an rdataframe.
JsonData <- as.data.frame(JsonData[1])

#reading a google sheet we use the g54_deauth function that authorises access to your google drive 
install.packages("googlesheets4")
library(googlesheets4)
gs4_deauth()
link = "https://docs.google.com/spreadsheets/d/1cvTsrp5z_CN1iUu_dKEfdHlkj3h9FAUp-g0j7IQhPM8/edit?gid=0#gid=0"
data4 <- read_sheet(link)
view(data4)

#loading from a sql database 
install.packages("DBI")

library(DBI)

ggplot2::diamonds

diamonds_db <- tbl(con,sql("SELECT * FROM diamonds"))















