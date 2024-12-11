# Cyslistic: a data analysis to determine the differences between annual and casual bike renters

# **Introduction**
Cyclistic is a bike-share company in Chicago. The director of marketing believes that the company’s future success depends on maximizing the number of annual memberships. As a result, our team aims to understand how casual riders and annual members use Cyclistic bikes differently. Based on these insights, our team will design a new marketing strategy to convert casual riders into annual members. However, Cyclistic executives must approve your recommendations, so they need to be supported by compelling data insights and professional data visualizations.

To answer this question, I will go through the process of:

**Ask:** What is the business question that has to be addressed and how to get to the answer? 

**Prepare:** How to gather good quality data to answer this question?

**Process:** Clean and prepare data for analysis.

**Analyze:** Analyze the data to get meaningful results, relating to the question to be answered.

**Share:** Make compelling visuals in line with what you want to convey to your stakeholders.

**Act:** Give recommendations to Cyclistic to improve their company. 


# Ask

This study has focused on the following question: 

**How do annual members and casual riders use Cyclistic bikes differently?**  

We want to figure this out so the marketing team of Cyclistic can set up a marketing campaign to convert casual users into annual members. 
To answer how annual members and casual riders use Cyclistic bikes differently I will analyzing data from the company, tracking each outgoing bike ride. I will inspect this data, clean it and analyze it for different patterns between casual users and annual users.



# Prepare 
**Data Source**

The data that is being used is from [Index of bucket "divvy-tripdata"](https://divvy-tripdata.s3.amazonaws.com/index.html) 
This data has been shared by by Lyft Bikes and Scooters, LLC (“Bikeshare”) and has been made available by Motivate International Inc.. They operate the City of Chicago’s (“City”) Divvy bicycle sharing service. This data has been downloaded and locally stored at C:\\Users\\Frank\\Documents\\Google_Course_Data\\Capstone_Project_Cyclistic.   

**Data Partitioning**

From this database I retrieved 12 files, containing monthly bike trip reports, from December '23 till November '24. Since 6 of these files were larger than 100 MB, I partitioned them using R. 

Code: [00 Database Partitioning.R](./00%20Database%20Partitioning.sql)

**Data Merging**

All the different databases, of all the montly reports, including the partitioned reports, have been merged together using SQL. 

Code: [02 Data Combining.sql](./02%20Data%20Combining.sql)


**Data exploration**

The data explorationg in this project has been done in BiQuery, using SQL. 

Code: : [03 Data Exploration.sql](./03%20Data%20Exploration.sql)
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

The data cleaning in this project has been done in BiQuery, using SQL. 

Code:  [04 Data Cleaning.sql](./04%20Data%20Cleaning.sql)


* Created a table for duplicate records
* Created a deduplicated table
* Created a table without missing station names
* Added a `Travel_time` column and created a new table
* Checked `Travel_time` values
* Created a table without negative travel times
* Removed wrongly rented bike
* Identified trips with travel times below 2 minutes where the `start_station_name` and `end_station_name` were the same.  
* Saved these "wrong rents" into a new table `Cyclistic.Cleaned_Wrong_Rents` to address potential errors.

# Analysis
The data explorationg in this project has been done in BiQuery, using SQL. 

Code:  [05 Data Analysis.sql](./05%20Data%20Analysis.sql)




*  Calculated maximum, minimum and average travel time per user type.

<img src="https://github.com/user-attachments/assets/33fb70e2-e305-4282-93fa-fe54de99b462" alt="AVG Travel Time" width="100">  

* Selected top 10 most popular stations per member type
![image](https://github.com/user-attachments/assets/179629dd-232d-40e3-99a2-94b2f3ca1900)

**The top 10 most popular stations of the annual (member) type of user don’t match the top 10 of the casual users.**
* Created a table displaying usage per member type per month.
* Calculated casual rides per station.
* Created a table with the day of the week added.
* Counted Rides Per Day of the Week per Member Type.

<img src="https://github.com/user-attachments/assets/cb5ed453-2a14-4ba7-a5d4-10b7cc60a7f0" alt="Weekday_Member1" width="300">
<img src="https://github.com/user-attachments/assets/2e6e40e3-2758-465c-a35a-f6f2050930f0" alt="Weekday_Casual2" width="300">



# Share 
**Key findings:**  

Main differences that I found durting this analysis were:

* Usage by weekday
  
The most popular biking days for the casual users were on Monday, Saturday and Sunday. 
The most popular biking days for the anual users were on Tuesday, Wednesda and Thursday. 
* Most popular stations
  
The most popular stations differed by used type. The casual users were probably mainly in the touristy areas, while the casual users were not. 
* Average trip duration
  
The casual users average trip duration was almost twice as long as the annual average trip duration. This is probably because the casual users were sightseeing, while the annual users were going to work or school. 

**Casual users are therefore likely mostly tourists, while annual users are likely mostly locals.**

# Act 

**My top three recommendations based on my analysis.**  
* You won’t be able to sell annual memberships to tourists. So don't target the popular stations for casual users.
* Your target audience will be at the station wich are used by locals, where you already find annual users.  
* You could target hotels and hostels. If they get an annual membership, they can rent it out to their customers.  