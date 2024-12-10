--After uploading all the CSV files to Bigquery I imported all tables and corrected end_lat from string to FLOAT. 
CREATE TABLE `cyclistic-443809.Cyclistic_.CorrectDataType` AS
SELECT
    ride_id,
    Rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    member_casual,
    SAFE_CAST(end_lat AS FLOAT64) AS end_lat_float,
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng_float
   
FROM
    `cyclistic-443809.Cyclistic_.202409-divvy-tripdata-less-columns1`


--Import all tables and correct end_lat from string to FLOAT.
CREATE TABLE `cyclistic2-444011.Cyclistic.Merge` AS




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2023_12`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_01`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_02`




UNION ALL




SELECT  ride_id,
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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_03`




UNION ALL




SELECT  ride_id,
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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_04`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng




FROM `cyclistic2-444011.Cyclistic.2024_05_part1`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_05_part2`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_06_part1`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_06_part2`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_07_part1`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_07_part2`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_08_part1`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_08_part2`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_09_part1`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_09_part2`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_10_part1`




UNION ALL




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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_10_part2`


UNION ALL


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
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_11`




    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    member_casual,
    SAFE_CAST(end_lat AS FLOAT64) AS end_lat,
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM `cyclistic2-444011.Cyclistic.2024_11`

