#THIS IS OUR FIRST PRACTICAL LECTURE ON R BY MISS LUSINDA 
#here we are installing the package 
install.packages("readxl")
#here we are activating the package 
library(readxl)

#accessing our data set from our pc 
data1 <- read_excel("data_sets/Bike_Sales.xlsx")
data1

#we are to create a data-frame for the table i have created  
names = c("Cathy","Humble","James")
weights = c(45,69,68)

#combing the two variables 
class_weight = data.frame(names,weights)
#using the summary function to give us a detailed summary of our dataframe 
summary(class_weight)

#we can also use the mean function to get thhe mean of our data frame 
mean(class_weight)
#this returns an error because the data frame is qualitative and not numerical
'''
> mean(class_weight)
[1] NA
Warning message:
In mean.default(class_weight) :
  argument is not numeric or logical: returning NA
'''
#so the easiest way to do this is using correct syntax 
mean(class_weight$Weight) #the dollar sign specifies the variable to get the mean for 
