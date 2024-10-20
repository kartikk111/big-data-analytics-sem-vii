library(data.table)  
library(ggplot2) 
df <- fread("C:/Users/Kartik/Downloads/yellow_tripdata_2016-02.csv/yellow_tripdata_2016-02.csv")
df$passenger_count <- as.factor(df$passenger_count)

set.seed(123) 
sample_df <- df[sample(.N, .N * 0.01)]  

ggplot(sample_df, aes(x = trip_distance)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Distribution of Trip Distances", x = "Trip Distance (miles)", y = "Frequency") +
  theme_minimal()
#used for showing relation between trip distance and the frequecy for that distance

ggplot(sample_df, aes(x = passenger_count, y = total_amount, fill = passenger_count)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Amount Collected by Passenger Count", x = "Passenger Count", y = "Total Amount") +
  theme_minimal()
##this is the implementation for bar-plot

ggplot(sample_df, aes(x = trip_distance, y = fare_amount)) +
  geom_point(color = "red", alpha = 0.6) +
  labs(title = "Trip Distance vs Fare Amount", x = "Trip Distance (miles)", y = "Fare Amount ($)") +
  theme_minimal()

sample_df$payment_type <- as.factor(sample_df$payment_type)
ggplot(sample_df, aes(x = payment_type, y = fare_amount, fill = payment_type)) +
  geom_boxplot() +
  labs(title = "Fare Amount by Payment Type", x = "Payment Type", y = "Fare Amount ($)") +
  theme_minimal()

ggplot(sample_df, aes(x = payment_type, fill = payment_type)) +
  geom_bar() +
  labs(title = "Frequency of Payment Types", x = "Payment Type", y = "Count") +
  theme_minimal()
