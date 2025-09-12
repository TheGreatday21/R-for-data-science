#This is a simple program that will say hello to you back 

#the syntax to equate something to a variable is using the <- sign and the function to recieve user input in r is" readline"
#The readline function takes text as a parameter like in the example below 
name <- readline("Whats your name? ")
print(name)

#The function that enables us to concatenate two objects together / text together is "paste" function.The function returns the concatenated text so we have to simply print the output by either assigninng the output to a variable or simply nesting the function into the print function 

print(paste("Hello there",name))

######## R reads function from "right to left" #########

###over nesting is not good cause it does not explain the code properly to a user. The design of a program is really essential to make good projects 

##The global environment on the right stores the variables in our program and there values 


#r has the following arithmetic 
#+  -  *  /

#readline returns inputs as strings so we use other functions like 
#as.character
#as.double
          #this process of conversion is called coarsion 


mario <- readline("How many votes did Mario get: ") 
peach <-readline("How many votes did Peach get: ") 
bowser <-readline("How many votes did Bowser get: ") 

mario <- as.integer(mario)
peach <- as.integer(peach)
bowser <- as.integer(bowser)

total <- sum(peach, mario,bowser) #this function adds the values in the variables together
#total <- mario + bowser + peach   #here we simply add them together  


print(paste("The total number of votes was",total))
#paste is technically the same a f string formating in python except here its a must cause its the only way to print with a variable concatenated onto it 


#we can even squeze up this code by adding the as.integer function before the readline function 
mario <- as.integer(readline("How many votes did Mario get: "))
peach <-as.integer(readline("How many votes did Peach get: ")) 
bowser <-as.integer(readline("How many votes did Bowser get: ")) 

#we use csv- comma seperated values to store data in tables 

###########to see all the variables in my current environment 
ls()
#[1] "bowser" "mario"  "name"   "peach"  "total" 

############to remove these variables and have a clean environment we use the rm comand 
#this takes a list as an argument 
rm(list = ls())

###when in a directory you want , to create a new file we use the syntax 
#file.create("file_name_her.extension_name_here")

