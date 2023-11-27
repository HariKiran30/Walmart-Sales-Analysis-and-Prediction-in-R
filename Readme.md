


# Walmart Sales Analysis and Prediction in R

# *ANALYSIS PERFORMED*

- **Performed Time series Analysis**
- **Created multi linear regression model for predicting Weekly sales**
- **Performed Residual Analysis**
- **Performed Model Diagnostics**
- **Tested model with new Data**


## Dataset
The dataset used in this Project is 'Walmart.csv'. 

## Libraries
 `caTools` library for splitting the data into training and testing sets.

## Steps

1. **Import the Dataset**:  Import the dataset using the `read.csv()` function.

2. **Data Summary**: It provides a summary of the dataset.

3. **Time Series Analysis**:  converted the 'Date' column to Date type and sorts the data by date. It then plots the time series of weekly sales.

4. **Correlation Calculation**: It calculates the correlation between 'Fuel_Price' and 'Weekly_Sales'.

5. **Regression Analysis**: Splited the data into a training set (70% of the data) and a testing set (30% of the data) using the `sample.split()` function from the `caTools` library. Then Fitted a multiple linear regression model to predict 'Weekly_Sales' based on 'Temperature', 'Fuel_Price', 'CPI', and 'Unemployment'. The model is summarized using the `summary()` function.

6. **Residual Analysis**: This Analysis calculates the residuals (the difference between the observed and predicted values) and plots a histogram and a Q-Q plot of the residuals.

7. **Model Diagnostics**: The Function generates diagnostic plots of the model using the `plot()` function.

8. **Prediction Using New Data**: Predicted the 'Weekly_Sales' for new data  by creating dataFrame and using the `predict()` function.

## Output
The output of the Program includes the summary of the regression model, the residuals, the diagnostic plots, and the predicted 'Weekly_Sales' for the new data.

## Note
Please ensure that the 'Walmart.csv' file is in the correct directory before running the program or use `file.choose()` function to choose file. Also, make sure to install the `caTools` library in R using `install.packages("caTools")` if it's not already installed.








