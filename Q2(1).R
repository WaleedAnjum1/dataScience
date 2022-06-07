install.packages("httr")
install.packages("jsonlite")

library(httr)
library(dplyr)
library(jsonlite)

weatherAPI <- function(){
  #API KEY for my project from accuweather
  MY_API_KEY <- "Ux1QXzR4FRHnVP03fWMAYmWe8BDIc4Kx"
  
  #URL of Accuweather API for 5 day weather
  url <- paste("http://dataservice.accuweather.com/forecasts/v1/daily/5day/260622?apikey=", MY_API_KEY)
  
  #Fetched data
  
  print(paste("Fetching Data from ", url))
  
  #GET method used to request result
  my_json_result <- GET(url)
  #Converting class "response" to "list" through parsing json
  myjsonObj <- content(my_json_result, as="text") %>% fromJSON(flatten = T)
  
  #Required JSON object extracted
  my_forecast <- myjsonObj$DailyForecasts
  
  #Matrix data type
  my_forecast <- as.matrix(my_forecast)
  
  #status
  print("CSV file will now be written of the data type.")
  
  write.csv(my_forecast, "Q2.csv", row.names = FALSE)
  
  print("Created CSV File")
}

weatherAPI()

