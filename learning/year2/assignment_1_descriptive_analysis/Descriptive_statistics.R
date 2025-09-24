

#NAME: Kawooma Elijah 

#REG NO: M24B38/023

#ACCESS NO: B29158

#BSDS
#This script and files are located on github at < https://github.com/TheGreatday21/R-practice/tree/main/learning/year2/assignment_1_descriptive_analysis >






#setting our working directory
setwd("C:/Users/STUDENTS/Desktop/Elijah_Kaizzi_B29158/R_programming/R_programming/learning/year2")

#installing neccessary packages
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("lubridate")
install.packages("dplyr")
install.packages("forecast")
# Load Libraries
library(tidyverse)
library(ggplot2)#for the plots
library(tidyverse)
library(lubridate)#is for working with dates
library(dplyr)#is for data manipulation
library(forecast)#for timeseries method of forecasting trends

#importing the dataset
data <- read.csv("C:/Users/STUDENTS/Desktop/Elijah_Kaizzi_B29158/R_programming/datasets/ida_credits_to_uganda_09-23-2025.csv", header = TRUE)
view(data)
#getting a statistical overview of our dataset
summary(data)
# Count missing values per column
colSums(is.na(data))


####QUESTION ONE: Time-series analysis of Disbursed Amount

#getting a statistical overview of the column 
summary(data$Disbursed.Amount..US..)#skewed

#we will use of the approval date to carryout our time series analysis
#making sure the column has no missing values , "" or TBD values
data<- data %>% filter(Board.Approval.Date != "" & Board.Approval.Date != "TBD" & !is.na(Board.Approval.Date))

#changing the format of the approval date column to actual date format
data$Board.Approval.Date <- as.Date(data$Board.Approval.Date,format ="%m/%d/%Y")

##Extracting the year because its what we are using for timestamps and creating a new column year to only have the extracted years
data$Year <- year(data$Board.Approval.Date)
view(data)

##Aggregating the total disbursements with the respective years i.e grouping the data by year and corresponding total disbursed sums aligned to the years 
d_yearly <- data %>% group_by(Year) %>%
summarise(Total_Disbursement = sum(Disbursed.Amount..US.., na.rm = TRUE)) %>% #the sums should not have missing values 
filter(!is.na(Year)) #the years should also not have any missing values 

#plotting the trend before the time series analysis
ggplot(d_yearly, aes(x = Year, y = Total_Disbursement)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "World Bank Fund Disbursement to Uganda (by Approval Year)",
       x = "Approval Year",
       y = "Disbursed Amount (US$)") +
  theme_minimal()
#We see a clear long-term increase in the size of disbursements, especially from the 2000s onwards, but the year-to-year values fluctuate a lot.
#This suggests that while funding generally grew, it was not constant, and depended on when specific large projects were approved.
#Before applying time-series analysis, this plot helps us recognize the overall upward trend and the variability in disbursement patterns.”


##Creating a time-series object(ts). This will allow us to carryout decomposition, smoothing or forecasting of our data
#we are going to use a ts object because we are tracking the amounts over an interval/frequency  of one year at a time
t_series_data <- ts(d_yearly$Total_Disbursement,
                  start = min(d_yearly$Year), #getting the minimum year
                  end = max(d_yearly$Year),#getting the last year borrowed in
                  frequency=1) #iterating over a frequency of one year at a time


##carrying out some time series techniques on our time series data
##PLOTTING 
#using locally weighted regression to plot the trend
ggplot(d_yearly, aes(x = Year, y = Total_Disbursement)) +
  geom_point(color = "blue") +
  geom_line(color = "blue", alpha = 0.4) +
  geom_smooth(method = "loess", span = 0.3, color = "red", size = 1.2) +
  labs(title = "Smoothed Trend of World Bank Disbursements to Uganda",
       x = "Year", y = "Disbursed Amount (US$)") +
  theme_minimal()

#EXPLANATION
#The LOESS smoothed trend reveals that World Bank funding to Uganda has generally increased over the long term, despite short-term volatility, with signs of a possible slowdown in the latest years.

# Forecast into the future
fit <- auto.arima(t_series_data)
future <- forecast(fit, h=5) # for the next 5 years
autoplot(future)
#the graph shows a minimal increase in borrowing funds over the next 5 years 



#QUESTION TWO: Overall Credit Status
# Check Credit Status summary
credit_summary <- data %>%
  group_by(Credit.Status) %>%
  summarise(Count = n()) %>%
  mutate(Percent = round((Count / sum(Count)) * 100, 1)) %>%
  arrange(desc(Count))

credit_summary

#Plotting the distribution using a barchart ordered by count
ggplot(credit_summary, aes(x = reorder(Credit.Status, -Count), 
                           y = Count, fill = Credit.Status)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(Count, " (", Percent, "%)")), 
            vjust = -0.5, size = 3) +
  labs(title = "Overall Credit Status of Uganda (IDA)",
       x = "Credit Status",
       y = "Number of Credits") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set2")


#EXPLANATION:
#Uganda has a strong repayment record (most credits fully repaid) but also continues to carry a substantial portfolio of active commitments that are either under repayment or still disbursing. 
#This reflects both Uganda’s long borrowing history with IDA and its ongoing reliance on exterior financing for development projects.


####QUESTION THREE: Original Principal Amount patterns
# Summarise borrowing by year.
principal_summary <- data %>%
  group_by(Year) %>%
  summarise(Total_Principal = sum(Original.Principal.Amount..US.., na.rm = TRUE)) %>%
  arrange(Year)

principal_summary

#plotting the trend to see how Uganda borrow over the years 
ggplot(principal_summary, aes(x = Year, y = Total_Principal)) +
  geom_line(color = "steelblue", size = 1) +
  geom_point(color = "darkred", size = 2) +
  labs(title = "Trend of Uganda's Original Principal Amount Borrowed from the World Bank",
       x = "Year",
       y = "Total Principal Borrowed (US$)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

##EXPLANATION 
#Uganda's borrowing from the World Bank, characterized by a significant original principal amount in IDA credits, reflects a strategic approach to financing development. 
#The patterns observed highlight the importance of managing debt sustainably, focusing on impactful projects, and ensuring effective implementation to achieve long-term development goals which the country has done at a lacklustre rate
