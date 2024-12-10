# Ask

A clear statement of the business task.

**There are three questions to guide the future marketing program, of which the first I have to answer:**

1. **How do annual members and casual riders use Cyclistic bikes differently?**  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?

**A description of all data sources used.**  
The data is sources from [Index of bucket "divvy-tripdata"](https://divvy-tripdata.s3.amazonaws.com/index.html)    
This data has been shared by by Lyft Bikes and Scooters, LLC (“Bikeshare”). They operate the City of Chicago’s (“City”) Divvy bicycle sharing service.  
And that data has been downloaded and locally stored at C:\\Users\\Frank\\Documents\\Google Course Data\\Capstone Project Cyclistic.   
The data has been made available by Motivate International Inc.

**Documentation of any cleaning or manipulation of data.**

**Data exploration**

Checked for distinct `member_casual` values:

* Verified that the column contains only the expected values (`member` and `casual`).

Checked for null values in `started_at` column:

* Ensured that there are no missing values in the `started_at` column.

Checked for null values in `ended_at` column:

* Confirmed that there are no missing values in the `ended_at` column.

Checked for missing values in `start_station_name`:

* Identified rows where the `start_station_name` is either null or empty.  
* Found that 1,080,470 rows (18.3% of total) have missing values.

Checked for missing values in `end_station_name`:

* Identified rows where the `end_station_name` is either null or empty.  
* Found that 1,108,680 rows (18.8% of total) have missing values.

Checked for missing values in `member_casual`:

* Confirmed that there are no missing or empty values in the `member_casual` column.

Checked for missing values in `start_lat`, `start_lng`, `end_lat`, and `end_lng`:

* Verified that there are no null values in the latitude and longitude columns for both start and end points.

Checked for duplicate values in `ride_id`:

* Found 5,902,977 distinct `ride_id` values compared to a total of 5,903,148 rows, indicating a difference of 171 duplicate entries.

**Data Cleaning**

Created a table for duplicate records:

* Identified and grouped `ride_id` values with a count greater than 1, indicating duplicate records. The duplicates were saved into a new table `Cyclistic.Duplicates`.

Checked details of duplicate records:

* Performed a join to examine details of duplicate records by comparing the `Duplicates` table with the original `Merge` table.  
* Found that the duplicates arise due to different time notations, e.g., `2024-05-31 23:56:47 UTC` versus `2024-05-31 23:56:47.556000 UTC`.

Created a deduplicated table:

* Used a `ROW_NUMBER()` function to assign a unique row number to each `ride_id` within duplicates.  
* Retained only the first occurrence of each `ride_id`, effectively removing duplicates.

Created a table without missing station names:

* Filtered rows to exclude records with null or empty values in the `start_station_name` and `end_station_name` columns.  
* Saved the cleaned dataset into a new table `Cyclistic.NoMissingStations`.

Added a `Travel_time` column and created a new table:

* Calculated travel time in minutes by subtracting `started_at` from `ended_at` and converting the result into minutes (rounded to two decimal places).  
* Cast latitude and longitude columns as `FLOAT64` to ensure consistent data types and stored this information in a new table `Cyclistic.Cleaned_Travel_Time`.

Checked `Travel_time` values:

* Analyzed calculated travel times and identified 44 records with negative values (indicating `ended_at` was earlier than `started_at`).  
* Decided to exclude these records to ensure data accuracy.

Created a table without negative travel times:

* Removed records with negative `Travel_time_in_Min` values from the dataset.  
* Saved the filtered dataset into a new table `Cyclistic.Cleaned_No_Wrong_Rents_No_Minus`.

Removed wrongly rented bikes:

* Identified trips with travel times below 2 minutes where the `start_station_name` and `end_station_name` were the same.  
* Saved these "wrong rents" into a new table `Cyclistic.Cleaned_Wrong_Rents` to address potential errors.

**Summary Of Analysis**

Calculated maximum and minimum travel time per user type:

Created a new table to calculate the maximum and minimum travel times (`Travel_time_in_Min`) for each `member_casual` type (member vs. casual).

Used the `MAX()` and `MIN()` aggregate functions to get the maximum and minimum travel times, grouped by user type.

![][image1]

Created a table displaying usage per member type per month:

* Created a new table showing the count of rides (`count_of_rides`) for each `member_casual` (member or casual) by year and month.  
* Extracted the year and month from the `started_at` timestamp.  
* Grouped the data by year, month, and `member_casual` to track the number of rides for each member type over time.

Created a table displaying the most used beginning stations per membership type:

* Created a table to compare the most used starting stations for both `member` and `casual` riders.  
* Used two subqueries (`member_usage` and `casual_usage`) to calculate the count of rides (`rides_per_station`) for both user types per starting station.  
* Joined these two subqueries on `start_station_name` to get the number of rides for both `member` and `casual` users per station.  
* Ordered the results by the number of rides for both `member` and `casual` users in descending order.

Calculated casual rides per station:

* Created a table to track the number of casual rides per starting station.  
* Used a subquery to count the number of rides (`rides_per_station`) for casual riders (`member_casual = 'casual'`) per `start_station_name`.  
* Ordered the results by the number of casual rides in descending order.

Filtered casual rides at the top 10 most popular stations for annual users:

* Queried the `Calculations_casual_rides_per_station` table to filter out casual rides at specific stations that are also popular for annual users (e.g., `Kingsbury St & Kinzie St`, `Clinton St & Washington Blvd`, etc.).  
* Retrieved data for the casual rides at these stations based on the `start_station_name` condition.

**Supporting visualizations and key findings.**

**Your top three recommendations based on your analysis.**

# Prepare

### **Guiding Questions**

* **Where is your**  
*  **data located?**  
* **How is the data organized?**

Per month and also collected per quarter. Since the last 12 months h,ave been asked and the last quarterly report is from 2020, while the monthly reports are available till 2024-11 I will use the monthly reports. 

* **Are there issues with bias or credibility in this data? Does your data ROCCC (Reliable, Original, Comprehensive, Current, Cited)?**

It is nowhere mentioned how the data has been gathered. However due to the nature of the data it seems likely that this data has been automatically generated by a system that tracks the incoming and outgoing bikes, time and date and the type of user etc..  

The data is unchanged and from the source, therefore reliable and original. It seems like it tracked all the in and out going bikes. We can not know this for 100% sure, because there might have been a temporary or long term broken tracking system at one or more locations. However, this has not been reported. The data is current, since the most recent data is from the previous months from now, which is November 2024\. 

Made available by Motivate International Inc.

Sources:

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202411-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202410-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202409-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202408-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202407-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202406-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202405-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202404-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202403-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202402-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2024). \[202401-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

Lyft Bikes and Scooters, LLC (“Bikeshare”). (2023). \[202312-divvy-tripdata.zip. Divvy-tripdata\]. Index of bucket "divvy-tripdata".

* **How are you addressing licensing, privacy, security, and accessibility?**

**License.** Bikeshare hereby grants to you a non-exclusive, royalty-free, limited, perpetual license to access, reproduce, analyze, copy, modify, distribute in your product or service and use the Data for any lawful purpose (“License”).  
Prohibited Conduct. The License does not authorize you to do, and you will not do or assist others in doing, any of the following

* Use the Data in any unlawful manner or for any unlawful purpose;  
* Host, stream, publish, distribute, sublicense, or sell the Data as a stand-alone dataset; provided, however, you may include the Data as source material, as applicable, in analyses, reports, or studies published or distributed for non-commercial purposes;  
* Access the Data by means other than the interface Bikeshare provides or authorizes for that purpose;  
* Circumvent any access restrictions relating to the Data;  
* Use data mining or other extraction methods in connection with Bikeshare's website or the Data;  
* Attempt to correlate the Data with names, addresses, or other information of customers or Members of Bikeshare; and  
* State or imply that you are affiliated, approved, endorsed, or sponsored by Bikeshare.  
* Use or authorize others to use, without the written permission of the applicable owners, the trademarks or trade names of Lyft Bikes and Scooters, LLC, the City of Chicago or any sponsor of the Divvy service. These marks include, but are not limited to DIVVY, and the DIVVY logo, which are owned by the City of Chicago.  
    
* **How did you verify the data’s integrity?**

Data integrity refers to the accuracy, consistency, and reliability of data throughout its lifecycle, ensuring that it remains unaltered and trustworthy. All the files are similarly structured, so therefore consistent. 

* **How does it help you answer your question?**

By finding out the different characteristics of the different user types, one can search for patterns. 

Things I can check out per type of user

Rideable\_type

Started at/ended at. Date, popularity per day of the week, duration per ride, location by coordinates of popular stations,  popular starting/ending stations. 

* **Are there any problems with the data?**

Yes, some of the station\_ID’s are missing.   
The bike\_ID format is also not consistent. Some of them are just numbers, others have letters and numbers. Doesn’t have to be a problem, but it is at least less structured than just having one type of format.   
The databases also contain a lot of rows, so Google Sheets might not be sufficient, and I will have to use SQL. In fact I had to split some of them in two using R 

**202011-divvy-tripdata.csv is too large to import into sheets.** 

### **Key Tasks**

* **Download data and store it appropriately.**  
* **Identify how it’s organized.**  
* **Sort and filter the data.**  
* **Determine the credibility of the data.**

### **Deliverable**

* **A description of all data sources used.**

# Process

### **Guiding Questions**

* **What tools are you choosing and why?**  
  I will use SQL, because the files are too large for Google Sheets and Excel  
  The files are also too large to upload to SQL [Divvy\_Trips\_2019\_Q1 \- Google Spreadsheets](https://docs.google.com/spreadsheets/d/1uCTsHlZLm4L7-ueaSLwDg0ut3BP_V4mKDo2IMpaXrk4/template/preview?pli=1&resourcekey=0-dQAUjAu2UUCsLEQQt20PDA#gid=1797029090). Therefore I split some files into two, so I could upload them.   
    
    
* **Have you ensured your data’s integrity?**  
    
* **What steps have you taken to ensure that your data is clean?**

**202409-divvy-tripdata-less-columns1**  
All the ride\_id’s are unique, so there are no duplicates. 

I checked for distinct values in Rideable\_type and got the three expected results: electric\_bike, electric\_scooter and classic\_bike.

I checked whether any started\_at (=start date and time) had NULL or empty data, it didn’t.

I checked whether any ended\_at (=end date and time) had NULL or empty data, it didn’t.

I checked whether start\_station\_name had any empty data: 50767 records were empty of the total 410638 records, which is **12.36%.** There was no starting\_station added in this data. On an actual project in real life I would ask why this has happened. 

Where the start\_station\_name is missing, also the start\_station\_id is missing. 

39653/410638 \= 9,65% end\_station\_names were empty. 

However, whenever a start\_station\_name is empty I could use the start\_lat and start\_lng to identify the location and the team could later figure out which station it was. 

225/410638 \= 0.0547% of the end\_lat and end\_lng fields were ‘NA’,  also the length of the coordinates differs, e.g. 42.07,  87.7 instead of the expected  6 digit  42.064854,  \-87.715297. Two digit coordinates still give about 1.1 km of accuracy, so this is probably enough to identify the station. 

I checked for distinct member\_casual values, and received the expected ‘member’ and ‘casual’. 

All the data types are correct, except the ‘end\_lat’ and ‘end\_lng’ column, which are STRINGs instead of FLOATs. This won’t have any effect on the analysis. But may affect the method to search for empty values. 

The maximum travel times are all just below 1500 min. They all have in common that they have no end station. These are probably bikes which were picked up by the company  because they weren’t returned by the driver. I will need to remove these rows, so keep the data accurate. 

Of the rows which have no end\_station\_value, the highest 259 travel time all have a travel\_time\_in\_minutes in between 1499.62 and 1500\. The starting and ending dates show no pattern. I probably have to remove them.

 Also, I might have to remove all the columns without an end or starting station. 

**255 rows have no end station AND now end coordinates, these records all have a travel time between 1499,62 and 1500\.** 

* **How can you verify that your data is clean and ready to analyze?**

**Check data types**

**Data range**

**Data constraints**

**Data consistency**

**Data structure**

**Code validation**

* **Have you documented your cleaning process so you can review and share those results?**  
  **Yes**

### 

### **Key Tasks**

* **Check the data for errors.**  
* **Choose your tools.**  
* **Transform the data so you can work with it effectively.**  
* **Document the cleaning process.**

### **Deliverable**

* **Documentation of any cleaning or manipulation of data.**

Add column ride\_length  
Average bike duration **this is still with the 1500 min. values\!**   
Casual: 21.76 min  
Member: 12.04 min 

**Add column day\_of\_week**

# Analyze

### **Guiding Questions**

* **How should you organize your data to perform analysis on it?**  
* **Has your data been properly formatted?**  
* **What surprises did you discover in the data?**  
* **What trends or relationships did you find in the data?**  
* **How will these insights help answer your business questions?**

### **Key Tasks**

* **Aggregate your data so it’s useful and accessible.**  
* **Organize and format your data.**  
* **Perform calculations.**  
* **Identify trends and relationships.**

### **Deliverable**

* **A summary of your analysis.**

**Type of bike per user\!\!**   
**Popular stations per user type**  
**Average travel length per user type**   
**Possibly something with the coordinates of the stations.** 

**Mayse use actual numbers instead of percentages so different databases can be aggregated.** 

**Share**

**Act**

Variabelen waarop casual en annual kunnen verschillen:  
Start/ end station  
Tijd   
Dag vd week  
Rideable bike

Stakeholders: Marketing team 

ROCC  
Reliable  
Original  
Comprehensive  
Current – van 2020-2021, dus wel een paar jaar oud   
Cited

**Accuracy**: Ensuring that data correctly represents the real-world entity or event it is supposed to depict.  
**Consistency**: Data must remain consistent across different databases, tables, or systems, even during updates or modifications.  
**Reliability**: Data must remain intact and unchanged unless appropriately authorized, avoiding corruption or unintended alterations.

Legality   
Lyft Bikes and Scooters, LLC (“Bikeshare”) operates the City of Chicago’s (“City”) Divvy bicycle sharing service. Bikeshare and the City are committed to supporting bicycling as an alternative transportation option. As part of that commitment, the City permits Bikeshare to make certain Divvy system data owned by the City (“Data”) available to the public, subject to the terms and conditions of this License Agreement (“Agreement”). By accessing or using any of the Data, you agree to all of the terms and conditions of this Agreement.

 Three questions will guide the future marketing program:   
1\. How do annual members and casual riders use Cyclistic bikes differently?   
2\. Whywouldcasualriders buy Cyclistic annual memberships?   
3\. How can Cyclists use digital media to influence casual riders to become members?

You will produce a report with the following deliverables:  
1\. A clear statement of the business task   
2\. A description of al data sources used   
3\. Documentation of any cleaning or manipulation of data   
4\. A summary of your analysis   
5\. Supporting visualizations and key findings   
6\. Your top three recommendations based on your analysis

[image1]: <data:image/png;base64,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>