#THIS SCRIPT IS TO CONNECT TO A DUCKDB SERVER an import an xlx file 

#load the packages 
install.packages(c("DBI","duckdb"))
library(duckdb)
library(DBI)
library(readxl)
library(tidyverse)

#creating a duck db server and naming it elijah.This db will remain even after you close R. extension is  .duckdb
con = DBI::dbConnect(duckdb::duckdb(), dbdir = "C:/Users/STUDENTS/Desktop/Elijah_Kaizzi_B29158/R_programming/databases/elijahdb.duckdb")

#this is to create  a temporary db that will vanish after R closes 
#con <- DBI::dbConnect(duckdb::duckdb())

#importing our excel file using duckdb
#first reading the file into a dataframe because duckdb has no innate way to read xlsx file unlike json and csv
data <- read_excel("C:/Users/STUDENTS/Desktop/Elijah_Kaizzi_B29158/R_programming/datasets/Vegetable_Sales.xlsx")

#creating a table in the db 
dbWriteTable(con, "sale_vegs", data)

#using the dbListTables function to see my newly created tables in the connection 
dbListTables(con)

#Retrieve table contents as a tibble for neater appearance
dbReadTable(con,"sale_vegs") |> as_tibble()

#using sql queries to see information from our data 
#placing the information into a df in R to easily use it 
vegetable_db <- tbl(con, sql("SELECT * FROM sale_vegs"))

view(vegetable_db)

