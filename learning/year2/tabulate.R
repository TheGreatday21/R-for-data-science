#here we are going to learn how to use tables in r

#the old way to read a file was using the read table function 
#the function can take params at the start like sep and header . Mainly used with csv files
#sales_old <- read.table("Bike_Sales.csv",sep = "",header = TRUE)
#View(sales_old)


#calling the library
library("readxl")

#reading our file 
sales <- read_excel("Bike_Sales.xlsx")
#observations(obs) - refers to the number of rows in the table and vaariables refers to the number of columns in the table 
#in this case we have 113036 obs and 18 vars
#to view our table 
View(sales)

#to access the first column in our table and all its rows 
sales[,1]#the first column in this case is date

#the better syntax is to use the dollar sign variable with the name of the data frame and the name of the variable itself 
sales$Date
#we have created a vector by accessing the date column here
#####a vector is a list of values all of the same mode 

sales$Date[1] #this gives us the first value of the vector 

sum(sales$Unit_Cost)#using the sum function to get the total value of the vector formed from the unitcost column in sales

#you can use the vectors to your advantage in computations 
sales$Unit_Price[1] + sales$Cost[1]  #getting the sum of the first in Unit_Price column to the first in cost column 

#we can add also two corresponding vectors as long as they have the same data type preferably integers here
sum(sales$Cost + sales$Revenue) #This gives us the total sum of adding every row and its corresponding column of each vector from the sales data  


                              ######## VECTOR ARITHMETIC 






























