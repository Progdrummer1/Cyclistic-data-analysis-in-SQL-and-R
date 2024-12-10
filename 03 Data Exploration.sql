--Checked for distinct member_casual values
SELECT
    DISTINCT member_casual
FROM
    `cyclistic-443809.Cyclistic.Merge`
--Received the expected ‘member’ and ‘casual’.

-- checking for values in started_at
SELECT
  started_at
FROM
  `cyclistic2-444011.Cyclistic.Merge`
WHERE
  started_at IS NULL;
--no results


-- checking for values in ended_at
SELECT
  ended_at
 FROM
  `cyclistic2-444011.Cyclistic.Merge`
WHERE
  ended_at IS NULL;
--no results


-- checking for missing values in start_station_name
SELECT
  start_station_name
 FROM
  `cyclistic2-444011.Cyclistic.Merge`
WHERE
  start_station_name IS NULL OR start_station_name = '';
  --1080470
  --1080470/5.903.148 = 18.3%

-- checking for missing values in ended_station_name
SELECT
  end_station_name
FROM
  `cyclistic2-444011.Cyclistic.Merge`
WHERE
  end_station_name IS NULL OR end_station_name = '';
  --1108680/5.903.148 = 18.8%


-- checking for values in member_casual
SELECT
  member_casual
FROM
  `cyclistic2-444011.Cyclistic.Merge`
WHERE
  member_casual IS NULL OR member_casual = '';
  --0


-- checking for values in start_lat/start_lng/end_lat/end_lng
SELECT
  start_lng
FROM
  `cyclistic2-444011.Cyclistic.Merge`
WHERE
  start_lng IS NULL;
  --all give 0

-- checking duplicates
SELECT
  DISTINCT(ride_id)
FROM
  `cyclistic2-444011.Cyclistic.Merge`
--unique values: 5902977 distinct(ride_id)

SELECT
  ride_id
FROM
  `cyclistic2-444011.Cyclistic.Merge`
--total values:  5903148 
--difference:    171

