#This is my first r script this year 2025
#it has indeed been a while



#we are going to load some data preinstalled
library(datasets)

#SUMMMARIZE THE DATA
head(iris) #shows the first 6 lines of iris data
summary(iris) #summary of the iris data
plot(iris) #scatter plot matrix of the iris data 



#TO REMOVE PACKAGES RUNNING IN THE BACKGROUND 
detach("package:datasets",unload = TRUE)

#TO CLEAR ANY PLOTS 
dev.off() #this will only work if there is a plot 

