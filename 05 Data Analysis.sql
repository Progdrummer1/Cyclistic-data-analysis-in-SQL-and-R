--Calculating the maximum and minimum travel time per user type
CREATE TABLE `cyclistic2-444011.Cyclistic.Calculations_Travel_Time` AS
SELECT
member_casual AS member_casual,
 MAX(Travel_time_in_Min) AS max_travel_in_min,
 MIN(Travel_time_in_Min) AS min_travel_in_min,
FROM
  `cyclistic2-444011.Cyclistic.Cleaner`
GROUP BY
  member_casual
  --       Max     Min   AVG
  --casual 1509.37 0.02 24.44
  --member 1497.65 0.02 12.59


--creating a table displaying the usage per member type per month
CREATE TABLE `cyclistic2-444011.Cyclistic.Calculations_Usage_Per_Month_Per_Membership_Type` AS
SELECT
  member_casual,
  EXTRACT(YEAR FROM TIMESTAMP(started_at)) AS year,
  EXTRACT(MONTH FROM TIMESTAMP(started_at)) AS month,
  COUNT(*) AS count_of_rides
FROM
  `cyclistic2-444011.Cyclistic.Cleaner`
GROUP BY
  year, month, member_casual
ORDER BY
  member_casual, year ASC, month ASC;

--creating a table displaying the most used beginning stations per membership_type
--Niet de bovenstaande, maar ik denk deze:
CREATE TABLE `cyclistic2-444011.Cyclistic.Calculations_Most_Used_Stations_Per_Membership_Type` AS
WITH member_usage AS (
  SELECT
    member_casual,
    start_station_name,
    COUNT(started_at) AS rides_per_station
  FROM 
    `cyclistic2-444011.Cyclistic.Cleaner`
  WHERE
    member_casual = 'member'
  GROUP BY
    member_casual,
    start_station_name
),
casual_usage AS (
  SELECT
    member_casual,
    start_station_name,
    COUNT(started_at) AS rides_per_station
  FROM 
    `cyclistic2-444011.Cyclistic.Cleaner`
  WHERE
    member_casual = 'casual'
  GROUP BY
    member_casual,
    start_station_name
)
SELECT
  member_usage.start_station_name,
  member_usage.rides_per_station AS member_rides,
  casual_usage.rides_per_station AS casual_rides
FROM
  member_usage
JOIN
  casual_usage
ON
  member_usage.start_station_name = casual_usage.start_station_name
ORDER BY
  member_rides DESC, casual_rides DESC;

-- Casual rides per staion
CREATE TABLE `cyclistic2-444011.Cyclistic.Calculations_casual_rides_per_station` AS
WITH casual_usage AS (
  SELECT
    member_casual,
    start_station_name,
    COUNT(started_at) AS rides_per_station
  FROM
    `cyclistic2-444011.Cyclistic.Cleaner`
  WHERE
    member_casual = 'casual'
  GROUP BY
    member_casual,
    start_station_name
)
SELECT
  casual_usage.start_station_name,
  casual_usage.rides_per_station AS casual_rides,
FROM
  casual_usage
ORDER BY
  casual_rides DESC

-- amount of casual at top 10 most popular annual users. 
SELECT
  *
FROM
  `cyclistic2-444011.Cyclistic.Calculations_casual_rides_per_station`
WHERE
start_station_name =  'Kingsbury St & Kinzie St' OR
start_station_name =  'Clinton St & Washington Blvd' OR
start_station_name =  'Clinton St & Madison St' OR
start_station_name =  'Clark St & Elm St' OR
start_station_name =  'Clinton St & Jackson Blvd' OR
start_station_name =  'Wells St & Concord Ln' OR
start_station_name =  'Wells St & Elm St' OR
start_station_name =  'Dearborn St & Erie St' OR
start_station_name =  'University Ave & 57th St' OR
start_station_name =  'State St & Chicago Ave'
