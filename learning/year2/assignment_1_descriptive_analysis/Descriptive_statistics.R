

#NAME: Kawooma Elijah 

#REG NO: M24B38/023

#ACCESS NO: B29158

#BSDS

#setting our working directory
setwd("C:/Users/STUDENTS/Desktop/Elijah_Kaizzi_B29158/R_programming/R_programming/learning/year2")

#installing neccessary packages
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("lubridate")
install.packages("dplyr")

# Load Libraries
library(tidyverse)
library(ggplot2)#for the plots
library(tidyverse)
library(lubridate)#is for working with dates
library(dplyr)#is for data manipulation

#importing the dataset
data <- read.csv("C:/Users/STUDENTS/Desktop/Elijah_Kaizzi_B29158/R_programming/datasets/ida_credits_to_uganda_09-23-2025.csv", header = TRUE)
view(data)
#getting a statistical overview of our dataset
summary(data)
# Count missing values per column
colSums(is.na(data))


####QUESTION ONE: Time-series analysis of Disbursed Amount

#getting a statistical overview of the column 
summary(data$Disbursed.Amount..US..)

#we will use of the approval date to carryout our time series analysis
#making sure the column has no missing values , "" or TBD values
data<- data %>% filter(Board.Approval.Date != "" & Board.Approval.Date != "TBD" & !is.na(Board.Approval.Date))

#changing the format of the approval date column to actual date format
data$Board.Approval.Date <- as.Date(data$Board.Approval.Date,format ="%m/%d/%Y")

##Extracting the year because its what we are using for timestamps
data$Year <- year(data$Board.Approval.Date)

##Aggregating the total disbursements with the respective 
d_yearly<- bank %>%
group_by(Year) %>%
summarise(Total_Disbursed = sum(Disbursed.Amount..US.., na.rm = TRUE),
.groups = "drop") %>%
filter(!is.na(Year))

##Creating a time-series object i.e the frequency by year
start_year <- min(d_yearlys$Year, na.rm=TRUE)
t_series_data <- (d_yearly$Total_Disbursed, start=start_year, frequency=1)

##Plotting the time series ##Line plot with a smoothed trend
ggplot(d_yearly, aes(x = Year, y = Total_Disbursed)) +
geom_line(color = "blue", linewidth = 1) +
geom_point(color = "darkred", linewidth = 2) +
geom_smooth(method = "loess", color = "green", se = FALSE) +
labs(title = "Trend of World Bank Disbursements to Uganda",
x = "Year", y = "Total Disbursed Amount (US$)") +
theme_minimal() + scale_y_continuous(label = scales::comma)

#Plotting the trend

ggplot(disbursement_trend, aes(x = Year, y = Total_Disbursement)) +
  geom_line(color = "blue", linewidth = 1) +
  geom_point(color = "red", size = 2) +
  labs(title = "Trend of World Bank Disbursements to Uganda",
       x = "Year",
       y = "Total Disbursed (US$)") +
  theme_minimal()

#EXPLANATION
#This is a visualisation of a time series using a line graph and a
#smoothed line to properly show the trend of the total disbursed amount over the years. From
#the graph, the total amount disbursed per year to UgUganda increased as the years went by reaching a
#peak in 2020. From 2020 onwards the total amount disbursed reduced significantly. Generally the total
#amount disbursed increased until 2020, and then startsed to gradually reduce till date and this shows that
#Uganda’s financial dependency on the World bank generally increases as the years go by until around 2020
#where it experiences a significant decrease.




#QUESTION TWO: Overall Credit Status
# Check Credit Status summary
data %>%
  select(Year, Credit.Status) %>%
  group_by(Credit.Status) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count))

#Plotting the distribution using a barchart
data %>%
  group_by(Credit.Status) %>%
  summarise(Count = n()) %>%
  ggplot(aes(x = Credit.Status, y = Count, fill = Credit.Status)) +
  geom_bar(stat = "identity") +
  labs(title = "Overall Credit Status of Uganda",
       x = "Credit Status",
       y = "Number of Projects") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_brewer(palette = "Set2")



#EXPLANATION:
# According to the graph, we can see that Uganda’s credit status mostly
#falls in Fully Repaid and Repaying. - The highest number of loans they have acquired being Fully Repaid
#at a total of 96, followed by those being repaid which are 65. This means that Uganda has acquired a lot
#of money from the world bank through loans but has also repaid back many of them. A small proportion
#are either Disbursing(10) or disbursing & Repaying(8) which shows that Uganda is still getting financial
#assistance from the World bank. - Therefore, Uganda has a strong record of repayment even though it
#borrows a lot from the World Bank through disbursements.


#QUESTION THREE: Original Principal Amount patterns
#line plot of Original Principal Amount over years
data %>%
  select(Year, Original.Principal.Amount..US.) %>%
  arrange(Year) %>%
  ggplot(aes(x = Year, y = Original.Principal.Amount..US.)) +
  geom_line(color = "darkblue", size = 1) +
  geom_point(color = "darkblue", size = 2) +
  labs(title = "Original Principal Amount Borrowed by Uganda from the World Bank",
       x = "Year",
       y = "Original Principal Amount (US$)") +
  theme_minimal() +
  scale_y_continuous(labels = scales::comma)

##Explanation
#Based on the dataset, the Original Principal Amount borrowed by Uganda from the World Bank shows a pattern of fluctuating but generally increasing loans over the years. Certain years reflect larger spikes, likely corresponding to major development projects or new loan agreements. By observing the 3-year moving average, it is evident that Uganda’s borrowing trend gradually rises over time, suggesting a steady reliance on World Bank financing to support national projects. These fluctuations indicate that while borrowing varies year to year, the overall trend demonstrates consistent engagement with the World Bank and a growing scale of financial commitments.
