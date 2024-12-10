-- making a table for the duplicates
CREATE TABLE `cyclistic2-444011.Cyclistic.Duplicates` AS
SELECT
  ride_id,
  COUNT(ride_id) as counted
FROM
  `cyclistic2-444011.Cyclistic.Merge`
GROUP BY
  ride_id
HAVING
  counted > 1


-- Checking details of duplicates
SELECT
  *
FROM
  `cyclistic2-444011.Cyclistic.Duplicates` AS Duplicates
LEFT JOIN
  `cyclistic2-444011.Cyclistic.Merge` AS `Merge`
ON
  `Merge`.ride_id = Duplicates.ride_id
-- They all come from different time notations:
--2024-05-31 23:56:47 UTC vs 2024-05-31 23:56:47.556000 UTC

-- Creating table without duplicates
WITH deduplicated AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY ride_id) AS row_num
  FROM
    `cyclistic2-444011.Cyclistic.Merge`
)
SELECT *
FROM deduplicated
WHERE row_num = 1;

-- making a table without missing stations
CREATE TABLE `cyclistic2-444011.Cyclistic.NoMissingStations` AS
SELECT
  *
FROM
  `cyclistic2-444011.Cyclistic.No_Duplicates`
WHERE
  start_station_name IS NOT NULL AND start_station_name != ''
  AND
  end_station_name IS NOT NULL AND end_station_name != ''

-- New table with Travel_time values
CREATE TABLE `cyclistic2-444011.Cyclistic.Cleaned_Travel_Time` AS
SELECT
  ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    member_casual,
    SAFE_CAST(end_lat AS FLOAT64) AS end_lat,
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng,
  ROUND(TIMESTAMP_DIFF(ended_at, started_at, SECOND)/60,2) as Travel_time_in_Min
FROM
  `cyclistic2-444011.Cyclistic.Cleaned`

-- checking Travel_time values
SELECT
  ride_id,
 ROUND(TIMESTAMP_DIFF(ended_at, started_at, SECOND)/60,2) as Travel_time
FROM
  cyclistic2-444011.Cyclistic.NoMissingStations
GROUP BY
  Travel_time, ride_id
ORDER BY
  Travel_time
--44 turn out to be negative. The arrival time is earlier than the departure time. I am not sure what this means, they could be switched. To be sure I will remove these. 

-- New table with Travel_time values without minus duration time
CREATE TABLE   `cyclistic2-444011.Cyclistic.Cleaned_No_Wrong_Rents_No_Minus` AS
SELECT
 *
FROM
  `cyclistic2-444011.Cyclistic.Cleaned_No_Wrong_Rents`
WHERE
  Travel_time_in_Min > 0
ORDER BY
  Travel_time_in_Min

-- Removing wrongly rented bikes below 2 min travel time and to the same station. 
CREATE TABLE `cyclistic2-444011.Cyclistic.Cleaned_Wrong_Rents` AS
SELECT
  ride_id,
  start_station_name,
  end_station_name,
  ROUND(TIMESTAMP_DIFF(ended_at, started_at, SECOND)/60,2) as Travel_time
FROM
  cyclistic2-444011.Cyclistic.NoMissingStations
WHERE
  start_station_name = end_station_name
GROUP BY
  Travel_time, ride_id, start_station_name, end_station_name
HAVING
  Travel_time <2
ORDER BY
  Travel_time

  
