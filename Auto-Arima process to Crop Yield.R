#  Steps to forecast the external variables that are linked with the crop production

# Install required packages
install.packages("forecast")
install.packages("ggplot2")
install.packages("dplyr")

# Load libraries
library(forecast)
library(ggplot2)
library(dplyr)

# Load dataset
data <- read.csv("Crops_ExV.csv")


# Convert to time-series object
ts_data <- ts(data, start ='1990', frequency = 1)

# Check the time series
print(ts_data)
plot(ts_data, main = "Time Series of factors linked to crop production", ylab = "Production", xlab = "Year")

# Fit Auto-ARIMA model

ts_pesticides <-ts_data[, 3]
auto_model <- auto.arima(ts_pesticides, stepwise =FALSE, approximation =FALSE )

# View the model summary
summary(auto_model)

#Model Diagnostic

checkresiduals(auto_model)

# Forecast the next 10 years
forecasted_values <- forecast(auto_model, h = 10)

# Plot the forecast
plot(forecasted_values, main = "Pesticides-Consumption", xlab = "Year", ylab = "Tonnes")

# Print the forecasted values
print(forecasted_values)

#Export to csv file
write.csv(forecasted_values, "pesticides_tonnes.csv", row.names = FALSE)

# Split the data into training (80%) and testing (20%)
train_size <- floor(0.8 * length(ts_pesticides))
train_data <- window(ts_pesticides, end = c(start(ts_pesticides)[1] + train_size - 1))
test_data <- window(ts_pesticides, start = c(start(ts_pesticides)[1] + train_size))

# Fit Auto-ARIMA to the training data
train_model <- auto.arima(train_data, seasonal = FALSE)

# Forecast on the test data period
test_forecast <- forecast(train_model, h = length(test_data))

# Plot actual vs forecasted
plot(test_forecast, main = "Actual vs Forecasted", xlab = "Year", ylab = "Tonnes")
lines(test_data, col = "red", lwd = 2)  # Actual data

# Calculate accuracy metrics
accuracy(test_forecast, test_data)

View(test_data)

---------------------------------------------------------------------------------------------------------
  
 # Fit Auto-ARIMA model
  
ts_avg_temp <-ts_data[, 2]
auto_model <- auto.arima(ts_avg_temp, stepwise =FALSE, approximation =FALSE )

# View the model summary
summary(auto_model)

#Model Diagnostic

checkresiduals(auto_model)

# Forecast the next 10 years
forecasted_values <- forecast(auto_model, h = 10)

# Plot the forecast
plot(forecasted_values, main = "Average-Temperature", xlab = "Year", ylab = "C*")

# Print the forecasted values
print(forecasted_values)  

#Export to csv file
write.csv(forecasted_values, "average_temp.csv", row.names = FALSE)



-----------------------------------------------------------------------------------------------------------

  # Fit Auto-ARIMA model
  
ts_avg_rainF<-ts_data[, 1]
auto_model <- auto.arima(ts_avg_rainF, stepwise =FALSE, approximation =FALSE )

# View the model summary
summary(auto_model)

#Model Diagnostic

checkresiduals(auto_model)

# Forecast the next 10 years
forecasted_values <- forecast(auto_model, h = 10)

# Plot the forecast
plot(forecasted_values, main = "Average-Rain Fall", xlab = "Year", ylab = "millimeter per year")

# Print the forecasted values
print(forecasted_values)  

#Export to csv file
write.csv(forecasted_values, "average_rain_fall.csv", row.names = FALSE)