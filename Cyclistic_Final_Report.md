# Cyslistic: a data analysis to determine the differences between annual and casual bike renters

# **Introduction**
Cyclistic is a bike-share company in Chicago. The director of marketing believes that the company’s future success depends on maximizing the number of annual memberships. As a result, your team aims to understand how casual riders and annual members use Cyclistic bikes differently. Based on these insights, your team will design a new marketing strategy to convert casual riders into annual members. However, Cyclistic executives must approve your recommendations, so they need to be supported by compelling data insights and professional data visualizations.

To answer this question, I will go through the process of 

**Ask:** What is the business question that has to be addressed and how to get to the answer? 

**Prepare:** How to gather good quality data to answer this question?

**Process:** Clean and prepare data for analysis.

**Analyze:** Analyze the data to get meaningful results, relating to the question to be answered.

**Share:** Make compelling visuals in line with what you want to convey to your stakeholders 

**Act:** Give recommendations how the company can act. 


# Ask

**There are three questions to guide the future marketing program, of which the first will be answered here:**
1. **How do annual members and casual riders use Cyclistic bikes differently?**  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?

To answer how annual members and casual riders use Cyclistic bikes differently I will analyzing data from the company, tracking each outgoing bike ride. I will inspect this data, clean it and analyze it for different patterns between casual users and annual users.



# Prepare 
The data that is being used is from [Index of bucket "divvy-tripdata"](https://divvy-tripdata.s3.amazonaws.com/index.html) 
This data has been shared by by Lyft Bikes and Scooters, LLC (“Bikeshare”) and has been made available by Motivate International Inc.. They operate the City of Chicago’s (“City”) Divvy bicycle sharing service. This data has been downloaded and locally stored at C:\\Users\\Frank\\Documents\\Google_Course_Data\\Capstone_Project_Cyclistic.   

**Data exploration**
* Verified that the column contains only the expected values (`member` and `casual`).
* Ensured that there are no missing values in the `started_at` column.
* Confirmed that there are no missing values in the `ended_at` column.
* Identified rows where the `start_station_name` is either null or empty.  
* Found that 1,080,470 rows of `start_station_name` (18.3% of total) have missing values.
* Identified rows where the `end_station_name` is either null or empty.  
* Found that 1,108,680 rows of `end_station_name` (18.8% of total) have missing values.
* Confirmed that there are no missing or empty values in the `member_casual` column.
* Verified that there are no null values in the latitude and longitude columns for both start and end points.
* Found 171 duplicated 'ride_id' entries.
* Found that the duplicates arise due to different time notations, e.g., `2024-05-31 23:56:47 UTC` versus `2024-05-31 23:56:47.556000 UTC`.
  
# Process



**Data Cleaning**
The data cleaning in this project has been done in SQL, you can see the code here [04 Datat cleaning.sql](04 Data Cleaning.sql)

* Created a table for duplicate records
* Created a deduplicated table
* Created a table without missing station names
* Added a `Travel_time` column and created a new table
* Checked `Travel_time` values
* Created a table without negative travel times
* Removed wrongly rented bike
* Identified trips with travel times below 2 minutes where the `start_station_name` and `end_station_name` were the same.  
* Saved these "wrong rents" into a new table `Cyclistic.Cleaned_Wrong_Rents` to address potential errors.

**Summary Of Analysis**

*  Calculated maximum, minimum and average travel time per user type


* Created a table displaying usage per member type per month
   
* Created a table displaying the most used beginning stations per membership type
* Calculated casual rides per station
* Created a table with the day of the week added
* Counted Days of the Week per Member Type




	![][image5]![][image6]

* Filtered casual rides at the top 10 most popular stations for annual users:
* The top 10 most popular stations of the annual (member) type of user don’t match the top 10 of the casual users. 

**Supporting visualizations and key findings.**

**Key findings:**  
Main differences:

* Usage by weekday   
* Most popular stations   
* Average trip duration  
* Casual users are likely tourists  
* Annual users are likely locals

**Your top three recommendations based on your analysis.**  
You won’t be able to sell annual memberships to tourists.   
Target popular stations with annual users.  
You could target hotels and hostels. If they get an annual membership, they can rent it out to their customers.  



