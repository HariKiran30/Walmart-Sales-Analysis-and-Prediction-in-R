
# Performed Time series Analysis
# Created multi linear regression model for predicting Weekly sales
# Performed Residual Analysis 
# Performed Model Diagnostics
# Tested model with new Data

#Set the Working Directory
setwd('')

# import the dataset 
Walmart_sales <- read.csv('Walmart.csv')
#You can also use file.choose function instead of setting setwd to import
# SYNTAX: Walmart_sales <- read.csv(file.choose())

View(Walmart_sales)
summary(Walmart_sales)
#For checking null or missing values
sum(is.na(Walmart_sales))


# -----------------------------------------------------------
#Time Series Analysis:
# Convert Date to Date type and sort the data
Walmart_sales$Date <- as.Date(Walmart_sales$Date, format = "%d-%m-%Y")
Walmart_sales <- Walmart_sales[order(Walmart_sales$Date),]

# Plot the time series
#plotting line plot
# If you set type = "l", it means you want to create a line plot
plot(Walmart_sales$Date, Walmart_sales$Weekly_Sales, type = "l")


#-----------------------------------------------------
#Calculating Correlation
cor(Walmart_sales$Fuel_Price, Walmart_sales$Weekly_Sales)


#Regression Analysis

str(Walmart_sales)
#View(Walmart_sales)

#Checking null Values if any
sum(is.na(Walmart_sales))

# There are no null or missing Values in Dataset

# Import library catools for spliting Data
library(caTools)

Walmart_split <- sample.split(Walmart_sales$Weekly_Sales, SplitRatio = 0.7)
Walmart_train <- subset(Walmart_sales, split =TRUE)

Walmart_test <- subset(Walmart_sales, split = FALSE)

# Fitting multi Linear Regression Model
# Predicting "Weekly Sales" based on papameters Temperature, Fuel_Price, 
# CPI,Unemployment
# Data Using Training data set of walmart sales 
# Using 'lm' function to fit the regression model.
model <- lm(Weekly_Sales ~ Temperature + Fuel_Price + CPI + Unemployment,
            data = Walmart_train)
summary(model)

# Using Predict function to predict the model.
test_model <- predict(model, data= Walmart_test)
test_model

#------------------------------------------------------
#Residual Analysis: 
#This involves checking the difference between 
#the observed and predicted values(residuals) to validate the model. 

# You can plot the residuals and check if they are normally 
#distributed and if there’s any pattern in the residuals

# Calculate residuals
residuals <- Walmart_test$Weekly_Sales - test_model

# Plot a histogram of residuals
hist(residuals)

# Add a Quantile-Quantile plot
qqnorm(residuals)
qqline(residuals)


#Model Diagnostics

# Diagnostic plots
plot(model)


# Summary of the Model
summary(model)

# Prediction Using New data
df <- data.frame(Temperature = c(25.21, 28.11,30.30,20.05), 
                 Fuel_Price = c(4.7,5.1,7.0,3 ), 
                 CPI = c(130,211,145,215), 
                 Unemployment = c(8,12,5,3))
result <- predict(model, df)
result







