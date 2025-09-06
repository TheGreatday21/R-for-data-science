#here we are going to install some good additional packages 


#there are 2 kinds of packages
##base - are pre-installed but not activated
##contributed - are not preinstalled and can be downloaded 

#####we can get them from the website CRAN or CRANTASTIC.ORG - is like a discord for most used packages 
#the last one is GIT Hub - 


#######
#The most used packages are 
#-dplyr (for manipulating data frames)
#-tidyr (for cleaning up information)
#-stringr (for working with strings)
#-lubridate(for manipulating date information)
#-httr (for working with website data)
#-ggvis (for graphical visualization)
#-ggplot2 (for data visualisation)
#-rio (r inut output - for inputing and outputing data)
#-pacman (is the ultimate all for one package)


##THE INSTALLATION PROCESS
install.packages("pacman") #this is the criteria for installing packages in r

#LOADING PROCESS
#option1
require(pacman) #gives a confirmation message
library(pacman) #no message

#for the base packages 
library(datasets)

#UNLOADING PACKAGES
p_unload(dplyr,tidyr,stringr) #using packman to unload specific packets 
p_unload(all) #using pacman to unload all the packages in the script
detach("packages:datasets",unload = TRUE) #for unloading base packages






