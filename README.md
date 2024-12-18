# DS_Crop-yields
Hi Folks!

1) This a project to study the relationship between external factors like weather (rain and temperature) and substances that are used to reduce the risk of a certain plague can screw up the performance of different plantations, against the evolving crop-yield across the time. Therefore, we ran different approaches to tweak, cleanup and wrangling the information coming from the yield_df.csv file which is the root where we are retrieving all the information. The idea is creating 2 Master Datasets, 1st to display all the evolution of the different crop plantations and 2nd is to display the external variables that affect the performance of the plantation. 
2) In the second phase of the project we created a log-log model to understand how the elasticities of the weathers and substances play a key role in crop forecasting, plus we continue to  export the dataset that contains all the exogenous variables across the time into a xlsx file to create and train an Arima model in RStudio, the reason behind we are flipping the environment rather than use python it's because R-language brings back more quality analysis and outcomes to get a more accurate prediction. Moreover, once the goal is reached, we proceed to export the exogenous variables to python in csv files (avg rainfall, avg temp, pesticides).
3) Finally, we circle back to python to recalibrate the estimated information and merge it with the dataset that contains the Crop’s information. After applying some matrixial calculations to get the final dataset that contains the external variables updated (weather and pesticides), we noticed that some NaN values into the Cassava Column are displayed, partly because we expanded the timeframe to forecast 10 years going forward to figure out how would be performing the Cassava plantation. However, taking advantage of the log-log model developed previously we succeed to fill out the Missed values on the Cassava column to forecast accurately the performance of the crop up to 2023, same approach which is displayed in a nicely plot chart.

1)	Loading the data, tweaking the data, and wrangling the data:

a)	Open the project called: “DS_Project_CropYield.ipynb”.
b)	Make sure to install all the packages breaking down in the 1st row before to execute it.
c)	Over the second row, heading the address of your personal driver to the environment chosen, then pick and call the file “yield_df.csv”.
d)	From the row df1 until the row df1_tweaked. all it’s about to tweak and manipulate the information to get done the 1st Dataset which describes crop production across the time.
e)	The same process is accomplished to get done the 2nd Dataset which describes the evolutions of the exogenous variables. 
f)	Over the row inner_join we tend to merge up both Dataset for simplicity and feasibility. The idea is digging into the relationship that exist between crops and exogenous variables.

2)	Data mining, exploration, and relationship between variables:

a)	In this section we proceed to discover how strong does the relationship comparing each one of the different corps against the weather factors and chemical supplements like pesticides for plantation performance. Therefore, this is expressed into the heat-map section.
b)	We jumped to define the 3rd Database (Cassava_df) which would be the cornerstone of all the upcoming workflow.
c)	From the Cassava_df row until the linear regression all is about to explore and validate what variables are going to being picked to build the log-log model.

3)	ML Part I building and optimizing a log-log model to understand the sensitivity of the picked variables:

a)	After done the liner regression we proceed to transform the variables into logarithmic way to smooth the size and variability of the data points.
b)	Then in the Model row we fit the model to print the summary, the interesting discovery here is once the regression is fitted, we can explain almost into a 97% the changes in the Cassava crops around the time by the elasticities of factors like rain, temperature and pesticides.
c)	Once we fitted the 1st ML we are ready to play the 2nd ML model to estimate the exogenous variables.

4)	ML Part II Building and Training an Auto-Arima model to forecast external points, RStudio:

a)	First, we proceed to create a data-frame to display the external factors (weather and pesticides).
b)	We export this dataset (Crops_ExV.xlsx) to an excel file to transfer the information into an R environment.
c)	Please, open the R project (Auto-Arima process to Crop Yield.R). Upcoming all the steps are displayed into the R sheet to accomplish the train of the model and best fit for each one of the external factors like rainfall, temperature and pesticides.
d)	Once the ML models are adjusted into an auto-Arima approach we must export the information to Python again to get done the Crop’s enquire, this file produced are average_rain_fall.csv, average_temp.csv, pesticides_tonnes.csv.

5)	Automatizing and getting the final remarks to forecast the Crop yield 10 years forward:

a)	Once again, having imported the files generated in R, we need to tweak and manipulate the new data to merge all of them into a single dataset and flipped them on a time-series approach
b)	Following the same path, we reach out into the merged_df row to keep wrangling the data until reach the combined_table  row, here we can see that the timeline has been expanded by 10 years, at the same time we see that the cells for all the external factors have been populated given the auto-Arima model ran in R, otherwise we don´t appreciate the same for the Cassava cells coming from 2014 to 2023 that remaining missing or NaN.
c)	Finally, we proceed to populate the Cassava column over the missing values, taking advantage of the log-log model. Before of that, we flipped the NewCassava_df into a logarithmic way for simplicity.
d)	Now getting the Log_Cassava row, we proceed to computate the coefficients of the log-log model to automatized and populate the Cassava column. Hence, we create a loop for get it done, that takes the coefficients generated and make an iterative process picking and solving the equation as many times we must forecast the Cassava crop-yield. 
e)	In the final section once the Cassava Column is populated and flipped again into normal values, we proceed the build a nice plot in the final rows the display the historic Cassava trend, and the forecasted values and see a magnificent fit linked to the historic values. Therefore, report is ready to forecast other plantations as wheat, Potatoes, Soybeans, Maize etc.
