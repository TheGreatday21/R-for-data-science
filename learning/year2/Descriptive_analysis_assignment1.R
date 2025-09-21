

#NAME: Kawooma Elijah 

#REG NO: M24B38/023

#ACCESS NO: B29158

#BSDS



install.packages("ggplot2")

install.packages("tidyverse")

install.packages("lubridate")

install.packages("diplyr")

# Load Libraries

library(tidyverse)

library(lubridate)

library(readxl)

#Load dataset

setwd("C:/Users/user/Documents/BigData/Assignments")



#importing the dataset

data <- read.csv("C:/Users/user/Documents/BigData/Assignments/ida_credits_to_uganda_09-21-2025.txt", header = TRUE)

view(data)



#getting a statistical overview of the disbursed amount variable

summary(data$Disbursed.Amount..US..)



# Count missing values per column

colSums(is.na(data))

sum(is.na(data))#for the whole dataset





#QUESTION ONE: Time-series analysis of Disbursed Amount



#First convert the date column to Date type 

data$`End of Period` <- as.Date(data$`End of Period`)



#Aggregate disbursed amounts by year

disbursement_trend <- data %>%

  mutate(Year = year(`End of Period`)) %>%

  group_by(Year) %>%

  summarise(Total_Disbursement = sum(`Disbursed Amount (US$)`, na.rm = TRUE))



#Plotting the trend

ggplot(disbursement_trend, aes(x = Year, y = Total_Disbursement)) +

  geom_line(color = "blue", linewidth = 1) +

  geom_point(color = "red", size = 2) +

  labs(title = "Trend of World Bank Disbursements to Uganda",

       x = "Year",

       y = "Total Disbursed (US$)") +

  theme_minimal()



#EXPLANATION:

#The line chart of disbursed amounts shows how annual disbursements have changed over time.

#The general pattern is upward, with some years having larger spikes, reflecting major disbursements,

#while a few years are lower due to slower project implementation. 

#Overall, Uganda has seen growing inflows of funds from the World Bank.







#QUESTION TWO: Overall Credit Status



credit_status_summary <- data %>%

  group_by(`Credit Status`) %>%

  summarise(

    Count = n(),

    Total_Principal = sum(`Original Principal Amount (US$)`, na.rm = TRUE)

  )



print(credit_status_summary)



#Plotting the distribution of Credit Status

ggplot(credit_status_summary, aes(x = `Credit Status`, y = Count, fill = `Credit Status`)) +

  geom_bar(stat = "identity") +

  labs(title = "Distribution of Credit Status for Uganda",

       x = "Credit Status",

       y = "Number of Credits") +

  theme_minimal()



#EXPLANATION:

#The summary of credit status shows that a significant proportion of credits are still active, meaning ongoing projects

#Older loans are mostly Closed or Fully Disbursed, showing project completion. 

#This mix demonstrates both Uganda’s current active portfolio and the historical reliance on World Bank financing.







#QUESTION THREE: Original Principal Amount patterns



principal_trend <- data %>%

  mutate(Year = year(`End of Period`)) %>%

  group_by(Year) %>%

  summarise(Total_Principal = sum(`Original Principal Amount (US$)`, na.rm = TRUE))



#Plotting the trend of principal amounts

ggplot(principal_trend, aes(x = Year, y = Total_Principal)) +

  geom_line(color = "darkgreen", size = 1) +

  geom_point(color = "orange") +

  labs(title = "Trend of Original Principal Amounts Borrowed by Uganda",

       x = "Year",

       y = "Total Principal (US$)") +

  theme_minimal()



#EXPLANATION

#The analysis of original principal amounts shows that the amounts Uganda borrows have generally increased over time. 

#Recent credits are larger, suggesting bigger projects and higher financing needs. 

#There are also spikes in certain years, because of the approval of major infrastructure or program loans.
